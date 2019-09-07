`default_nettype none
`timescale 1ns/1ps
/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2018-2019 Andrew D. Zonenberg                                                                          *
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

module top_sim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clocking

	logic ready = 0;
	initial begin
		$timeformat(-9, 3, " ns", 6);
		#100;
		ready = 1;
	end

	//156.25 MHz
	logic clk_ref156 = 0;
	always begin
		#3.2;
		clk_ref156 = ready;
		#3.2;
		clk_ref156 = 0;
	end

	//125 MHz
	logic clk_ref125 = 0;
	always begin
		#4;
		clk_ref125 = ready;
		#4;
		clk_ref125 = 0;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The DUT

	logic	packet_gen_en	= 0;
	wire	sim_pll_lock;

	top dut(
		.clk_ref156(clk_ref156),
		.gtx_ref156_p(clk_ref156),
		.gtx_ref156_n(!clk_ref156),
		.gtx_ref125_p(clk_ref125),
		.gtx_ref125_n(!clk_ref125),

		//TODO: SGMII, SFI, QDR, etc

		.packet_gen_en(packet_gen_en),
		.sim_pll_lock(sim_pll_lock)
		);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test code

	logic[7:0] state = 0;

	always_ff @(posedge clk_ref156) begin

		packet_gen_en	<= 0;

		case(state)

			0: begin
				if(sim_pll_lock)
					state			<= 1;
			end

			1: begin
				packet_gen_en	<= 1;
				state			<= 2;
			end

		endcase

	end

endmodule
