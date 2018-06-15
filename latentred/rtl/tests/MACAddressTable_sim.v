`default_nettype none
`timescale 1ns/1ps
/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2018 Andrew D. Zonenberg                                                                               *
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

module MACAddressTable_sim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clocking

	reg ready = 0;
	initial begin
		$timeformat(-9, 3, " ns", 6);
		#100;
		ready = 1;
	end

	//156.25 MHz
	reg clk = 0;
	always begin
		#3.2;
		clk = ready;
		#3.2;
		clk = 0;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The DUT

	reg			lookup_en		= 0;
	reg[11:0]	lookup_src_vlan	= 0;
	reg[47:0]	lookup_src_mac	= 0;
	reg[4:0]	lookup_src_port	= 0;
	reg[47:0]	lookup_dst_mac	= 0;

	wire		lookup_hit;
	wire[4:0]	lookup_dst_port;

	reg			gc_en			= 0;
	wire		gc_done;

	MACAddressTable mactbl(
		.clk(clk),

		.lookup_en(lookup_en),
		.lookup_src_vlan(lookup_src_vlan),
		.lookup_src_mac(lookup_src_mac),
		.lookup_src_port(lookup_src_port),
		.lookup_dst_mac(lookup_dst_mac),

		.lookup_hit(),
		.lookup_dst_port(),

		.gc_en(gc_en),
		.gc_done(gc_done)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test state machine

	reg[7:0] state = 0;

	always @(posedge clk) begin

		lookup_en	<= 0;
		gc_en		<= 0;

		case(state)

			//Look up an address that isn't yet in the table
			0: begin

				lookup_en		<= 1;
				lookup_src_vlan	<= 2;
				lookup_src_mac	<= 48'h02deadbeef0c;
				lookup_src_port	<= 5'h0c;
				lookup_dst_mac	<= 48'h02deadbeef0a;

				state			<= 1;
			end

			//Send a packet to the previous packet's source. This should fail because we're still waiting for pipeline delays
			1: begin

				lookup_en		<= 1;
				lookup_src_vlan	<= 2;
				lookup_src_mac	<= 48'h02deadbeef0a;
				lookup_src_port	<= 5'h0a;
				lookup_dst_mac	<= 48'h02deadbeef0c;

				state			<= 2;

			end

		endcase
	end

endmodule
