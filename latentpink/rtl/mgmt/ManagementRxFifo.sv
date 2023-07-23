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
	@brief FIFO for shifting Ethernet frames from the management clock domain to the QSPI clock domain
 */
module ManagementRxFifo(
	input wire					sys_clk,

	input wire					mgmt0_rx_clk,

	input wire EthernetRxBus	mgmt0_rx_bus,
	input wire					mgmt0_link_up,

	input wire					rxfifo_rd_en,
	input wire					rxfifo_rd_pop_single,
	output wire[31:0]			rxfifo_rd_data,
	input wire					rxheader_rd_en,
	output wire					rxheader_rd_empty,
	output wire[10:0]			rxheader_rd_data
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Main FIFO and push logic

	logic		rxfifo_wr_en		= 0;
	logic[31:0]	rxfifo_wr_data		= 0;

	wire		wr_reset;
	assign		wr_reset = !mgmt0_link_up;

	wire		rd_reset;

	ThreeStageSynchronizer sync_fifo_rst(
		.clk_in(mgmt0_rx_clk),
		.din(wr_reset),
		.clk_out(sys_clk),
		.dout(rd_reset)
	);

	wire[10:0]	rxfifo_wr_size;
	logic		rxfifo_wr_drop;

	CrossClockPacketFifo #(
		.WIDTH(32),
		.DEPTH(1024)	//at least 2 packets worth
	) rx_cdc_fifo (
		.wr_clk(mgmt0_rx_clk),
		.wr_en(rxfifo_wr_en),
		.wr_data(rxfifo_wr_data),
		.wr_reset(wr_reset),
		.wr_size(rxfifo_wr_size),
		.wr_commit(mgmt0_rx_bus.commit),
		.wr_rollback(rxfifo_wr_drop),

		.rd_clk(sys_clk),
		.rd_en(rxfifo_rd_en),
		.rd_offset(10'h0),
		.rd_pop_single(rxfifo_rd_pop_single),
		.rd_pop_packet(1'b0),
		.rd_packet_size(10'h0),
		.rd_data(rxfifo_rd_data),
		.rd_size(),
		.rd_reset(rd_reset)
	);

	//PUSH SIDE
	logic dropping = 0;
	logic[10:0] framelen = 0;

	wire		header_wfull;

	CrossClockFifo #(
		.WIDTH(11),
		.DEPTH(32),
		.USE_BLOCK(0),
		.OUT_REG(0)
	) rx_framelen_fifo (
		.wr_clk(mgmt0_rx_clk),
		.wr_en(mgmt0_rx_bus.commit && !dropping),
		.wr_data(framelen),
		.wr_size(),
		.wr_full(header_wfull),
		.wr_overflow(),
		.wr_reset(1'b0),

		.rd_clk(sys_clk),
		.rd_en(rxheader_rd_en),
		.rd_data(rxheader_rd_data),
		.rd_size(),
		.rd_empty(rxheader_rd_empty),
		.rd_underflow(),
		.rd_reset(1'b0)
	);

	always_ff @(posedge mgmt0_rx_clk) begin

		rxfifo_wr_drop		<= 0;

		if(mgmt0_rx_bus.drop) begin
			rxfifo_wr_drop	<= 1;
			dropping		<= 1;
		end

		//Frame delimiter
		if(mgmt0_rx_bus.start) begin

			//Not enough space for a full sized frame? Give up
			if( (rxfifo_wr_size < 375) || header_wfull )
				dropping	<= 1;

			//Nope, start a new frame
			else
				framelen	<= 0;

		end

		//If we hit max length frame or run out of space, drop the frame
		else if( (rxfifo_wr_size < 2) || (framelen > 1500) ) begin
			rxfifo_wr_drop	<= 1;
			dropping		<= 1;
		end

		//Nope, push data as needed
		else if(!dropping) begin
			rxfifo_wr_en	<= mgmt0_rx_bus.data_valid;
			rxfifo_wr_data	<= mgmt0_rx_bus.data;
			framelen		<= framelen + mgmt0_rx_bus.bytes_valid;
		end

	end

endmodule
