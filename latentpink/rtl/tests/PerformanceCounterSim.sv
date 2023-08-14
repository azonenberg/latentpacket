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
	@file
	@author Andrew D. Zonenberg
	@brief Testbench for PerformanceCounter
 */
module PerformanceCounterSim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clock generation

	logic	clk = 0;		//312.5 MHz for 10GbE

	logic	ready = 0;
	initial begin
		#100;
		ready = 1;
	end

	always begin
		#1.6;
		if(ready)
			clk = !clk;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The DUT

	logic		en		= 0;
	logic[2:0]	delta	= 0;
	logic		rst		= 0;

	PerformanceCounter count(
		.clk(clk),
		.en(en),
		.delta(delta),
		.rst(rst),
		.count()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test state machine

	logic[7:0] state = 0;

	always_ff @(posedge clk) begin

		state	<= state + 1;
		en		<= 0;
		delta	<= 0;
		rst		<= 0;

		case(state)

			10: begin
				en		<= 1;
				delta	<= 4;
			end

			12: begin
				en		<= 0;
				delta	<= 9;
			end

			17: begin
				en		<= 1;
				delta	<= 1;
			end

			//should be 5

		endcase

	end

endmodule
