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
	@brief Testbench for IngressCDC
 */
module IngressCDCSim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clock generation

	logic	rx_clk = 0;		//125 MHz
	logic	clk_mem = 0;	//187.5 MHz

	always begin
		#4;
		rx_clk = !rx_clk;
	end

	always begin
		#2.666;
		clk_mem = !clk_mem;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// DUT

	logic			link_up	= 0;
	EthernetRxBus	rx_bus = 0;

	IngressCDC dut(
		.rx_clk(rx_clk),
		.link_up(link_up),
		.rx_bus(rx_bus),

		.clk_mem(clk_mem)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Input signal generation

	logic[7:0] state = 0;

	always_ff @(posedge rx_clk) begin

		rx_bus.start		<= 0;
		rx_bus.data_valid	<= 0;
		rx_bus.bytes_valid	<= 0;
		rx_bus.data			<= 0;
		rx_bus.commit		<= 0;

		case(state)

			//Bring up the link
			0:	state <= 1;

			1: begin
				link_up	<= 1;
				state	<= 2;
			end

			2: state <= 3;

			//Send a dummy frame
			3: begin
				rx_bus.start	<= 1;
				state			<= 4;
			end

			4: begin
				rx_bus.data_valid	<= 1;
				rx_bus.bytes_valid	<= 4;
				rx_bus.data			<= 32'hfeedface;
				state				<= 5;
			end

			5: begin
				rx_bus.data_valid	<= 1;
				rx_bus.bytes_valid	<= 4;
				rx_bus.data			<= 32'hdeadbeef;
				state				<= 6;
			end

			6: begin
				rx_bus.data_valid	<= 1;
				rx_bus.bytes_valid	<= 4;
				rx_bus.data			<= 32'hcafef00d;
				state				<= 7;
			end

			7: begin
				rx_bus.data_valid	<= 1;
				rx_bus.bytes_valid	<= 4;
				rx_bus.data			<= 32'hbaadc0de;
				state				<= 8;
			end

			8: begin
				rx_bus.data_valid	<= 1;
				rx_bus.bytes_valid	<= 3;
				rx_bus.data			<= 32'h41414100;
				state				<= 9;
			end

			9: begin
				rx_bus.commit		<= 1;
				state				<= 10;
			end

			//TODO

		endcase

	end

endmodule
