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
	input wire					mgmt0_link_up
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Main FIFO and push logic

	logic		rxfifo_wr_en		= 0;
	logic[34:0]	rxfifo_wr_data		= 0;

	wire		rxfifo_rd_en;
	wire		rxfifo_rd_pop_single;
	wire[2:0]	rxfifo_rd_bytes_valid;
	wire[31:0]	rxfifo_rd_data;
	wire[10:0]	rxfifo_rd_size;

	wire		wr_reset;
	assign		wr_reset = !mgmt0_link_up;

	wire		rd_reset;

	ThreeStageSynchronizer sync_fifo_rst(
		.clk_in(mgmt0_rx_clk),
		.din(wr_reset),
		.clk_out(sys_clk),
		.dout(rd_reset)
	);

	//An all-zero word indicates packet boundaries
	CrossClockPacketFifo #(
		.WIDTH(35),		//3 bytes valid + 32 data
		.DEPTH(1024)	//at least 2 packets worth
	) rx_cdc_fifo (
		.wr_clk(mgmt0_rx_clk),
		.wr_en(rxfifo_wr_en),
		.wr_data(rxfifo_wr_data),
		.wr_reset(wr_reset),
		.wr_size(),
		.wr_commit(mgmt0_rx_bus.commit),
		.wr_rollback(mgmt0_rx_bus.drop),

		.rd_clk(sys_clk),
		.rd_en(rxfifo_rd_en),
		.rd_offset(10'h0),
		.rd_pop_single(rxfifo_rd_pop_single),
		.rd_pop_packet(1'b0),
		.rd_packet_size(10'h0),
		.rd_data( {rxfifo_rd_bytes_valid, rxfifo_rd_data} ),
		.rd_size(rxfifo_rd_size),
		.rd_reset(rd_reset)
	);

	//PUSH SIDE
	always_comb begin

		//Frame delimiter
		if(mgmt0_rx_bus.start) begin
			rxfifo_wr_en	<= 1;
			rxfifo_wr_data	<= 35'h0;
		end

		//Nope, push data as needed
		else begin
			rxfifo_wr_en	<= mgmt0_rx_bus.data_valid;
			rxfifo_wr_data	<= { mgmt0_rx_bus.bytes_valid, mgmt0_rx_bus.data };
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Pop logic

	//DEBUG: toss a VIO on here to control the read and write stuff
	vio_0 vio(
		.clk(sys_clk),
		.probe_out0(rxfifo_rd_en),
		.probe_out1(rxfifo_rd_pop_single),
		.probe_in0(rxfifo_rd_bytes_valid),
		.probe_in1(rxfifo_rd_data),
		.probe_in2(rxfifo_rd_size)
		);

endmodule
