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

module QDRMemoryBIST(
	input wire			clk,

	output logic		ram_rd_en		= 0,
	output logic[17:0]	ram_rd_addr		= 0,
	input wire			ram_rd_valid,
	input wire[143:0]	ram_rd_data,

	output logic		ram_wr_en		= 0,
	output logic[17:0]	ram_wr_addr		= 0,
	output wire[143:0]	ram_wr_data,

	input wire			start,
	input wire[31:0]	seed,
	output logic		done = 0,
	output logic		fail = 0,
	output logic[17:0]	fail_addr = 0
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// PRBS generators

	wire[143:0]	prbs_out;
	logic		prbs_update;

	assign		ram_wr_data = prbs_out;

	wire		prbs_init;

	for(genvar g=0; g<4; g=g+1) begin

		PRBS31 #(
			.WIDTH(36)
		) prbs_block(
			.clk(clk),
			.update(prbs_update),
			.init(prbs_init),
			.seed(seed[30:0] + g[30:0]),
			.dout(prbs_out[g*36 +: 36])
		);
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test controller

	enum logic[2:0]
	{
		STATE_IDLE		 	= 0,
		STATE_FILL		 	= 1,
		STATE_READ_START	= 2,
		STATE_READ			= 3,
		STATE_READ_LAST		= 4
	} state = STATE_IDLE;

	assign prbs_init = start || (state == STATE_READ_START);

	logic		first = 0;
	logic[3:0]	match;

	wire[17:0]	readback_addr;
	logic[17:0]	readback_addr_ff	= 0;

	logic[3:0]	match_ff			= 0;
	logic		rd_valid_ff			= 0;
	logic		rd_ok;

	SingleClockShiftRegisterFifo #(
		.WIDTH(18),
		.DEPTH(32),
		.OUT_REG(0),
		.USE_BLOCK(0)
	) addr_fifo (
		.clk(clk),
		.wr(ram_rd_en),
		.din(ram_rd_addr),
		.rd(ram_rd_valid),
		.dout(readback_addr),
		.overflow(),
		.underflow(),
		.empty(),
		.full(),
		.rsize(),
		.wsize(),
		.reset(first)
	);

	always_comb begin
		prbs_update	= 0;

		//Write path
		if(state == STATE_FILL)
			prbs_update	= 1;

		//Read path
		if(ram_rd_valid || state == STATE_READ_START)
			prbs_update	= 1;

		//Check results
		for(integer i=0; i<4; i=i+1)
			match[i] = (prbs_out[i*36 +: 36] == ram_rd_data[i*36 +: 36]);
		rd_ok = (match_ff == 4'hf);

	end

	localparam LAST 		= 18'h3ffff;
	localparam ALMOST_LAST	= LAST - 1;

	always_ff @(posedge clk) begin

		ram_rd_en				<= 0;
		ram_wr_en				<= 0;

		readback_addr_ff		<= readback_addr;
		match_ff				<= match;
		rd_valid_ff				<= ram_rd_valid;

		//Check results
		if(rd_valid_ff) begin
			if(!rd_ok) begin
				fail			<= 1;
				if(!fail)
					fail_addr	<= readback_addr_ff;
			end
		end

		case(state)

			STATE_IDLE: begin

				if(start) begin
					state		<= STATE_FILL;
					first		<= 1;
					done		<= 0;
					fail		<= 0;
					fail_addr	<= 0;
					ram_wr_addr	<= LAST;
				end

			end //STATE_IDLE

			STATE_FILL: begin
				first			<= 0;

				//Done?
				if( (ram_wr_addr == ALMOST_LAST) && !first)
					state		<= STATE_READ_START;

				//Fill next address
				ram_wr_en		<= 1;
				ram_wr_addr		<= ram_wr_addr + 1;

			end	//STATE_FILL

			STATE_READ_START: begin
				state			<= STATE_READ;
				first			<= 1;
				ram_rd_addr		<= LAST;
			end	//STATE_READ_START

			STATE_READ: begin

				first			<= 0;

				//Done?
				if( (ram_rd_addr == ALMOST_LAST) && !first)
					state		<= STATE_READ_LAST;

				//Read next address
				ram_rd_en		<= 1;
				ram_rd_addr		<= ram_rd_addr + 1;

			end	//STATE_READ

			STATE_READ_LAST: begin
				if(rd_valid_ff && (readback_addr_ff == LAST) ) begin
					done		<= 1;
					state		<= STATE_IDLE;
				end
			end

		endcase

	end

endmodule
