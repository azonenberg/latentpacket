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

module UnorderedSet_sim();

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

	reg			insert_en	= 0;
	reg[15:0]	insert_key	= 0;
	wire		insert_ok;

	reg			iter_inc	= 0;
	reg			iter_begin	= 0;
	reg[2:0]	iter_in		= 0;
	wire		iter_end;
	wire[2:0]	iter_next;
	wire[15:0]	iter_key;

	reg			remove_en	= 0;
	reg[2:0]	remove_iter	= 0;

	UnorderedSet #(
		.DEPTH(8),
		.ITER_SIZE(3),
		.KEY_SIZE(16)
	) dut (
		.clk(clk),

		.insert_en(insert_en),
		.insert_key(insert_key),
		.insert_ok(insert_ok),

		.iter_inc(iter_inc),
		.iter_begin(iter_begin),
		.iter_in(iter_in),
		.iter_end(iter_end),
		.iter_next(iter_next),
		.iter_key(iter_key),

		.remove_en(remove_en),
		.remove_iter(remove_iter)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test state machine

	reg[7:0] state = 0;
	reg[3:0] count = 0;

	always @(posedge clk) begin

		insert_en	<= 0;
		iter_inc	<= 0;
		iter_begin	<= 0;
		remove_en	<= 0;

		case(state)

			//Insert two values into the set
			0: begin
				insert_en	<= 1;
				insert_key	<= 16'hdead;
				state		<= 1;
			end

			1: begin
				insert_en	<= 1;
				insert_key	<= 16'hbeef;
				state		<= 2;
			end

			//Re-insert one of the existing values. This shouldn't change anything.
			2: begin
				insert_en	<= 1;
				insert_key	<= 16'hdead;
				state		<= 3;
			end

			//Start looping over the set.
			//First, get the start pointer.
			3: begin
				iter_begin	<= 1;
				state		<= 4;
			end

			//Delete the first element of the set and iterate to the next one.
			4: begin
				iter_inc	<= 1;
				iter_in		<= iter_next;

				remove_en	<= 1;
				remove_iter	<= iter_next;

				state		<= 5;
				$display("Removing first element in set (key=%x)", iter_key);
			end

			//Insert a new element
			5: begin
				insert_en	<= 1;
				insert_key	<= 16'hfeed;
				state		<= 6;
			end

			//Go to the new beginning of the set
			6: begin
				iter_begin	<= 1;
				state		<= 7;
			end

			//Loop over the remainder of the set
			7: begin
				if(iter_end)
					state		<= 8;
				else begin
					iter_inc	<= 1;
					iter_in		<= iter_next;
				end
			end

		endcase

	end

endmodule
