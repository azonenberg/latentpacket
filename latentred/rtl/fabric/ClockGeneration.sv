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

module ClockGeneration(
	input wire	clk_ref156,

	output wire	clk_fabric,
	output wire	clk_gmac,

	output wire	clk_ok
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Main PLL

	wire[3:0] clk_unused;

	ReconfigurablePLL #(
		.ACTIVE_ON_START(1),		//don't wait for reconfiguration to do anything
		.PRINT_CONFIG(0),			//don't print calculated PLL configuration in simulation

		.OUTPUT_GATE(6'b000011),
		.OUTPUT_BUF_GLOBAL(6'b000011),
		.IN0_PERIOD(6.4),
		.IN1_PERIOD(6.4),
		.OUT0_MIN_PERIOD(6.4),		//clk_fabric = 156.25 MHz
		.OUT1_MIN_PERIOD(8.0),		//clk_gmac = 125 MHz

		//specify other outputs as equal to ref even though we're not using them
		.OUT2_MIN_PERIOD(6.4),
		.OUT3_MIN_PERIOD(6.4),
		.OUT4_MIN_PERIOD(6.4),
		.OUT5_MIN_PERIOD(6.4)
	) main_pll (
		.clkin({clk_ref156, clk_ref156}),
		.clksel(1'b0),
		.clkout( {clk_unused, clk_gmac, clk_fabric} ),
		.reset(1'b0),
		.locked(clk_ok),

		//no reconfig for now
		.busy(),
		.reconfig_clk(clk_ref156),

		.reconfig_start(1'b0),
		.reconfig_finish(1'b0),
		.reconfig_cmd_done(),

		.reconfig_vco_en(1'b0),
		.reconfig_vco_mult(7'h0),
		.reconfig_vco_indiv(7'h0),
		.reconfig_vco_bandwidth(1'b0),

		.reconfig_output_en(1'b0),
		.reconfig_output_idx(3'h0),
		.reconfig_output_div(8'h0),
		.reconfig_output_phase(9'h0)
	);

endmodule
