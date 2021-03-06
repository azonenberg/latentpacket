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

	wire[35:0]	qdr_q;
	wire[35:0]	qdr_d;
	wire[17:0]	qdr_a;
	wire		qdr_wps_n;
	wire		qdr_rps_n;
	wire[3:0]	qdr_bws_n;
	wire		qdr_qvld;
	wire		qdr_dclk_p;
	wire		qdr_dclk_n;
	wire		qdr_qclk_p;
	wire		qdr_qclk_n;

	top dut(
		.clk_ref156(clk_ref156),
		.gtx_ref156_p(clk_ref156),
		.gtx_ref156_n(!clk_ref156),
		.gtx_ref125_p(clk_ref125),
		.gtx_ref125_n(!clk_ref125),

		//TODO: SGMII, SFI, etc

		.qdr_d(qdr_d),
		.qdr_q(qdr_q),
		.qdr_a(qdr_a),
		.qdr_wps_n(qdr_wps_n),
		.qdr_rps_n(qdr_rps_n),
		.qdr_bws_n(qdr_bws_n),
		.qdr_qvld(qdr_qvld),
		.qdr_dclk_p(qdr_dclk_p),
		.qdr_dclk_n(qdr_dclk_n),
		.qdr_qclk_p(qdr_qclk_p),
		.qdr_qclk_n(qdr_qclk_n),

		.packet_gen_en(packet_gen_en),
		.sim_pll_lock(sim_pll_lock)
		);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The QDR-II+ SRAM

	cyqdr2_b4 qdr(
		.TCK(1'b0),
		.TMS(1'b1),
		.TDI(1'b1),
		.TDO(),
		.D(qdr_d),
		.Q(qdr_q),
		.A(qdr_a),
		.K(qdr_dclk_p),
		.Kb(qdr_dclk_n),
		.RPSb(qdr_rps_n),
		.WPSb(qdr_wps_n),
		.BWS0b(qdr_bws_n[0]),
		.BWS1b(qdr_bws_n[1]),
		.BWS2b(qdr_bws_n[2]),
		.BWS3b(qdr_bws_n[3]),
		.CQ(qdr_qclk_p),
		.CQb(qdr_qclk_n),
		.ZQ(),
		.DOFF(1'b1),
		.QVLD(qdr_qvld)
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
