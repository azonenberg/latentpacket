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
	@brief Expand an EthernetRxBus to 128 bit data width and write to a CDC FIFO
 */
module IngressCDC(

	//Inbound data from the MAC
	input wire					rx_clk,
	input wire					link_up,
	input wire EthernetRxBus	rx_bus,

	//Output bus to the memory arbiter
	input wire					clk_mem
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Width expansion

	logic			fifo_wr_en			= 0;
	logic[127:0]	fifo_wr_data		= 0;
	wire[9:0]		fifo_wr_size;
	logic			fifo_wr_commit		= 0;
	logic			fifo_wr_commit_next	= 0;
	logic			fifo_wr_rollback	= 0;

	logic			fifo_wr_reset		= 0;
	logic			link_up_ff			= 0;

	logic[1:0]		wr_phase			= 0;
	logic[10:0]		wr_frame_bytelen	= 0;
	logic			wr_dropping			= 0;

	wire			header_fifo_full	= 0;

	localparam		MAX_FRAME_SIZE = 1522;

	always_ff @(posedge rx_clk) begin

		//Clear single cycle flags
		fifo_wr_en				<= 0;
		fifo_wr_commit			<= 0;
		fifo_wr_rollback		<= 0;
		fifo_wr_commit_next		<= 0;

		//Reset on link up or down
		link_up_ff				<= link_up;
		fifo_wr_reset			<= (link_up && !link_up_ff) || (!link_up && link_up_ff);

		//Handle delayed commits
		if(fifo_wr_commit_next)
			fifo_wr_commit		<= 1;

		//Start a new frame
		if(rx_bus.start) begin
			wr_phase			<= 0;
			wr_frame_bytelen	<= 0;

			//Make sure we have space to store the length
			wr_dropping			<= !header_fifo_full;
		end

		//If MAC requests a drop, roll back any partly pushed data
		else if(rx_bus.drop) begin
			fifo_wr_rollback	<= 1;
			wr_dropping			<= 1;
		end

		//Ignore any data from frames being dropped
		else if(wr_dropping) begin
		end

		//Process incoming data
		else if(rx_bus.data_valid) begin
			case(wr_phase)
				0:	fifo_wr_data[96 +: 32]	<= rx_bus.data;
				1:	fifo_wr_data[64 +: 32]	<= rx_bus.data;
				2:	fifo_wr_data[32 +: 32]	<= rx_bus.data;
				3:	fifo_wr_data[0 +: 32]	<= rx_bus.data;
			endcase

			wr_phase				<= wr_phase + 1;
			wr_frame_bytelen		<= wr_frame_bytelen + rx_bus.bytes_valid;

			if(wr_phase == 3)
				fifo_wr_en			<= 1;

			//Drop if we run out of buffer space or the frame is oversized
			if( (fifo_wr_size < 2) || (wr_frame_bytelen >= MAX_FRAME_SIZE) )begin
				wr_dropping			<= 1;
				fifo_wr_rollback	<= 1;
			end

		end

		//Finish up a frame
		else if(rx_bus.commit) begin

			//If we have in-progress data (phase not zero), push it
			//Zero off any garbage at the end of the frame if needed to prevent possible leakage of frame content
			case(wr_phase)
				0: begin
					fifo_wr_commit	<= 1;
				end

				1: begin
					fifo_wr_data[95:0]	<= 0;
					fifo_wr_en			<= 1;
					fifo_wr_commit_next	<= 1;
				end

				2: begin
					fifo_wr_data[63:0]	<= 0;
					fifo_wr_en			<= 1;
					fifo_wr_commit_next	<= 1;
				end

				3: begin
					fifo_wr_data[31:0]	<= 0;
					fifo_wr_en			<= 1;
					fifo_wr_commit_next	<= 1;
				end

			endcase

		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Reset synchronization

	wire			fifo_rd_reset_n;

	ResetSynchronizer sync_rst(
		.rst_in_n(!fifo_wr_reset),
		.clk(clk_mem),
		.rst_out_n(fifo_rd_reset_n)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Main packet data FIFO

	logic	fifo_rd_en	= 0;

	//Needs to be big enough to store a couple of packets at 128 bit width
	//Minimum sane size for 2x BRAM is 128 x 512 = 8 kB = 5.46 max sized frames
	CrossClockPacketFifo #(
		.WIDTH(128),
		.DEPTH(512),
		.USE_BLOCK(1)
	) data_fifo (
		.wr_clk(rx_clk),
		.wr_en(fifo_wr_en),
		.wr_data(fifo_wr_data),
		.wr_size(fifo_wr_size),
		.wr_reset(fifo_wr_reset),
		.wr_commit(fifo_wr_commit),
		.wr_rollback(fifo_wr_rollback),

		.rd_clk(clk_mem),
		.rd_en(fifo_rd_en),
		.rd_offset(),
		.rd_pop_single(),
		.rd_pop_packet(),
		.rd_packet_size(),
		.rd_data(),
		.rd_size(),
		.rd_reset(!fifo_rd_reset_n)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Packet length FIFO

	//RAM64X1D is 2 LUTs so this should be about 22 LUTs
	//If it's synthesized as 4x RAM64Ms instead it would be 16
	CrossClockFifo #(
		.WIDTH(11),
		.DEPTH(64),
		.USE_BLOCK(0),
		.OUT_REG(1)
	) header_fifo (
		.wr_clk(rx_clk),
		.wr_en(rx_bus.commit && !wr_dropping),
		.wr_data(wr_frame_bytelen),
		.wr_size(),
		.wr_full(header_fifo_full),
		.wr_overflow(),
		.wr_reset(fifo_wr_reset),

		.rd_clk(clk_mem),
		.rd_en(),
		.rd_data(),
		.rd_size(),
		.rd_empty(),
		.rd_underflow(),
		.rd_reset(!fifo_rd_reset_n)
	);

endmodule
