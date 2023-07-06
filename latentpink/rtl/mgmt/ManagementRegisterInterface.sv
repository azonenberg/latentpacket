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
	@brief Container for management logic

	Management registers have 16-bit addresses and are 8 bits in size.
 */
module ManagementRegisterInterface(

	//Core clock for the management domain
	input wire			clk,

	//Data bus from QSPI interface or simulation bridge
	input wire			rd_en,
	input wire[15:0]	rd_addr,
	input wire[15:0]	rd_len,
	output logic		rd_valid	= 0,
	output logic[7:0]	rd_data		= 0,

	//Device information bus
	//Must be divided down from core clock, but phase aligned
	input wire			die_serial_valid,
	input wire[63:0]	die_serial,
	input wire			idcode_valid,
	input wire[31:0]	idcode
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// List of named registers

	//must match ManagementRegisterInterface in FPGAInterface.h
	typedef enum logic[15:0]
	{
		//FPGA die information
		REG_FPGA_IDCODE		= 16'h0000,		//4 bytes of IDCODE
		REG_FPGA_IDCODE_1	= 16'h0001,
		REG_FPGA_IDCODE_2	= 16'h0002,
		REG_FPGA_IDCODE_3	= 16'h0003,
		REG_FPGA_SERIAL		= 16'h0004,		//8 bytes of die serial
		REG_FPGA_SERIAL_1	= 16'h0005,
		REG_FPGA_SERIAL_2	= 16'h0006,
		REG_FPGA_SERIAL_3	= 16'h0007,
		REG_FPGA_SERIAL_4	= 16'h0008,
		REG_FPGA_SERIAL_5	= 16'h0009,
		REG_FPGA_SERIAL_6	= 16'h000a,
		REG_FPGA_SERIAL_7	= 16'h000b,

		REG_LAST

	} regid_t;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Address decoding and muxing logic

	logic[7:0]	count	= 0;
	logic		reading	= 0;

	logic[15:0]	rd_addr_real;

	always_ff @(posedge clk) begin

		rd_valid	<= 0;

		//Start a new read
		if(rd_en) begin
			count	<= 0;
			reading	<= 1;
		end

		//Read address within burst
		rd_addr_real = rd_addr + count;

		//Continue a read
		if(reading) begin

			//Data not ready? Wait
			if( (rd_addr_real >= REG_FPGA_IDCODE) && (rd_addr_real <= REG_FPGA_IDCODE_3) && !idcode_valid) begin
			end
			else if( (rd_addr_real >= REG_FPGA_SERIAL) && (rd_addr_real <= REG_FPGA_SERIAL_7) && !die_serial_valid) begin
			end

			//Data is ready
			else begin

				rd_valid	<= 1;
				count		<= count + 1;

				//Done?
				if(count+1 >= rd_len) begin
					count	<= 0;
					reading	<= 0;
				end
			end

			//Main register decoder
			case(rd_addr_real)

				REG_FPGA_IDCODE:	rd_data <= idcode[3*8 +: 8];
				REG_FPGA_IDCODE_1:	rd_data <= idcode[2*8 +: 8];
				REG_FPGA_IDCODE_2:	rd_data <= idcode[1*8 +: 8];
				REG_FPGA_IDCODE_3:	rd_data <= idcode[0*8 +: 8];

				REG_FPGA_SERIAL:	rd_data <= die_serial[7*8 +: 8];
				REG_FPGA_SERIAL_1:	rd_data <= die_serial[6*8 +: 8];
				REG_FPGA_SERIAL_2:	rd_data <= die_serial[5*8 +: 8];
				REG_FPGA_SERIAL_3:	rd_data <= die_serial[4*8 +: 8];
				REG_FPGA_SERIAL_4:	rd_data <= die_serial[3*8 +: 8];
				REG_FPGA_SERIAL_5:	rd_data <= die_serial[2*8 +: 8];
				REG_FPGA_SERIAL_6:	rd_data <= die_serial[1*8 +: 8];
				REG_FPGA_SERIAL_7:	rd_data <= die_serial[0*8 +: 8];

				default: begin
					rd_data	<= 0;
				end

			endcase

		end

	end

endmodule
