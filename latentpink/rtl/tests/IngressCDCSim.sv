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

	logic	rx_clk = 0;		//312.5 MHz for 10GbE
	logic	clk_mem = 0;	//187.5 MHz

	always begin
		#1.6;
		rx_clk = !rx_clk;
	end

	always begin
		#2.666;
		clk_mem = !clk_mem;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Stimulus generation

	EthernetRxBus	rx_bus;
	logic			next_packet	= 0;

	PcapPacketGenerator #(
		.FILENAME("../../../../../../../testdata/2tagged-2untagged.pcapng")
	) gen (
		.clk(rx_clk),
		.next(next_packet),
		.bus(rx_bus)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// DUT

	logic			link_up	= 0;
	EthernetRxBus	rx_bus = 0;

	logic			mem_frame_start;
	wire			mem_frame_ready;

	IngressCDC dut(
		.rx_clk(rx_clk),
		.link_up(link_up),
		.rx_bus(rx_bus),

		.port_vlan(3),
		.tagged_allowed(1),
		.untagged_allowed(1),

		.clk_mem(clk_mem),
		.mem_frame_ready(mem_frame_ready),
		.mem_frame_bytelen(),
		.mem_valid(),
		.mem_data(),
		.mem_frame_done(),
		.mem_frame_start(mem_frame_start),
		.mem_frame_vlan()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Input signal generation

	logic[7:0] state = 0;
	logic[7:0] count = 0;

	//pop frames when they come up
	always_comb begin
		mem_frame_start	= mem_frame_ready;
	end

	always_ff @(posedge rx_clk) begin

		next_packet	<= 0;

		case(state)

			//Bring up the link
			0:	state <= 1;

			1: begin
				link_up	<= 1;
				state	<= 2;
			end

			2: begin
				count	<= count + 1;
				if(count == 'h2)
					state <= 3;
			end

			//Send a dummy frame
			3: begin
				next_packet		<= 1;
				state			<= 4;
			end

			4: begin
				if(rx_bus.commit) begin
					next_packet	<= 1;
					state		<= 5;
				end
			end

			5: begin
				if(rx_bus.commit) begin
					next_packet	<= 1;
					state		<= 6;
				end
			end

			6: begin
				if(rx_bus.commit) begin
					next_packet	<= 1;
					state		<= 7;
				end
			end

			7: begin
			end

		endcase

	end

endmodule
