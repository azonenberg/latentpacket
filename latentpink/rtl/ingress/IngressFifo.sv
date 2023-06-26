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
	@brief Input FIFO block, writes data from each of the inbound switch ports to QDR-II+

	With a 36 Mbit SRAM (32 Mbit after FEC overhead) and 15 ports (round to 16 to keep addressing simple),
	we have 2 Mbits per port of buffer.

	This is 256 kB or 16K (0x4000) 128-bit data blocks, and we need 14 pointer bits per port
 */
module IngressFifo #(
	parameter NUM_PORTS			= 15,
	parameter PORT_FIFO_SIZE	= 'h4000,

	localparam PTR_BITS			= $clog2(PORT_FIFO_SIZE),
	localparam PORT_BITS		= $clog2(NUM_PORTS),
	localparam ADDR_BITS		= PTR_BITS + PORT_BITS
)(
	//Inbound data from network ports
	input wire[NUM_PORTS-1:0]				port_rx_clk,
	input wire[NUM_PORTS-1:0]				port_link_up,
	input wire EthernetRxBus[NUM_PORTS-1:0]	port_rx_bus,

	//RAM interface
	input wire								clk_ram_ctl,
	output wire								ram_wr_en,
	output logic[ADDR_BITS-1:0]				ram_wr_addr	= 0,
	output wire[143:0]						ram_wr_data
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Expand data to 128 bit width and move into SRAM clock domain

	logic[NUM_PORTS-1:0]	port_frame_start	= 0;
	wire					port_frame_ready[NUM_PORTS-1:0];
	wire[10:0]				port_frame_bytelen[NUM_PORTS-1:0];
	wire					port_mem_valid[NUM_PORTS-1:0];
	wire[127:0]				port_mem_data[NUM_PORTS-1:0];
	wire					port_frame_done[NUM_PORTS-1:0];

	for(genvar g=0; g<NUM_PORTS; g=g+1) begin : cdcs
		IngressCDC cdc(
			.rx_clk(port_rx_clk[g]),
			.link_up(port_link_up[g]),
			.rx_bus(port_rx_bus[g]),

			.clk_mem(clk_ram_ctl),
			.mem_frame_ready(port_frame_ready[g]),
			.mem_frame_bytelen(port_frame_bytelen[g]),
			.mem_valid(port_mem_valid[g]),
			.mem_data(port_mem_data[g]),
			.mem_frame_done(port_frame_done[g]),
			.mem_frame_start(port_frame_start[g])
		);
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Arbitration / muxing to single data stream

	//Figure out which port we want to pop from if we were to start a new frame right now
	logic[PORT_BITS-1:0]	rr_port	= 0;
	logic[PORT_BITS-1:0]	next_port;
	logic					next_port_valid;;
	always_comb begin

		next_port		= 0;
		next_port_valid	= 0;

		//If round robin port wants to send, let it
		if(port_frame_ready[rr_port]) begin
			next_port 		= rr_port;
			next_port_valid	= 1;
		end

		//Nope. Search ports from highest to lowest number
		//(by convention, 10G ports are highest numbered so they get max priority)
		//and pick the first one that has something for us
		else begin
			for(integer i=NUM_PORTS-1; i>=0; i=i-1) begin
				if(port_frame_ready[i] && !next_port_valid) begin
					next_port		= i;
					next_port_valid = 1;
				end
			end
		end

		//TODO: need to check if the dest port has filled up
		//Cannot send if there's not a frame worth of free space in the SRAM
		//(this might corrupt an existing frame etc)

	end

	logic					fec_wr_en	= 0;
	logic[127:0]			fec_wr_data	= 0;

	logic					busy 			= 0;
	logic[PORT_BITS-1:0]	current_port	= 0;

	/*
		Fabric for LATENTPINK is exactly full bandwidth so we need to be able to pop frames
		back to back with no gaps.

		Do control logic combinatorially to avoid a cycle of round trip delay
	 */
	always_comb begin
		port_frame_start	= 0;

		//See if a new frame is ready to start
		if(next_port_valid) begin

			//If so, start if we're idle or finishing this clock
			if(!busy || port_frame_done[current_port])
				port_frame_start[next_port]	= 1;
		end

	end

	logic[PORT_BITS-1:0]	fec_wr_port		= 0;

	always_ff @(posedge clk_ram_ctl) begin

		//Start a new frame
		if(port_frame_start) begin
			busy			<= 1;
			rr_port			<= rr_port + 1;

			//Port becomes current immediately, since we already have frame data ready to forward
			current_port	= next_port;
		end

		//Forward frame data
		fec_wr_en		<= port_mem_valid[current_port];
		fec_wr_data		<= port_mem_data[current_port];
		fec_wr_port		<= current_port;

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// FEC encoding

	HammingEncoder #(
		.DATA_BITS(64)
	) ecc_hi (
		.clk(clk_ram_ctl),

		.valid_in(fec_wr_en),
		.data_in(fec_wr_data[127:64]),

		.valid_out(ram_wr_en),
		.data_out(ram_wr_data[143:72])
	);

	HammingEncoder #(
		.DATA_BITS(64)
	) ecc_lo (
		.clk(clk_ram_ctl),

		.valid_in(fec_wr_en),
		.data_in(fec_wr_data[63:0]),

		.valid_out(),	//redundant, ram_wr_en driven by high lane
		.data_out(ram_wr_data[71:0])
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SRAM write address generation

	logic[PTR_BITS-1:0] fifo_wr_ptr[NUM_PORTS-1:0];

	initial begin
		for(integer i=0; i<NUM_PORTS; i=i+1) begin
			fifo_wr_ptr[i] = 0;
		end
	end

	always_ff @(posedge clk_ram_ctl) begin

		//FEC has single cycle latency, so generate address any time data arrives at the FEC input
		if(fec_wr_en) begin
			ram_wr_addr[PTR_BITS +: PORT_BITS]	<= fec_wr_port;
			ram_wr_addr[0 +: PTR_BITS]			<= fifo_wr_ptr[fec_wr_port];

			fifo_wr_ptr[fec_wr_port]			<= fifo_wr_ptr[fec_wr_port] + 1'h1;
		end

	end

endmodule
