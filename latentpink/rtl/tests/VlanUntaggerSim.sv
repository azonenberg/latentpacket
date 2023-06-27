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
	@brief Testbench for VlanUntagger
 */
module VlanUntaggerSim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clock generation

	logic	clk = 0;		//125 MHz

	always begin
		#4;
		clk = !clk;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Packet generator

	EthernetRxBus	in_bus;
	logic			next_packet	= 0;

	PcapPacketGenerator #(
		.FILENAME("../../../../../../../testdata/ssh-ipv6-tagged.pcapng")
	) gen (
		.clk(clk),
		.next(next_packet),
		.bus(in_bus)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The DUT

	logic[11:0]		port_vlan 			= 42;
	logic			tagged_allowed		= 0;
	logic			untagged_allowed	= 0;

	EthernetRxBus	out_bus;
	wire[11:0]		out_vlan;

	VlanUntagger dut(
		.clk(clk),
		.port_vlan(port_vlan),
		.tagged_allowed(tagged_allowed),
		.untagged_allowed(untagged_allowed),
		.in_bus(in_bus),
		.out_bus(out_bus),
		.out_vlan(out_vlan)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test logic

	logic[7:0] state = 0;

	always_ff @(posedge clk) begin

		next_packet	<= 0;

		case(state)

			//wait 1 cycle for setup
			0: begin
				state			<= 1;
			end

			//Send the first packet (should go through)
			1: begin
				tagged_allowed	<= 1;
				next_packet		<= 1;
				state			<= 2;
			end

			//Send another packet (should be dropped)
			2: begin
				if(in_bus.commit) begin
					tagged_allowed	<= 0;
					state			<= 3;
					next_packet		<= 1;
				end
			end

		endcase

	end

endmodule
