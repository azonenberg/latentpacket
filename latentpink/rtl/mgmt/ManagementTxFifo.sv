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
	@brief FIFO for shifting Ethernet frames from the QSPI clock domain to the management PHY clock domain
 */
module ManagementTxFifo(
	input wire				sys_clk,

	input wire				wr_en,
	input wire[7:0]			wr_data,
	input wire				wr_commit,

	input wire				tx_clk,
	input wire				link_up,
	input wire				tx_ready,
	output EthernetTxBus	tx_bus
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual FIFOs

	//For now, no checks for overflow
	//Assume we're popping (at gigabit speed) faster than we can possibly push from the slow micro

	wire		rd_reset;
	assign		rd_reset = !link_up;

	wire		wr_reset;

	logic		txfifo_rd_en			= 0;
	wire[7:0]	txfifo_rd_data;

	//Tie off unused high bits
	assign tx_bus.data[31:8] = 0;
	assign tx_bus.bytes_valid = 1;

	ThreeStageSynchronizer sync_fifo_rst(
		.clk_in(sys_clk),
		.din(rd_reset),
		.clk_out(tx_clk),
		.dout(wr_reset)
	);
	CrossClockFifo #(
		.WIDTH(8),
		.DEPTH(4096),
		.USE_BLOCK(1),
		.OUT_REG(1)
	) tx_cdc_fifo (
		.wr_clk(sys_clk),
		.wr_en(wr_en),
		.wr_data(wr_data),
		.wr_size(),
		.wr_full(),
		.wr_overflow(),
		.wr_reset(wr_reset),

		.rd_clk(tx_clk),
		.rd_en(txfifo_rd_en),
		.rd_data(tx_bus.data[7:0]),
		.rd_size(),
		.rd_empty(),
		.rd_underflow(),
		.rd_reset(rd_reset)
	);

	logic		txheader_rd_en				= 0;
	wire[10:0]	txheader_rd_data;
	wire		txheader_rd_empty;
	logic[10:0]	tx_wr_packetlen;

	CrossClockFifo #(
		.WIDTH(11),
		.DEPTH(32),
		.USE_BLOCK(0),
		.OUT_REG(0)
	) tx_framelen_fifo (
		.wr_clk(sys_clk),
		.wr_en(wr_commit),
		.wr_data(tx_wr_packetlen),
		.wr_size(),
		.wr_full(),
		.wr_overflow(),
		.wr_reset(wr_reset),

		.rd_clk(tx_clk),
		.rd_en(txheader_rd_en),
		.rd_data(txheader_rd_data),
		.rd_size(),
		.rd_empty(txheader_rd_empty),
		.rd_underflow(),
		.rd_reset(rd_reset)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Push logic

	always_ff @(posedge sys_clk) begin

		//Reset length when pushing packet
		if(wr_commit)
			tx_wr_packetlen	<= 0;

		//Push a byte
		if(wr_en)
			tx_wr_packetlen	<= tx_wr_packetlen + 1;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Pop logic

	enum logic
	{
		TX_STATE_IDLE 		= 0,
		TX_STATE_SENDING	= 1
	} tx_state = TX_STATE_IDLE;

	logic[10:0] tx_count = 0;
	always_ff @(posedge tx_clk) begin

		tx_bus.start		<= 0;
		tx_bus.data_valid	<= txfifo_rd_en;
		txheader_rd_en		<= 0;
		txfifo_rd_en		<= 0;

		case(tx_state)

			TX_STATE_IDLE: begin

				if(!txheader_rd_empty && tx_ready && !txheader_rd_en) begin
					tx_bus.start	<= 1;
					tx_count		<= 1;
					txfifo_rd_en	<= 1;
					tx_state		<= TX_STATE_SENDING;
				end

			end

			TX_STATE_SENDING: begin

				if(tx_count >= txheader_rd_data) begin
					tx_state		<= TX_STATE_IDLE;
					txheader_rd_en	<= 1;
				end
				else begin
					txfifo_rd_en	<= 1;
					tx_count		<= tx_count + 1;
				end

			end

		endcase

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Debug ILAs

	ila_1 ila(
		.clk(tx_clk),
		.probe0(tx_bus.start),
		.probe1(tx_bus.data_valid),
		.probe2(tx_bus.data),
		.probe3(tx_ready),
		.probe4(txheader_rd_empty),
		.probe5(txheader_rd_data),
		.probe6(txfifo_rd_en),
		.probe7(tx_state),
		.probe8(tx_count),
		.probe9(txheader_rd_en)
	);

endmodule
