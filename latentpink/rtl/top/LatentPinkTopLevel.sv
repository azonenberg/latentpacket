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
	@brief Top level file for the entire design

	Port naming:
		mgmt0		Management interface
		xg0			SFP+
		g13			upper / south DP83867
		g12			lower / north DP83867
		g11:0		VSC8512
 */
module LatentPinkTopLevel(

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Main system clock source

	input wire			clk_125mhz_p,
	input wire			clk_125mhz_n,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 10G SFP+

	//SFP+ interface (polarity inverted on both legs)
	output wire			sfp_tx_p,
	output wire			sfp_tx_n,
	input wire			sfp_rx_p,
	input wire			sfp_rx_n,

	output wire[1:0]	sfp_led,

	//GTX refclks
	input wire			gtx_refclk_156m25_p,
	input wire			gtx_refclk_156m25_n,
	input wire			gtx_refclk_200m_p,
	input wire			gtx_refclk_200m_n,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//QSGMII PHY

	//QSGMII interface (polarity inverted on RX2)
	output wire[2:0]	qsgmii_tx_p,
	output wire[2:0]	qsgmii_tx_n,
	input wire[2:0]		qsgmii_rx_p,
	input wire[2:0]		qsgmii_rx_n,

	input wire			vsc_fast_status,
	input wire			vsc_mdint,

	output wire			vsc_mdc,
	inout wire			vsc_mdio,
	output wire			vsc_mdio_oe,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// RGMII PHY

	inout wire			mgmt0_mdio,
	output wire			mgmt0_mdc,

	input wire			mgmt0_rx_clk,
	input wire			mgmt0_rx_dv,
	input wire[3:0]		mgmt0_rxd,

	output wire			mgmt0_tx_clk,
	output wire			mgmt0_tx_en,
	output wire[3:0]	mgmt0_txd,

	input wire[1:0]		mgmt0_led_n_1v8,
	output wire[1:0]	mgmt0_led_p_3v3,

	output wire			mgmt0_rst_n,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SGMII PHYs

	input wire[2:0]		g12_led_p_1v8,
	output wire[2:0]	g12_led_p_3v3,
	output wire			g12_rst_n,
	input wire			g12_int_n,
	input wire[1:0]		g12_gpio,

	output wire			g12_sgmii_tx_p,
	output wire			g12_sgmii_tx_n,

	input wire			g12_sgmii_rx_p,
	input wire			g12_sgmii_rx_n,

	input wire			g12_sgmii_rxclk_p,
	input wire			g12_sgmii_rxclk_n,


	input wire[2:0]		g13_led_p_1v8,
	output wire[2:0]	g13_led_p_3v3,
	output wire			g13_rst_n,
	input wire			g13_int_n,
	input wire[1:0]		g13_gpio,

	output wire			g13_sgmii_tx_p,		//polarity inverted
	output wire			g13_sgmii_tx_n,

	input wire			g13_sgmii_rx_p,		//polarity inverted
	input wire			g13_sgmii_rx_n,

	input wire			g13_sgmii_rxclk_p,	//polarity inverted
	input wire			g13_sgmii_rxclk_n,

	output wire			dp_mdc,
	inout wire			dp_mdio,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Low speed I/O

	//PMOD interface (GPIO expansion)
	output wire[7:0]	pmod_dq,

	//GPIO indicator LEDs
	output wire[3:0]	gpio_led,

	//QSPI bus to MCU
	input wire			mcu_sck,
	inout wire[3:0]		mcu_dq,
	input wire			mcu_cs_n,
	output wire			mcu_irq,

	//Tachometers for fans
	input wire[1:0]		fan_tach,

	//QSPI flash
	//(CCLK use STARTUPE2)
	inout wire[3:0]		flash_dq,
	output wire			flash_cs_n,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// RAM

	//C/A bus
	output wire			qdr_k_p,
	output wire			qdr_k_n,
	output wire			qdr_wps_n,
	output wire			qdr_rps_n,
	output wire[20:0]	qdr_a,

	//Write data bus
	output wire[3:0]	qdr_bws_n,
	output wire[35:0]	qdr_d,

	//Read data bus
	input wire			qdr_cq_p,
	input wire			qdr_cq_n,
	input wire			qdr_qvld,
	input wire[35:0]	qdr_q,

	//SSTL I2C lulz
	output wire			i2c_derp_scl_host,
	inout wire			i2c_derp_sda_host,
	input wire			i2c_derp_scl_device,
	inout wire			i2c_derp_sda_device
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clocking

	wire	qpll_lock;
	wire	qpll_clkout_10g3125;

	SerdesClocking clk_serdes(
		.gtx_refclk_156m25_p(gtx_refclk_156m25_p),
		.gtx_refclk_156m25_n(gtx_refclk_156m25_n),
		.gtx_refclk_200m_p(gtx_refclk_200m_p),
		.gtx_refclk_200m_n(gtx_refclk_200m_n),

		.qpll_lock(qpll_lock),
		.qpll_clkout_10g3125(qpll_clkout_10g3125)
	);

	wire clk_125mhz;
	wire clk_250mhz;
	wire clk_312p5mhz;
	wire clk_625mhz_0;
	wire clk_625mhz_90;

	wire pll_main_lock;

	wire clk_ram;

	wire pll_ram_lock;

	ClockGeneration clk_system(
		.clk_125mhz_p(clk_125mhz_p),
		.clk_125mhz_n(clk_125mhz_n),

		.clk_125mhz(clk_125mhz),
		.clk_250mhz(clk_250mhz),
		.clk_312p5mhz(clk_312p5mhz),
		.clk_625mhz_0(clk_625mhz_0),
		.clk_625mhz_90(clk_625mhz_90),

		.pll_main_lock(pll_main_lock),

		.clk_ram(clk_ram),

		.pll_ram_lock(pll_ram_lock)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Dummy logic to use SGMII RX clock

	wire	sgmii_rxclk0;
	wire	sgmii_rxclk1;

	IBUFDS #(.DIFF_TERM("TRUE")) ibuf_sgmii0(.I(g12_sgmii_rxclk_p), .IB(g12_sgmii_rxclk_n), .O(sgmii_rxclk0));
	IBUFDS #(.DIFF_TERM("TRUE")) ibuf_sgmii1(.I(g13_sgmii_rxclk_p), .IB(g13_sgmii_rxclk_n), .O(sgmii_rxclk1));

	logic[23:0] led_count0 = 0;
	logic[23:0] led_count1 = 0;

	logic[1:0] sgmii_led = 0;
	assign gpio_led[1:0] = sgmii_led;

	always_ff @(posedge sgmii_rxclk0) begin
		led_count0 <= led_count0 + 1;
		if(led_count0 == 0)
			sgmii_led[0] <= !sgmii_led[0];
	end

	always_ff @(posedge sgmii_rxclk1) begin
		led_count1 <= led_count1 + 1;
		if(led_count1 == 0)
			sgmii_led[1] <= !sgmii_led[1];
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 10G SFP+ uplink (xg0)

	`include "GmiiBus.svh"
	`include "EthernetBus.svh"

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// QSGMII interfaces (g0-g11)

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SGMII interfaces (g12, g13)

	`include "SGMIIToGMIIBridge.svh"

	wire			g12_rx_clk;
	EthernetRxBus	g12_rx_bus;

	EthernetTxBus	g12_tx_bus;
	wire			g12_tx_ready;

	wire			g12_link_up;
	lspeed_t		g12_link_speed;

	wire							g12_rst_stat;
	SGMIIPerformanceCounters		g12_sgmii_perf;
	GigabitMacPerformanceCounters	g12_mac_perf;

	SGMIIMACWrapper #(
		.RX_INVERT(0),
		.TX_INVERT(0)
	) port_g12 (
		.clk_125mhz(clk_125mhz),
		.clk_312p5mhz(clk_312p5mhz),
		.clk_625mhz_0(clk_625mhz_0),
		.clk_625mhz_90(clk_625mhz_90),

		.sgmii_rx_data_p(g12_sgmii_rx_p),
		.sgmii_rx_data_n(g12_sgmii_rx_n),

		.sgmii_tx_data_p(g12_sgmii_tx_p),
		.sgmii_tx_data_n(g12_sgmii_tx_n),

		.mac_rx_clk(g12_rx_clk),
		.mac_rx_bus(g12_rx_bus),

		.mac_tx_bus(g12_tx_bus),
		.mac_tx_ready(g12_tx_ready),

		.link_up(g12_link_up),
		.link_speed(g12_link_speed),

		.rst_stat(g12_rst_stat),
		.sgmii_perf(g12_sgmii_perf),
		.mac_perf(g12_mac_perf),

		.rx_error()	//ignore, just look at perf counters to see when we get errors
	);

	wire			g13_rx_clk;
	EthernetRxBus	g13_rx_bus;

	EthernetTxBus	g13_tx_bus;
	wire			g13_tx_ready;

	wire			g13_link_up;
	lspeed_t		g13_link_speed;

	wire							g13_rst_stat;
	SGMIIPerformanceCounters		g13_sgmii_perf;
	GigabitMacPerformanceCounters	g13_mac_perf;

	SGMIIMACWrapper #(
		.RX_INVERT(1),
		.TX_INVERT(1)
	) port_g13 (
		.clk_125mhz(clk_125mhz),
		.clk_312p5mhz(clk_312p5mhz),
		.clk_625mhz_0(clk_625mhz_0),
		.clk_625mhz_90(clk_625mhz_90),

		.sgmii_rx_data_p(g13_sgmii_rx_p),
		.sgmii_rx_data_n(g13_sgmii_rx_n),

		.sgmii_tx_data_p(g13_sgmii_tx_p),
		.sgmii_tx_data_n(g13_sgmii_tx_n),

		.mac_rx_clk(g13_rx_clk),
		.mac_rx_bus(g13_rx_bus),

		.mac_tx_bus(g13_tx_bus),
		.mac_tx_ready(g13_tx_ready),

		.link_up(g13_link_up),
		.link_speed(g13_link_speed),

		.rst_stat(g13_rst_stat),
		.sgmii_perf(g13_sgmii_perf),
		.mac_perf(g13_mac_perf),

		.rx_error()	//ignore, just look at perf counters to see when we get errors
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// RGMII PHY for mgmt0

	wire			mgmt0_rx_clk;
	EthernetRxBus	mgmt0_rx_bus;

	EthernetTxBus	mgmt0_tx_bus;
	wire			mgmt0_tx_ready;

	wire			mgmt0_link_up;
	lspeed_t		mgmt0_link_speed;

	//TODO: perf counters

	RGMIIMACWrapper port_mgmt0(
		.clk_125mhz(clk_125mhz),
		.clk_250mhz(clk_250mhz),

		.rgmii_rxc(mgmt0_rx_clk),
		.rgmii_rxd(mgmt0_rxd),
		.rgmii_rx_ctl(mgmt0_rx_dv),

		.rgmii_txc(mgmt0_tx_clk),
		.rgmii_txd(mgmt0_txd),
		.rgmii_tx_ctl(mgmt0_tx_en),

		.mac_rx_clk(mgmt0_rx_clk),
		.mac_rx_bus(mgmt0_rx_bus),

		.mac_tx_bus(mgmt0_tx_bus),
		.mac_tx_ready(mgmt0_tx_ready),

		.link_up(mgmt0_link_up),
		.link_speed(mgmt0_link_speed)
		);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Management subsystem

endmodule
