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
	@brief Testbench for IngressFifo
 */
module IngressFifoSim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clock generation

	logic	rx_clk = 0;		//125 MHz
	logic	clk_mem = 0;	//187.5 MHz

	always begin
		#4;
		rx_clk = !rx_clk;
	end

	always begin
		#2.666;
		clk_mem = !clk_mem;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Packet generators

	EthernetRxBus[14:0]	port_rx_bus;
	logic[14:0]			port_next_packet	= 0;

	vlan_t[14:0]		port_vlan;
	wire[14:0]			tagged_allowed;
	wire[14:0]			untagged_allowed;

	for(genvar g=0; g<15; g=g+1) begin

		//all rx ports use the same clock for now
		assign port_rx_clk[g] = rx_clk;

		//allow tagged and untagged on all traffic
		assign tagged_allowed[g] = 1;
		assign untagged_allowed[g] = 1;

		//g3 has two packets tagged for vlan 5 and two untagged using the port native vlan (4)
		if(g == 3) begin
			PcapPacketGenerator #(
				.FILENAME("../../../../../../../testdata/2tagged-2untagged.pcapng")
			) gen (
				.clk(rx_clk),
				.next(port_next_packet[g]),
				.bus(port_rx_bus[g])
			);

			assign port_vlan[g] = 4;
		end

		//g4 has ten untagged pings using the port native vlan(6)
		else if(g == 4) begin
			PcapPacketGenerator #(
				.FILENAME("../../../../../../../testdata/pings.pcapng")
			) gen (
				.clk(rx_clk),
				.next(port_next_packet[g]),
				.bus(port_rx_bus[g])
			);

			assign port_vlan[g] = 6;
		end

		//all other ports get tied off, on vlan 1, and never send anything
		else begin
			assign port_rx_bus[g] = 0;
			assign port_vlan[g] = 1;
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// RAM emulator

	wire				ram_wr_en;
	wire[17:0]			ram_wr_addr;
	wire[143:0]			ram_wr_data;

	wire				ram_rd_en;
	wire[17:0]			ram_rd_addr;
	wire[143:0]			ram_rd_data;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The DUT

	wire[14:0]			port_rx_clk;
	logic[14:0]			port_link_up	= 0;

	IngressFifo dut(
		.port_rx_clk(port_rx_clk),
		.port_link_up(port_link_up),
		.port_rx_bus(port_rx_bus),

		.port_vlan(port_vlan),
		.tagged_allowed(tagged_allowed),
		.untagged_allowed(untagged_allowed),

		.clk_ram_ctl(clk_mem),
		.ram_wr_en(ram_wr_en),
		.ram_wr_addr(ram_wr_addr),
		.ram_wr_data(ram_wr_data),

		.ram_rd_en(),
		.ram_rd_addr(),
		.ram_rd_valid(),
		.ram_rd_data()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test logic

	logic[7:0] state = 0;
	logic[15:0] count = 0;

	always_ff @(posedge rx_clk) begin

		port_next_packet	<= 0;

		case(state)

			//Bring up all links
			0: begin
				port_link_up	<= 15'h7fff;
				state			<= 1;
			end

			1: begin
				count	<= count + 1;
				if(count == 'h5)
					state <= 2;
			end

			//Send a single tagged frame on vlan 5 to port g3
			2: begin
				port_next_packet[3]	<= 1;
				state				<= 3;
			end

			//Send a single untagged frame on vlan 6 to port g4
			3: begin
				port_next_packet[4]	<= 1;
				state				<= 4;
			end

			//TODO
			4: begin
			end

		endcase

	end

endmodule
