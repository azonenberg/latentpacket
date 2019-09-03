`default_nettype none
`timescale 1ns/1ps
/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2018-2019Andrew D. Zonenberg                                                                           *
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

	logic		lookup_en		= 0;
	logic[11:0]	lookup_src_vlan	= 0;
	logic[47:0]	lookup_src_mac	= 0;
	logic[4:0]	lookup_src_port	= 0;
	logic[47:0]	lookup_dst_mac	= 0;

	wire		lookup_hit;
	wire[4:0]	lookup_dst_port;

	logic		gc_en			= 0;
	wire		gc_done;

	logic		mgmt_rd_en		= 0;
	logic		mgmt_del_en		= 0;
	wire		mgmt_ack;
	logic[10:0]	mgmt_addr		= 0;
	logic[2:0]	mgmt_way		= 0;
	wire		mgmt_rd_valid;
	wire		mgmt_rd_gc_mark;
	wire[47:0]	mgmt_rd_mac;
	wire[11:0]	mgmt_rd_vlan;
	wire[4:0]	mgmt_rd_port;

	MACAddressTable mactbl(
		.clk(clk),

		.lookup_en(lookup_en),
		.lookup_src_vlan(lookup_src_vlan),
		.lookup_src_mac(lookup_src_mac),
		.lookup_src_port(lookup_src_port),
		.lookup_dst_mac(lookup_dst_mac),

		.lookup_hit(lookup_hit),
		.lookup_dst_port(lookup_dst_port),

		.gc_en(gc_en),
		.gc_done(gc_done),

		.mgmt_rd_en(mgmt_rd_en),
		.mgmt_del_en(mgmt_del_en),
		.mgmt_ack(mgmt_ack),
		.mgmt_addr(mgmt_addr),
		.mgmt_way(mgmt_way),
		.mgmt_rd_valid(mgmt_rd_valid),
		.mgmt_rd_gc_mark(mgmt_rd_gc_mark),
		.mgmt_rd_mac(mgmt_rd_mac),
		.mgmt_rd_vlan(mgmt_rd_vlan),
		.mgmt_rd_port(mgmt_rd_port)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test state machine

	logic[7:0] state = 0;
	logic[3:0] count = 0;

	always_ff @(posedge clk) begin

		lookup_en	<= 0;
		gc_en		<= 0;
		mgmt_rd_en	<= 0;
		mgmt_del_en	<= 0;

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
				count			<= 0;

			end

			//Look up the original address again
			2: begin
				count				<= count + 1'h1;
				if(count == 6) begin
					lookup_en		<= 1;
					lookup_src_vlan	<= 2;
					lookup_src_mac	<= 48'h02deadbeef0c;
					lookup_src_port	<= 5'h0c;
					lookup_dst_mac	<= 48'h02deadbeef0a;

					state			<= 3;
				end
			end

			//Look it up again but in a different vlan. Should be a miss.
			3: begin
				lookup_en		<= 1;
				lookup_src_vlan	<= 5;
				lookup_src_mac	<= 48'h02deadbeef0c;
				lookup_src_port	<= 5'h0c;
				lookup_dst_mac	<= 48'h02deadbeef0a;

				state			<= 4;
			end

			//Run the garbage collector to mark both addresses as stale
			4: begin
				gc_en			<= 1;
				state			<= 5;
			end

			//Wait for GC to complete
			//TODO: do some reads during the GC
			5: begin
				if(gc_done)
					state		<= 6;
			end

			//Look up one of the two addresses to refresh its table entry
			6: begin
				lookup_en		<= 1;
				lookup_src_vlan	<= 2;
				lookup_src_mac	<= 48'h02deadbeef0c;
				lookup_src_port	<= 5'h0c;
				lookup_dst_mac	<= 48'h02deadbeef0a;

				state			<= 7;
			end

			//Read one of the entries for :0c via the management interface. This won't set the mark bit,
			//so it will still get GC'd.
			7: begin
				mgmt_rd_en		<= 1;
				mgmt_way		<= 0;
				mgmt_addr		<= 11'h068;
				state			<= 8;
			end

			//Delete the other entry for :0c manually
			8: begin
				if(mgmt_ack) begin
					mgmt_del_en		<= 1;
					mgmt_addr		<= 11'h06e;
					mgmt_way		<= 0;
				end
			end

			/*
			//Re-run the garbage collector. This should remove :0c because nothing has been sent to it in a while.
			8: begin
				gc_en			<= 1;
				state			<= 9;
			end

			//Wait for GC to complete
			//TODO: do some reads during the GC
			9: begin
				if(gc_done)
					state		<= 10;
			end
			*/

		endcase
	end

endmodule
