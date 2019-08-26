`timescale 1ns/1ps
`default_nettype none
/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2019 Andrew D. Zonenberg                                                                               *
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

`include "GmiiBus.svh"

/**
	@brief Top level module for the INTEGRALSTICK FPGA on the LATENTRED management board.
 */
module top(
	input wire			clk_25mhz,

	//SPI to STM32
	input wire			spi_mosi,
	input wire			spi_sck,
	input wire			spi_cs_n,
	output wire			spi_miso,

	//UART to STM32
	input wire			uart_rxd,
	output wire			uart_txd,

	//Ethernet to PHY
	input wire			rgmii_rxc,
	input wire[3:0]		rgmii_rxd,
	input wire			rgmii_rx_ctl,

	output wire			rgmii_txc,
	output wire[3:0]	rgmii_txd,
	output wire			rgmii_tx_ctl,

	output wire			rgmii_rst_n,

	//LED inputs from the PHY (not used for now)
	input wire[1:0]		eth_led_n_in,

	//ADC input
	input wire			ltc_vtemp,

	//SPI flash
	inout wire[3:0]		flash_dq,
	output wire			flash_cs_n,

	//Indicator LEDs
	output logic[3:0]	led	= 0
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// PLL to give us a higher clock for running internal stuff

	wire[1:0]	clk_unused;

	wire		clk_100mhz;
	wire		clk_125mhz;
	wire		clk_250mhz;
	wire		clk_200mhz;

	wire		pll_locked;

	ReconfigurablePLL #(
		.IN0_PERIOD(40),		//25 MHz
		.IN1_PERIOD(40),
		.OUTPUT_GATE(6'b001111),
		.OUTPUT_BUF_GLOBAL(6'b001111),
		.OUT0_MIN_PERIOD(10),	//100 MHz
		.OUT1_MIN_PERIOD(8),	//125 MHz
		.OUT2_MIN_PERIOD(4),	//250 MHz
		.OUT3_MIN_PERIOD(5),	//200 MHz
		.ACTIVE_ON_START(1),	//start PLL on boot
		.PRINT_CONFIG(0)
	) pll (
		.clkin({clk_25mhz, clk_25mhz}),
		.clksel(0),
		.reset(1'b0),
		.locked(pll_locked),

		.clkout({clk_unused, clk_200mhz, clk_250mhz, clk_125mhz, clk_100mhz}),

		.busy(),
		.reconfig_clk(clk_25mhz),
		.reconfig_start(1'b0),
		.reconfig_finish(1'b0),
		.reconfig_cmd_done(),
		.reconfig_vco_en(1'b0),
		.reconfig_vco_mult(7'h0),
		.reconfig_vco_indiv(7'h0),
		.reconfig_vco_bandwidth(1'b0),
		.reconfig_output_en(1'b0),
		.reconfig_output_idx(3'h0),
		.reconfig_output_div(8'h0),
		.reconfig_output_phase(9'h0)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Calibrate any I/O delays we might use

	IODelayCalibration cal(.refclk(clk_200mhz));

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// UART link to the STM32 (reserved for future use)

	UART uart(
		.clk(clk_100mhz),
		.clkdiv(16'd868),	//115200 @ 100 MHz
		.rx(uart_rxd),
		.rxactive(),
		.rx_data(),
		.rx_en(),
		.tx(uart_txd),
		.tx_data(8'h0),
		.tx_en(1'h0),
		.txactive(),
		.tx_done()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SPI link to the STM32

	wire		spi_tx_data_valid;
	wire[7:0]	spi_tx_data;
	wire		spi_rx_data_valid;
	wire[7:0]	spi_rx_data;
	wire		spi_cs_falling;

	SPISlave spi(
		.clk(clk_100mhz),

		.spi_mosi(spi_mosi),
		.spi_sck(spi_sck),
		.spi_cs_n(spi_cs_n),
		.spi_miso(spi_miso),

		.tx_data_valid(spi_tx_data_valid),
		.tx_data(spi_tx_data),
		.rx_data_valid(spi_rx_data_valid),
		.rx_data(spi_rx_data),
		.cs_falling(spi_cs_falling)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// On-die sensor packages

	wire[15:0] die_temp;
	wire[15:0] volt_core;
	wire[15:0] volt_ram;
	wire[15:0] volt_aux;
	wire[191:0]	ext_in;

	OnDieSensors_7series #(
		.EXT_IN_ENABLE(16'h0001)
	) sensors(
		.clk(clk_100mhz),
		.vin_p({15'hz, ltc_vtemp}),
		.vin_n(16'hz),
		.die_temp(die_temp),
		.volt_core(volt_core),
		.volt_ram(volt_ram),
		.volt_aux(volt_aux),
		.ext_in(ext_in)
	);

	wire[63:0]	die_serial;
	wire[31:0]	idcode;

	//run this slow
	DeviceInfo_7series info(
		.clk(clk_25mhz),
		.die_serial(die_serial),
		.idcode(idcode)
		);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Ethernet interface for the front-panel management port

	wire		gmii_rxc;
	GmiiBus		gmii_rx_bus;
	GmiiBus		gmii_tx_bus = {$bits(GmiiBus){1'b0}};

	//Tie reset to "inactive" state
	assign		rgmii_rst_n = 1;

	wire		mgmt_up;
	lspeed_t	mgmt_speed;

	RGMIIToGMIIBridge gmii_bridge(
		.rgmii_rxc(rgmii_rxc),
		.rgmii_rxd(rgmii_rxd),
		.rgmii_rx_ctl(rgmii_rx_ctl),
		.rgmii_txc(rgmii_txc),
		.rgmii_txd(rgmii_txd),
		.rgmii_tx_ctl(rgmii_tx_ctl),

		.gmii_rxc(gmii_rxc),
		.gmii_rx_bus(gmii_rx_bus),

		.gmii_txc(clk_125mhz),
		.clk_250mhz(clk_250mhz),
		.gmii_tx_bus(gmii_tx_bus),

		.link_up(mgmt_up),
		.link_speed(mgmt_speed)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SPI flash interface to the boot flash for storing config data

	// XC7A50T bitstream is ~18 Mbits, we have a 64 or 128 Mbit flash so PLENTY of space

	wire		flash_sck;

	`include "QuadSPIFlashController_opcodes.svh"

	qspi_opcode_t op = FLASH_OP_READ;

	wire[15:0]	flash_mbits;

	QuadSPIFlashController flash(
		.clk(clk_100mhz),
		.spi_sck(flash_sck),
		.spi_dq(flash_dq),
		.spi_cs_n(flash_cs_n),
		.clkdiv(16'd4),

		.cmd_en(0),
		.cmd_id(op),
		.cmd_len(16'h0),
		.cmd_addr(32'h0),
		.read_data(),
		.read_valid(),
		.write_data(),
		.write_valid(),
		.write_ready(),
		.busy(),
		.capacity_mbits(flash_mbits),
		.sfdp_bad()
	);

	//Need the STARTUP block to drive CCLK
	STARTUPE2 #(
		.PROG_USR("FALSE"),		//Don't lock resets (requires encrypted bitstream)
		.SIM_CCLK_FREQ(10.0)
	)
	startup (
		.CFGCLK(),				//Configuration clock not used
		.CFGMCLK(),				//Internal configuration oscillator
		.EOS(),					//End-of-startup ignored
		.CLK(),					//Configuration clock not used
		.GSR(1'b0),				//Not using GSR
		.GTS(1'b0),				//Not using GTS
		.KEYCLEARB(1'b1),		//Not zeroizing BBRAM
		.PREQ(),				//PROG_B request not used
		.PACK(1'b0),			//PROG_B ack not used

		.USRCCLKO(flash_sck),	//CCLK pin
		.USRCCLKTS(1'b0),		//Assert to tristate CCLK

		.USRDONEO(1'b1),		//Hold DONE pin high
		.USRDONETS(1'b1)		//Do not tristate DONE pin
								//This is weird - seems like opposite polarity from every other TS pin!
		);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// TODO: MDIO/reset/sensor logic

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Control stuff for the management engine

	ManagementController ctrl(
		.clk(clk_100mhz),

		.spi_tx_data_valid(spi_tx_data_valid),
		.spi_tx_data(spi_tx_data),
		.spi_rx_data_valid(spi_rx_data_valid),
		.spi_rx_data(spi_rx_data),
		.spi_cs_falling(spi_cs_falling),

		.spi_cs_n(spi_cs_n),	//debug

		.mgmt_up(mgmt_up),
		.mgmt_speed(mgmt_speed),

		//Various system sensor/configuration values
		.die_temp(die_temp),
		.volt_core(volt_core),
		.volt_ram(volt_ram),
		.volt_aux(volt_aux),
		.die_serial(die_serial),
		.idcode(idcode),
		.psu_temp(ext_in[11:0]),
		.flash_mbits(flash_mbits)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Debug indicator LEDs

	always_comb begin
		led	<= {3'h0, pll_locked};
	end

endmodule
