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

module ManagementSim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Simulated external oscillator

	logic	clk_125mhz_p = 1;
	logic	clk_125mhz_n = 0;

	always begin
		#4;
		clk_125mhz_p = !clk_125mhz_p;
		clk_125mhz_n = !clk_125mhz_n;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clock synthesis

	wire clk_125mhz;
	wire clk_250mhz;
	wire clk_312p5mhz;
	wire clk_400mhz;
	wire clk_625mhz_0;
	wire clk_625mhz_90;

	wire pll_main_lock;

	wire clk_ram;
	wire clk_ram_ctl;
	wire clk_ram_90;

	wire pll_ram_lock;

	ClockGeneration clk_system(
		.clk_125mhz_p(clk_125mhz_p),
		.clk_125mhz_n(clk_125mhz_n),

		.clk_125mhz(clk_125mhz),
		.clk_250mhz(clk_250mhz),
		.clk_312p5mhz(clk_312p5mhz),
		.clk_400mhz(clk_400mhz),
		.clk_625mhz_0(clk_625mhz_0),
		.clk_625mhz_90(clk_625mhz_90),

		.pll_main_lock(pll_main_lock),

		.clk_ram(clk_ram),
		.clk_ram_ctl(clk_ram_ctl),
		.clk_ram_90(clk_ram_90),

		.pll_ram_lock(pll_ram_lock)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Device information

	logic	clk_50mhz = 0;
	always begin
		#10;
		clk_50mhz = !clk_50mhz;
	end

	wire[63:0]	die_serial;
	wire		die_serial_valid;

	wire[31:0]	idcode;
	wire		idcode_valid;

	DeviceInfo_7series info(
		.clk(clk_50mhz),

		.die_serial(die_serial),
		.die_serial_valid(die_serial_valid),
		.idcode(idcode),
		.idcode_valid(idcode_valid)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The management interface

	wire		mgmt_rd_en;
	wire[15:0]	mgmt_rd_addr;
	wire		mgmt_rd_valid;
	wire[7:0]	mgmt_rd_data;

	wire		mgmt_wr_en;
	wire[15:0]	mgmt_wr_addr;
	wire[7:0]	mgmt_wr_data;

	wire[14:0]	port_rx_clk;
	for(genvar g=0; g<15; g=g+1) begin
		assign port_rx_clk[g] = clk_125mhz_p;
	end

	SimulationManagementBridge mbridge(
		.clk(clk_ram_ctl),

		.rd_en(mgmt_rd_en),
		.rd_addr(mgmt_rd_addr),
		.rd_valid(mgmt_rd_valid),
		.rd_data(mgmt_rd_data),

		.wr_en(mgmt_wr_en),
		.wr_addr(mgmt_wr_addr),
		.wr_data(mgmt_wr_data)
	);

	ManagementRegisterInterface iface(
		.clk(clk_ram_ctl),

		.rd_en(mgmt_rd_en),
		.rd_addr(mgmt_rd_addr),
		.rd_valid(mgmt_rd_valid),
		.rd_data(mgmt_rd_data),

		.wr_en(mgmt_wr_en),
		.wr_addr(mgmt_wr_addr),
		.wr_data(mgmt_wr_data),

		.die_serial_valid(die_serial_valid),
		.die_serial(die_serial),
		.idcode_valid(idcode_valid),
		.idcode(idcode),

		.port_rx_vlan(),
		.port_rx_clk(port_rx_clk)
	);

endmodule
