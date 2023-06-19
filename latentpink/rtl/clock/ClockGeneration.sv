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
	@brief Clock input buffers and PLLs
 */
module ClockGeneration(

	//Main system clock input
	input wire			clk_125mhz_p,
	input wire			clk_125mhz_n,

	//PLL A: 1250 MHz VCO (x10)
	output wire			clk_125mhz,			//1x RGMII
	output wire			clk_250mhz,			//2x RGMII
	output wire			clk_312p5mhz,		//Main switch fabric clock
	output wire			clk_400mhz,			//IODELAY calibration for SGMII
	output wire			clk_625mhz_0,		//SGMII oversampling clock, 0 degree phase
	output wire			clk_625mhz_90,		//SGMII oversampling clock, 90 degree phase

	output wire			pll_main_lock,

	//PLL B: 1500 MHz VCO (x12)
	//RAM needs minimum of 375 MHz clock to achieve target BW, but we may tweak this
	//FPGA and RAM are nominally good out to 450
	output wire			clk_ram,		//VCO/4 = 375 MHz
	output wire			clk_ram_ctl,	//VCO/8 = 187.5 MHz
	output wire			clk_ram_90,		//VCO/4 = 375 MHz

	output wire			pll_ram_lock
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Differential clock input buffer

	wire	sysclk_in;

	IBUFDS #(
		.DIFF_TERM("TRUE")
	) ibuf (
		.I(clk_125mhz_p),
		.IB(clk_125mhz_n),
		.O(sysclk_in)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Main PLL and clock buffers for it

	wire	main_fbclk;

	wire	clk_125mhz_raw;
	wire	clk_250mhz_raw;
	wire	clk_312p5mhz_raw;
	wire	clk_400mhz_raw;
	wire	clk_625mhz_0_raw;
	wire	clk_625mhz_90_raw;

	MMCME2_BASE #(
		.BANDWIDTH("OPTIMIZED"),
		.CLKOUT0_DIVIDE_F(3.125),	//1250 MHz / 3.125 = 400 MHz
		.CLKOUT1_DIVIDE(2),			//1250 MHz / 2 = 625 MHz
		.CLKOUT2_DIVIDE(2),			//1250 MHz / 2 = 625 MHz
		.CLKOUT3_DIVIDE(4),			//unused
		.CLKOUT4_DIVIDE(5),			//1250 MHz / 5 = 250 MHz
		.CLKOUT5_DIVIDE(10),		//1250 MHz / 10 = 125 MHz
		.CLKOUT6_DIVIDE(4),			//1250 MHz / 4 = 312.5 MHz

		.CLKOUT0_PHASE(0),
		.CLKOUT1_PHASE(0),
		.CLKOUT2_PHASE(90),
		.CLKOUT3_PHASE(0),
		.CLKOUT4_PHASE(0),
		.CLKOUT5_PHASE(0),
		.CLKOUT6_PHASE(0),

		.CLKOUT0_DUTY_CYCLE(0.5),
		.CLKOUT1_DUTY_CYCLE(0.5),
		.CLKOUT2_DUTY_CYCLE(0.5),
		.CLKOUT3_DUTY_CYCLE(0.5),
		.CLKOUT4_DUTY_CYCLE(0.5),
		.CLKOUT5_DUTY_CYCLE(0.5),
		.CLKOUT6_DUTY_CYCLE(0.5),

		.CLKFBOUT_MULT_F(10),		//125 MHz * 10 = 1250 MHz VCO
		.DIVCLK_DIVIDE(1),
		.CLKFBOUT_PHASE(0),

		.CLKIN1_PERIOD(8),			//125 MHz input
		.STARTUP_WAIT("FALSE"),
		.CLKOUT4_CASCADE("FALSE")

	) main_mmcm (
		.CLKIN1(sysclk_in),
		.CLKFBIN(main_fbclk),
		.RST(1'b0),
		.PWRDWN(1'b0),
		.CLKOUT0(clk_400mhz_raw),
		.CLKOUT0B(),
		.CLKOUT1(clk_625mhz_0_raw),
		.CLKOUT1B(),
		.CLKOUT2(clk_625mhz_90_raw),
		.CLKOUT2B(),
		.CLKOUT3(),
		.CLKOUT3B(),
		.CLKOUT4(clk_250mhz_raw),
		.CLKOUT5(clk_125mhz_raw),
		.CLKOUT6(clk_312p5mhz_raw),
		.CLKFBOUT(main_fbclk),
		.CLKFBOUTB(),
		.LOCKED(pll_main_lock)
	);

	BUFGCE buf_125mhz(
		.I(clk_125mhz_raw),
		.O(clk_125mhz),
		.CE(pll_main_lock));

	BUFGCE buf_250mhz(
		.I(clk_250mhz_raw),
		.O(clk_250mhz),
		.CE(pll_main_lock));

	BUFGCE buf_400mhz(
		.I(clk_400mhz_raw),
		.O(clk_400mhz),
		.CE(pll_main_lock));

	BUFGCE buf_312p5mhz(
		.I(clk_312p5mhz_raw),
		.O(clk_312p5mhz),
		.CE(pll_main_lock));

	BUFGCE buf_625mhz_0(
		.I(clk_625mhz_0_raw),
		.O(clk_625mhz_0),
		.CE(pll_main_lock));

	BUFGCE buf_625mhz_90(
		.I(clk_625mhz_90_raw),
		.O(clk_625mhz_90),
		.CE(pll_main_lock));

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// RAM PLL

	wire	ram_fbclk;

	wire	clk_ram_raw;
	wire	clk_ram_ctl_raw;
	wire	clk_ram_90_raw;

	PLLE2_BASE #(
		.BANDWIDTH("OPTIMIZED"),
		.CLKOUT0_DIVIDE(4),			//1500 MHz / 4 = 375 MHz
		.CLKOUT1_DIVIDE(8),			//1500 MHz / 8 = 187.5 MHz
		.CLKOUT2_DIVIDE(4),			//1500 MHz / 4 = 375 MHz
		.CLKOUT3_DIVIDE(10),		//unused
		.CLKOUT4_DIVIDE(10),		//unused
		.CLKOUT5_DIVIDE(10),		//unused

		.CLKOUT0_PHASE(0),
		.CLKOUT1_PHASE(0),
		.CLKOUT2_PHASE(90),
		.CLKOUT3_PHASE(0),
		.CLKOUT4_PHASE(0),
		.CLKOUT5_PHASE(0),

		.CLKOUT0_DUTY_CYCLE(0.5),
		.CLKOUT1_DUTY_CYCLE(0.5),
		.CLKOUT2_DUTY_CYCLE(0.5),
		.CLKOUT3_DUTY_CYCLE(0.5),
		.CLKOUT4_DUTY_CYCLE(0.5),
		.CLKOUT5_DUTY_CYCLE(0.5),

		.CLKFBOUT_MULT(12),			//125 MHz * 12 = 1500 MHz VCO
		.DIVCLK_DIVIDE(1),
		.CLKFBOUT_PHASE(0),

		.CLKIN1_PERIOD(8),			//125 MHz input
		.STARTUP_WAIT("FALSE")

	) ram_pll (
		.CLKIN1(sysclk_in),
		.CLKFBIN(ram_fbclk),
		.RST(1'b0),
		.PWRDWN(1'b0),
		.CLKOUT0(clk_ram_raw),
		.CLKOUT1(clk_ram_ctl_raw),
		.CLKOUT2(clk_ram_90_raw),
		.CLKOUT3(),
		.CLKOUT4(),
		.CLKOUT5(),
		.CLKFBOUT(ram_fbclk),
		.LOCKED(pll_ram_lock)
	);

	BUFGCE buf_ram(
		.I(clk_ram_raw),
		.O(clk_ram),
		.CE(pll_ram_lock));

	BUFGCE buf_ram_ctl(
		.I(clk_ram_ctl_raw),
		.O(clk_ram_ctl),
		.CE(pll_ram_lock));

	BUFGCE buf_ram_90(
		.I(clk_ram_90_raw),
		.O(clk_ram_90),
		.CE(pll_ram_lock));

endmodule
