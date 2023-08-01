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

/**
	@brief QDR-II+ SRAM test muxes

	Combinatorial muxing to save latency, but pipeline delay on BIST selector register
 */
module BISTMuxes(
	input wire			clk_ram_ctl,

	input wire			mbist_select,
	input wire			mbist_start,

	(* max_fanout = "64" *)
	output logic		mbist_select_ff = 0,

	output logic		mbist_start_ff	= 0,

	input wire			ram_wr_en_fifo,
	input wire[17:0]	ram_wr_addr_fifo,
	input wire[143:0]	ram_wr_data_fifo,
	input wire			ram_rd_en_fifo,
	input wire[17:0]	ram_rd_addr_fifo,

	input wire			ram_wr_en_bist,
	input wire[17:0]	ram_wr_addr_bist,
	input wire[143:0]	ram_wr_data_bist,
	input wire			ram_rd_en_bist,
	input wire[17:0]	ram_rd_addr_bist,

	output logic		ram_rd_en,
	output logic[17:0]	ram_rd_addr,
	output logic		ram_wr_en,
	output logic[17:0]	ram_wr_addr,
	output logic[143:0]	ram_wr_data
);
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Pipeline delays

	always_ff @(posedge clk_ram_ctl) begin
		mbist_select_ff	<= mbist_select;
		mbist_start_ff	<= mbist_start;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Mux path

	always_ff @(posedge clk_ram_ctl) begin
		if(mbist_select_ff) begin
			ram_wr_en	= ram_wr_en_bist;
			ram_wr_addr	= ram_wr_addr_bist;
			ram_wr_data	= ram_wr_data_bist;
			ram_rd_en	= ram_rd_en_bist;
			ram_rd_addr	= ram_rd_addr_bist;
		end
		else begin
			ram_wr_en	= ram_wr_en_fifo;
			ram_wr_addr	= ram_wr_addr_fifo;
			ram_wr_data	= ram_wr_data_fifo;
			ram_rd_en	= ram_rd_en_fifo;
			ram_rd_addr	= ram_rd_addr_fifo;
		end
	end

endmodule
