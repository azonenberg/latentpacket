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
	@brief	Quad SPI interface
 */
module ManagementBridge(

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// System clocks

	input wire			clk,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Bus to MCU

	input wire			qspi_sck,
	input wire			qspi_cs_n,
	inout wire[3:0]		qspi_dq,
	output logic		irq = 0,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Bus to ManagementRegisterInterface

	output wire			rd_en,
	output logic[15:0]	rd_addr	= 0,

	input wire			rd_valid,
	input wire[7:0]		rd_data,

	output wire			wr_en,
	output logic[15:0]	wr_addr	= 0,
	output wire[7:0]	wr_data

	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// QSPI interface

	wire		start;
	wire		insn_valid;
	wire[15:0]	insn;
	logic		rd_mode		= 0;
	wire		rd_ready;

	QSPIDeviceInterface #(
		.INSN_BYTES(2)
	) qspi (
		.clk(clk),
		.sck(qspi_sck),
		.cs_n(qspi_cs_n),
		.dq(qspi_dq),

		.start(start),
		.insn_valid(insn_valid),
		.insn(insn),
		.wr_valid(wr_en),
		.wr_data(wr_data),

		.rd_mode(rd_mode),
		.rd_ready(rd_en),
		.rd_valid(rd_valid),
		.rd_data(rd_data)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Address counting

	always_ff @(posedge clk) begin

		if(rd_en)
			rd_addr		<= rd_addr + 1;
		if(wr_en)
			wr_addr		<= wr_addr + 1;

		//Process instruction
		if(insn_valid) begin

			//MSB of opcode is read flag (0=read, 1=write)
			rd_mode		<= !insn[15];
			rd_addr		<= {1'b0, insn[14:0]};
			wr_addr		<= {1'b0, insn[14:0]};

		end

		//Reset anything we need on CS# falling edge
		if(start) begin
			rd_mode		<= 0;
		end

	end

endmodule
