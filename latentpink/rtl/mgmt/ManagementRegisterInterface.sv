`timescale 1ns/1ps
`default_nettype none
/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2023 Andrew D. Zonenberg and contributors                                                              *
* All rights reserved.                                                                                                 *
*                                                                                                                      *
* Redistribution and use in source and binary forms, with or without modification, are permitted provided that the     *
* following conditions are met:                                                                                        *
*                                                                                                                      *
*    * Redistributions of source code must retain the above copyright notice, this list of conditions, and the         *
*      following disclaimer.                                                                                           *
*                                                                                                                      *
*    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the       *
*      following disclaimer in the documentation and/or other materials provided with the distribution.                *
*                                                                                                                      *
*    * Neither the name of the author nor the names of any contributors may be used to endorse or promote products     *
*      derived from this software without specific prior written permission.                                           *
*                                                                                                                      *
* THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   *
* TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL *
* THE AUTHORS BE HELD LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES        *
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR       *
* BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT *
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE       *
* POSSIBILITY OF SUCH DAMAGE.                                                                                          *
*                                                                                                                      *
***********************************************************************************************************************/

`include "EthernetBus.svh"

/**
	@file
	@author Andrew D. Zonenberg
	@brief Container for management logic

	Management registers have 16-bit addresses and are 8 bits in size.
 */
module ManagementRegisterInterface #(
	parameter NUM_PORTS						= 15
)(

	//Core clock for the management domain
	input wire						clk,

	//Data bus from QSPI interface or simulation bridge
	input wire						rd_en,
	input wire[15:0]				rd_addr,
	output logic					rd_valid	= 0,
	output logic[7:0]				rd_data		= 0,

	input wire						wr_en,
	input wire[15:0]				wr_addr,
	input wire[7:0]					wr_data,

	//Device information bus
	//Must be divided down from core clock, but phase aligned
	input wire						die_serial_valid,
	input wire[63:0]				die_serial,
	input wire						idcode_valid,
	input wire[31:0]				idcode,

	//Configuration registers in port RX clock domains
	input wire[NUM_PORTS-1:0]		port_rx_clk,
	output vlan_t[NUM_PORTS-1:0]	port_rx_vlan,
	output wire[NUM_PORTS-1:0]		port_rx_tagged_allowed,
	output wire[NUM_PORTS-1:0]		port_rx_untagged_allowed,

	//Configuration registers in core clock domain
	output vlan_t[NUM_PORTS-1:0]	port_vlan		= 0,
	output logic[NUM_PORTS-1:0]		port_is_trunk	= 0
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synchronizers for per-port configuration registers

	logic[NUM_PORTS-1:0]	port_vlan_updated	= 0;

	logic[NUM_PORTS-1:0]	port_tagged_allowed		= 0;
	logic[NUM_PORTS-1:0]	port_untagged_allowed	= 0;
	logic[NUM_PORTS-1:0]	port_tagmode_updated	= 0;

	initial begin
		for(integer i=0; i<NUM_PORTS; i=i+1) begin
			port_vlan[i]	= 0;
		end
	end

	for(genvar g=0; g<NUM_PORTS; g=g+1) begin : portsyncs

		RegisterSynchronizer #(
			.WIDTH($bits(vlan_t))
		) sync_rx_vlan (
			.clk_a(clk),
			.en_a(port_vlan_updated[g]),
			.ack_a(),
			.reg_a(port_vlan[g]),

			.clk_b(port_rx_clk[g]),
			.updated_b(),
			.reset_b(1'b0),
			.reg_b(port_rx_vlan[g])
		);

		//TODO: TX vlan stuff

		RegisterSynchronizer #(
			.WIDTH(1)
		) sync_rx_tagged_allowed (
			.clk_a(clk),
			.en_a(port_tagmode_updated[g]),
			.ack_a(),
			.reg_a(port_tagged_allowed[g]),

			.clk_b(port_rx_clk[g]),
			.updated_b(),
			.reset_b(1'b0),
			.reg_b(port_rx_tagged_allowed[g])
		);

		RegisterSynchronizer #(
			.WIDTH(1)
		) sync_rx_untagged_allowed (
			.clk_a(clk),
			.en_a(port_tagmode_updated[g]),
			.ack_a(),
			.reg_a(port_untagged_allowed[g]),

			.clk_b(port_rx_clk[g]),
			.updated_b(),
			.reset_b(1'b0),
			.reg_b(port_rx_untagged_allowed[g])
		);

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// List of named registers

	//Note that ManagementBridge uses MSB of address as read/write flag
	//so we actually have only 15 bits available for addressing

	//must match ManagementRegisterInterface in FPGAInterface.h
	typedef enum logic[15:0]
	{
		//FPGA die information
		REG_FPGA_IDCODE		= 16'h0000,		//4 bytes of IDCODE
		REG_FPGA_IDCODE_1	= 16'h0001,
		REG_FPGA_IDCODE_2	= 16'h0002,
		REG_FPGA_IDCODE_3	= 16'h0003,
		REG_FPGA_SERIAL		= 16'h0004,		//8 bytes of die serial
		REG_FPGA_SERIAL_1	= 16'h0005,
		REG_FPGA_SERIAL_2	= 16'h0006,
		REG_FPGA_SERIAL_3	= 16'h0007,
		REG_FPGA_SERIAL_4	= 16'h0008,
		REG_FPGA_SERIAL_5	= 16'h0009,
		REG_FPGA_SERIAL_6	= 16'h000a,
		REG_FPGA_SERIAL_7	= 16'h000b,

		//Per port configuration starts here
		REG_INTERFACE_BASE	= 16'h4000,

		//helper just so we can use commas to separate list items
		REG_LAST

	} regid_t;

	//Amount of register address space allocated to each port
	localparam INTERFACE_STRIDE	= 16'h0400;

	//Register offsets within each interface block
	typedef enum logic[15:0]
	{
		REG_VLAN_NUM		= 16'h0000,		//VLAN number
		REG_VLAN_NUM_1		= 16'h0001,
		REG_TAG_MODE		= 16'h0002,		//[0] = inbound tagged traffic allowed
											//[1] = inbound untagged traffic allowed
											//[2] = tag outbound traffic to native vlan
											//[3] = tag outbound traffic to other vlans
											//[4] = port should be considered a trunk for forwarding decisions

		//TODO

		REG_IF_LAST
	} ifoff_t;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Address decoding and muxing logic

	logic		reading	= 0;

	//Split interface config into port number and register ID
	localparam PORT_BITS 	= 4;
	localparam REGID_BITS	= 10;
	logic[PORT_BITS-1:0]	rd_port		= 0;
	logic[REGID_BITS-1:0]	rd_regid	= 0;

	logic[PORT_BITS-1:0]	wr_port		= 0;
	logic[REGID_BITS-1:0]	wr_regid	= 0;

	always_ff @(posedge clk) begin

		rd_valid				<= 0;
		port_vlan_updated		<= 0;
		port_tagmode_updated	<= 0;

		//Start a new read
		if(rd_en)
			reading	<= 1;

		//Continue a read
		if(rd_en || reading) begin

			//Interface registers are decoded separately
			if(rd_addr >= REG_INTERFACE_BASE) begin

				//Extract port number and register ID
				rd_port	= rd_addr[REGID_BITS +: PORT_BITS];
				rd_regid = rd_addr[0 +: REGID_BITS];

				//All OK if we get here
				rd_valid	<= 1;
				reading		<= 0;

				//Note that multi byte registers are little endian for easier access from ARM (and x86 simulation) hosts

			end

			//Data not ready? Wait
			else if( (rd_addr >= REG_FPGA_IDCODE) && (rd_addr <= REG_FPGA_IDCODE_3) && !idcode_valid) begin
			end
			else if( (rd_addr >= REG_FPGA_SERIAL) && (rd_addr <= REG_FPGA_SERIAL_7) && !die_serial_valid) begin
			end

			//Data is ready
			else begin

				rd_valid	<= 1;
				reading		<= 0;

			end

			//Main register decoder
			case(rd_addr)

				REG_FPGA_IDCODE:	rd_data <= idcode[3*8 +: 8];
				REG_FPGA_IDCODE_1:	rd_data <= idcode[2*8 +: 8];
				REG_FPGA_IDCODE_2:	rd_data <= idcode[1*8 +: 8];
				REG_FPGA_IDCODE_3:	rd_data <= idcode[0*8 +: 8];

				REG_FPGA_SERIAL:	rd_data <= die_serial[7*8 +: 8];
				REG_FPGA_SERIAL_1:	rd_data <= die_serial[6*8 +: 8];
				REG_FPGA_SERIAL_2:	rd_data <= die_serial[5*8 +: 8];
				REG_FPGA_SERIAL_3:	rd_data <= die_serial[4*8 +: 8];
				REG_FPGA_SERIAL_4:	rd_data <= die_serial[3*8 +: 8];
				REG_FPGA_SERIAL_5:	rd_data <= die_serial[2*8 +: 8];
				REG_FPGA_SERIAL_6:	rd_data <= die_serial[1*8 +: 8];
				REG_FPGA_SERIAL_7:	rd_data <= die_serial[0*8 +: 8];

				default: begin
					rd_data	<= 0;
				end

			endcase

		end

		//Execute a write
		if(wr_en) begin

			//Extract port number and register ID
			wr_port	= wr_addr[REGID_BITS +: PORT_BITS];
			wr_regid = wr_addr[0 +: REGID_BITS];

			//Note that multi byte registers are little endian for easier access from ARM (and x86 simulation) hosts
			case(wr_regid)

				REG_VLAN_NUM:	port_vlan[wr_port][7:0]	<= wr_data;
				REG_VLAN_NUM_1: begin
					port_vlan[wr_port][11:8]	<= wr_data[3:0];
					port_vlan_updated[wr_port]	<= 1;
				end

				REG_TAG_MODE: begin
					port_tagged_allowed[wr_port]	<= wr_data[0];
					port_untagged_allowed[wr_port]	<= wr_data[1];
					port_tagmode_updated[wr_port]	<= 1;

					port_is_trunk[wr_port]			<= wr_data[4];
				end

			endcase

		end

	end

endmodule
