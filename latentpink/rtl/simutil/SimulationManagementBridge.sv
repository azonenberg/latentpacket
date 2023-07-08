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
	@author	Andrew D. Zonenberg
	@brief	Far end of SimFPGAInterface bridge
 */
module SimulationManagementBridge(
	input wire			clk,

	output logic		rd_en	= 0,
	output logic[15:0]	rd_addr	= 0,

	input wire			rd_valid,
	input wire[7:0]		rd_data,

	output logic		wr_en	= 0,
	output logic[15:0]	wr_addr	= 0,
	output logic[7:0]	wr_data	= 0
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Input processing loop

	integer hwrite;
	integer hread;

	//Open the pipes to the SimFPGAInterface. Must be in this order
	initial begin
		$display("[%m] Opening management pipes");
		hwrite = $fopen("/tmp/sim-write-pipe", "w");
		hread = $fopen("/tmp/sim-read-pipe", "r");
		$display("[%m] Management pipes opened");
	end

	string op;
	logic[15:0] addr	= 0;
	logic[15:0] len		= 0;
	logic done			= 0;
	logic[15:0]	rcount	= 0;

	logic	rd_pending	= 0;
	logic	wr_pending	= 0;

	always_ff @(posedge clk) begin

		rd_en	<= 0;
		wr_en	<= 0;

		if(rd_pending) begin

			if(rd_valid) begin
				$fdisplay(hwrite, "%x\n", rd_data);
				$fflush(hwrite);
				rcount		= rcount + 1;

				if(rcount >= len)
					rd_pending	<= 0;
				else begin
					rd_en		<= 1;
					rd_addr		<= rd_addr + 1;
				end
			end

		end

		if(wr_pending) begin
			$fscanf(hread, "%x", wr_data);

			rcount		= rcount + 1;

			if(rcount >= len)
				wr_pending	<= 0;
			else begin
				wr_en		<= 1;
				wr_addr		<= wr_addr + 1;
			end
		end

		//Don't read commands if doing IO this cycle
		if(rd_pending || wr_pending) begin
		end

		//Read command (nop, read, write, etc)
		else if(0 != $fscanf(hread, "%s", op)) begin

			//Begin a read request
			if(op == "read") begin
				$fscanf(hread, "%d %d", addr, len);
				$display("[%m] read %d bytes from 0x%x", len, addr);

				rd_en		<= 1;
				rd_addr		<= addr;
				rd_pending	<= 1;
				rcount		= 0;

			end

			//Begin a write request
			else if(op == "write") begin
				$fscanf(hread, "%d %d", addr, len);
				$display("[%m] write %d bytes to 0x%x", len, addr);

				wr_en		<= 1;
				wr_addr		<= addr;
				wr_pending	<= 1;
				$fscanf(hread, "%x", wr_data);

				rcount		= 0;

			end

			//Nothing to do
			else if(op == "nop") begin
			end

			//Invalid command
			else begin
				$display("[%m] op = %s (unrecognized)", op);
			end

		end

		//Bridge dropped, stop communication
		else begin
			if(!done) begin
				$display("[%m] Simulation bridge disconnected");
				done = 1;
			end
		end

	end

endmodule
