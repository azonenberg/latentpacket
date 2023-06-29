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
	@brief Contains all Ethernet interfaces
 */
module NetworkInterfaces(

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Global clocks

	input wire					clk_125mhz,
	input wire					clk_250mhz,
	input wire					clk_312p5mhz,
	input wire					clk_400mhz,
	input wire					clk_625mhz_0,
	input wire					clk_625mhz_90,

	input wire					pll_main_lock,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SERDES clocking

	input wire					qpll_lock,
	input wire					qpll_clkout_10g3125,

	input wire					qpll_refclk,
	input wire					qpll_refclk_lost,

	input wire					serdes_refclk_156m25,
	input wire					serdes_refclk_200m,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 10G SFP+

	//SFP+ interface (polarity inverted on both legs)
	output wire					sfp_tx_p,
	output wire					sfp_tx_n,
	input wire					sfp_rx_p,
	input wire					sfp_rx_n,

	input wire					sfp_rx_los,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//QSGMII PHY

	//QSGMII interface (polarity inverted on RX2)
	output wire[2:0]			qsgmii_tx_p,
	output wire[2:0]			qsgmii_tx_n,
	input wire[2:0]				qsgmii_rx_p,
	input wire[2:0]				qsgmii_rx_n,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// RGMII PHY

	input wire					mgmt0_rx_clk,
	input wire					mgmt0_rx_dv,
	input wire[3:0]				mgmt0_rxd,

	output wire					mgmt0_tx_clk,
	output wire					mgmt0_tx_en,
	output wire[3:0]			mgmt0_txd,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SGMII PHYs

	output wire					g12_sgmii_tx_p,
	output wire					g12_sgmii_tx_n,

	input wire					g12_sgmii_rx_p,
	input wire					g12_sgmii_rx_n,

	input wire					g12_sgmii_rxclk_p,
	input wire					g12_sgmii_rxclk_n,

	output wire					g13_sgmii_tx_p,		//polarity inverted
	output wire					g13_sgmii_tx_n,

	input wire					g13_sgmii_rx_p,		//polarity inverted
	input wire					g13_sgmii_rx_n,

	input wire					g13_sgmii_rxclk_p,	//polarity inverted
	input wire					g13_sgmii_rxclk_n,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Output MAC buses

	output wire					xg0_mac_rx_clk,
	input wire EthernetRxBus	xg0_mac_rx_bus,

	output wire					xg0_mac_tx_clk,
	input wire EthernetTxBus	xg0_mac_tx_bus,

	output wire					xg0_link_up,

	output wire[2:0]								qsgmii_rx_clk,
	output wire[2:0]								qsgmii_tx_clk,

	output EthernetRxBus[11:0] 						qsgmii_mac_rx_bus,
	output GigabitMacPerformanceCounters[11:0]		qsgmii_mac_perf,

	input wire EthernetTxBus[11:0]					qsgmii_mac_tx_bus,
	output wire[11:0]								qsgmii_mac_tx_ready,
	output wire[11:0]								qsgmii_link_up,
	output lspeed_t[11:0]							qsgmii_link_speed,

	output EthernetRxBus							g12_rx_bus,
	input wire EthernetTxBus						g12_tx_bus,
	output wire										g12_tx_ready,
	output wire										g12_link_up,
	output wire lspeed_t							g12_link_speed,
	output SGMIIPerformanceCounters					g12_sgmii_perf,
	output GigabitMacPerformanceCounters			g12_mac_perf,

	output EthernetRxBus							g13_rx_bus,
	input wire EthernetTxBus						g13_tx_bus,
	output wire										g13_tx_ready,
	output wire										g13_link_up,
	output wire lspeed_t							g13_link_speed,
	output SGMIIPerformanceCounters					g13_sgmii_perf,
	output GigabitMacPerformanceCounters			g13_mac_perf,

	output wire										mgmt0_rx_clk_buf,
	output EthernetRxBus							mgmt0_rx_bus,
	input EthernetTxBus								mgmt0_tx_bus,
	output wire										mgmt0_tx_ready,
	output wire										mgmt0_link_up,
	output lspeed_t									mgmt0_link_speed,

	//DEBUG placeholder
	output wire[3:0] 								gpio_led
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// I/O delay calibration for SGMII

	IODelayCalibration iocal(.refclk(clk_400mhz));

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Dummy logic to use SGMII RX clock

	wire	sgmii_rxclk0;
	wire	sgmii_rxclk1;

	IBUFDS #(.DIFF_TERM("TRUE")) ibuf_sgmii0(.I(g12_sgmii_rxclk_p), .IB(g12_sgmii_rxclk_n), .O(sgmii_rxclk0));
	IBUFDS #(.DIFF_TERM("TRUE")) ibuf_sgmii1(.I(g13_sgmii_rxclk_p), .IB(g13_sgmii_rxclk_n), .O(sgmii_rxclk1));

	wire led_clk0;
	wire led_clk1;

	wire led_fbclk0;
	PLLE2_BASE #(
		.BANDWIDTH("OPTIMIZED"),
		.CLKOUT0_DIVIDE(4),
		.CLKOUT1_DIVIDE(10),
		.CLKOUT2_DIVIDE(10),
		.CLKOUT3_DIVIDE(10),
		.CLKOUT4_DIVIDE(10),
		.CLKOUT5_DIVIDE(10),

		.CLKOUT0_PHASE(0),
		.CLKOUT1_PHASE(0),
		.CLKOUT2_PHASE(0),
		.CLKOUT3_PHASE(0),
		.CLKOUT4_PHASE(0),
		.CLKOUT5_PHASE(0),

		.CLKOUT0_DUTY_CYCLE(0.5),
		.CLKOUT1_DUTY_CYCLE(0.5),
		.CLKOUT2_DUTY_CYCLE(0.5),
		.CLKOUT3_DUTY_CYCLE(0.5),
		.CLKOUT4_DUTY_CYCLE(0.5),
		.CLKOUT5_DUTY_CYCLE(0.5),

		.CLKFBOUT_MULT(2),
		.DIVCLK_DIVIDE(1),
		.CLKFBOUT_PHASE(0),

		.CLKIN1_PERIOD(1.6),
		.STARTUP_WAIT("FALSE")

	) led_pll0 (
		.CLKIN1(sgmii_rxclk0),
		.CLKFBIN(led_fbclk0),
		.RST(1'b0),
		.PWRDWN(1'b0),
		.CLKOUT0(led_clk0),
		.CLKOUT1(),
		.CLKOUT2(),
		.CLKOUT3(),
		.CLKOUT4(),
		.CLKOUT5(),
		.CLKFBOUT(led_fbclk0),
		.LOCKED()
	);

	wire led_fbclk1;
	PLLE2_BASE #(
		.BANDWIDTH("OPTIMIZED"),
		.CLKOUT0_DIVIDE(4),
		.CLKOUT1_DIVIDE(10),
		.CLKOUT2_DIVIDE(10),
		.CLKOUT3_DIVIDE(10),
		.CLKOUT4_DIVIDE(10),
		.CLKOUT5_DIVIDE(10),

		.CLKOUT0_PHASE(0),
		.CLKOUT1_PHASE(0),
		.CLKOUT2_PHASE(0),
		.CLKOUT3_PHASE(0),
		.CLKOUT4_PHASE(0),
		.CLKOUT5_PHASE(0),

		.CLKOUT0_DUTY_CYCLE(0.5),
		.CLKOUT1_DUTY_CYCLE(0.5),
		.CLKOUT2_DUTY_CYCLE(0.5),
		.CLKOUT3_DUTY_CYCLE(0.5),
		.CLKOUT4_DUTY_CYCLE(0.5),
		.CLKOUT5_DUTY_CYCLE(0.5),

		.CLKFBOUT_MULT(2),
		.DIVCLK_DIVIDE(1),
		.CLKFBOUT_PHASE(0),

		.CLKIN1_PERIOD(1.6),
		.STARTUP_WAIT("FALSE")

	) led_pll1 (
		.CLKIN1(sgmii_rxclk1),
		.CLKFBIN(led_fbclk1),
		.RST(1'b0),
		.PWRDWN(1'b0),
		.CLKOUT0(led_clk1),
		.CLKOUT1(),
		.CLKOUT2(),
		.CLKOUT3(),
		.CLKOUT4(),
		.CLKOUT5(),
		.CLKFBOUT(led_fbclk1),
		.LOCKED()
	);

	logic[1:0] sgmii_led = 0;
	assign gpio_led[1:0] = sgmii_led;

	logic[20:0] led_count0 = 0;
	logic[20:0] led_count1 = 0;

	always_ff @(posedge led_clk0) begin
		led_count0 <= led_count0 + 1;
		if(led_count0 == 0)
			sgmii_led[0] <= !sgmii_led[0];
	end

	always_ff @(posedge led_clk1) begin
		led_count1 <= led_count1 + 1;
		if(led_count1 == 0)
			sgmii_led[1] <= !sgmii_led[1];
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 10G SFP+ uplink (xg0)

	`include "GmiiBus.svh"
	`include "EthernetBus.svh"

	wire			xg0_rx_clk;
	wire			xg0_tx_clk;

	wire			xg0_rx_clk_raw;
	wire			xg0_tx_clk_raw;

	wire			xg0_rx_data_valid;
	wire			xg0_rx_header_valid;
	wire[1:0]		xg0_rx_header;
	wire[31:0]		xg0_rx_data;
	wire			xg0_rx_bitslip;

	wire[5:0]		xg0_tx_sequence;
	wire[1:0]		xg0_tx_header;
	wire[31:0]		xg0_tx_data;

	wire			xg0_remote_fault;

	//TODO: performance counters

	//Clock buffers
	ClockBuffer #(
		.TYPE("GLOBAL"),
		.CE("NO")
	) clk_buf_xg0_tx_clk (
		.clkin(xg0_tx_clk_raw),
		.ce(1'b1),
		.clkout(xg0_tx_clk)
		);

	ClockBuffer #(
		.TYPE("GLOBAL"),
		.CE("NO")
	) clk_buf_xg0_rx_clk (
		.clkin(xg0_rx_clk_raw),
		.ce(1'b1),
		.clkout(xg0_rx_clk)
		);

	sfp_wizard xg_transceiver(

		.sysclk_in(clk_125mhz),
		.soft_reset_tx_in(1'b0),
		.soft_reset_rx_in(1'b0),
		.dont_reset_on_data_error_in(1'b1),
		.gt0_tx_fsm_reset_done_out(),
		.gt0_rx_fsm_reset_done_out(),
		.gt0_data_valid_in(1'b1),

		//QPLL clocks
		.gt0_qplllock_in(qpll_lock),
		.gt0_qpllrefclklost_in(qpll_refclk_lost),
		.gt0_qpllreset_out(),
		.gt0_qplloutclk_in(qpll_clkout_10g3125),
		.gt0_qplloutrefclk_in(qpll_refclk),

		//DRP - not used, tie off
		.gt0_drpaddr_in(9'b0),
		.gt0_drpclk_in(clk_125mhz),
		.gt0_drpdi_in(16'b0),
		.gt0_drpdo_out(),
		.gt0_drpen_in(1'b0),
		.gt0_drprdy_out(),
		.gt0_drpwe_in(1'b0),

		//Polarity control
		.gt0_rxpolarity_in(1'b1),	//Invert RX to compensate for PCB pair swap
		.gt0_txpolarity_in(1'b1),	//Invert TX to compensate for PCB pair swap

		//Tie off other miscellaneous ports for unused interfaces
		.gt0_dmonitorout_out(),
		.gt0_eyescanreset_in(1'b0),
		.gt0_eyescandataerror_out(),
		.gt0_eyescantrigger_in(1'b0),
		.gt0_rxdfelpmreset_in(1'b0),
		.gt0_rxmonitorout_out(),
		.gt0_rxmonitorsel_in(2'b0),

		//Fabric RX interface
		.gt0_rxusrclk_in(xg0_rx_clk),
		.gt0_rxusrclk2_in(xg0_rx_clk),
		.gt0_rxdata_out(xg0_rx_data),
		.gt0_rxoutclk_out(xg0_rx_clk_raw),
		.gt0_rxoutclkfabric_out(),
		.gt0_rxdatavalid_out(xg0_rx_data_valid),
		.gt0_rxheader_out(xg0_rx_header),
		.gt0_rxheadervalid_out(xg0_rx_header_valid),
		.gt0_rxgearboxslip_in(xg0_rx_bitslip),

		//Reset controls
		.gt0_gtrxreset_in(1'b0),
		.gt0_rxpmareset_in(1'b0),
		.gt0_rxresetdone_out(),
		.gt0_gttxreset_in(1'b0),
		.gt0_rxuserrdy_in(1'b1),
		.gt0_txuserrdy_in(1'b1),
		.gt0_txresetdone_out(),

		//TX driver control
		.gt0_txpostcursor_in(5'b0),
		.gt0_txprecursor_in(5'b0),
		.gt0_txmaincursor_in(6'b0),
		.gt0_txdiffctrl_in(4'b0100),	//543 mV ppd

		//Fabric TX interface
		.gt0_txusrclk_in(xg0_tx_clk),
		.gt0_txusrclk2_in(xg0_tx_clk),
		.gt0_txdata_in(xg0_tx_data),
		.gt0_txoutclk_out(xg0_tx_clk_raw),
		.gt0_txoutclkfabric_out(),
		.gt0_txoutclkpcs_out(),
		.gt0_txheader_in(xg0_tx_header),
		.gt0_txsequence_in({1'b0, xg0_tx_sequence}),

		//Top level I/Os
		.gt0_gtxrxp_in(sfp_rx_p),
		.gt0_gtxrxn_in(sfp_rx_n),
		.gt0_gtxtxp_out(sfp_tx_p),
		.gt0_gtxtxn_out(sfp_tx_n)
	);

	XGMACWrapper port_xg0(
		.rx_clk(xg0_rx_clk),
		.tx_clk(xg0_tx_clk),

		.rx_data_valid(xg0_rx_data_valid),
		.rx_header_valid(xg0_rx_header_valid),
		.rx_header(xg0_rx_header),
		.rx_data(xg0_rx_data),
		.rx_bitslip(xg0_rx_bitslip),

		.tx_sequence(xg0_tx_sequence),
		.tx_header(xg0_tx_header),
		.tx_data(xg0_tx_data),

		.sfp_los(sfp_rx_los),

		.mac_rx_clk(xg0_mac_rx_clk),
		.mac_rx_bus(xg0_mac_rx_bus),

		.mac_tx_clk(xg0_mac_tx_clk),
		.mac_tx_bus(xg0_mac_tx_bus),

		.link_up(xg0_link_up),
		.remote_fault(xg0_remote_fault)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// QSGMII interfaces (g0-g11)

	wire[2:0]	cpll_lock;


	wire[2:0]	qsgmii_rx_clk_raw;
	wire[3:0]	qsgmii_rx_disparity_err[2:0];
	wire[3:0]	qsgmii_rx_symbol_err[2:0];
	wire[31:0]	qsgmii_rx_data_out[2:0];
	wire[3:0]	qsgmii_rx_data_is_ctl[2:0];
	wire[2:0]	qsgmii_rx_aligned;

	wire[2:0]	qsgmii_tx_clk_raw;
	wire[3:0]	qsgmii_tx_force_disparity_negative[2:0];
	wire[31:0]	qsgmii_tx_data[3:0];
	wire[3:0]	qsgmii_tx_data_is_ctl[2:0];

	qsgmii_transceiver port_g0_g11(

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Common

		.sysclk_in(clk_125mhz),
		.soft_reset_tx_in(1'b0),
		.soft_reset_rx_in(1'b0),
		.dont_reset_on_data_error_in(1'b0),

		.gt0_tx_fsm_reset_done_out(),
		.gt0_rx_fsm_reset_done_out(),
		.gt0_data_valid_in(1'b1),
		.gt0_tx_mmcm_lock_in(1'b1),
		.gt0_tx_mmcm_reset_out(),

		.gt1_tx_fsm_reset_done_out(),
		.gt1_rx_fsm_reset_done_out(),
		.gt1_data_valid_in(1'b1),
		.gt1_tx_mmcm_lock_in(1'b1),
		.gt1_tx_mmcm_reset_out(),

		.gt2_tx_fsm_reset_done_out(),
		.gt2_rx_fsm_reset_done_out(),
		.gt2_data_valid_in(1'b1),
		.gt2_tx_mmcm_lock_in(1'b1),
		.gt2_tx_mmcm_reset_out(),

		.gt0_qplloutclk_in(qpll_clkout_10g3125),
		.gt0_qplloutrefclk_in(qpll_refclk),

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Lane 0 (g0-g3)

		.gt0_cpllfbclklost_out(),
		.gt0_cplllock_out(cpll_lock[0]),
		.gt0_cplllockdetclk_in(clk_125mhz),
		.gt0_cpllreset_in(1'b0),

		.gt0_gtrefclk0_in(serdes_refclk_156m25),
		.gt0_gtrefclk1_in(serdes_refclk_200m),

		.gt0_drpaddr_in(8'b0),
		.gt0_drpclk_in(clk_125mhz),
		.gt0_drpdi_in(16'b0),
		.gt0_drpdo_out(),
		.gt0_drpen_in(1'b0),
		.gt0_drprdy_out(),
		.gt0_drpwe_in(1'b0),

		.gt0_dmonitorout_out(),
		.gt0_eyescanreset_in(1'b0),
		.gt0_rxuserrdy_in(pll_main_lock),
		.gt0_eyescandataerror_out(),
		.gt0_eyescantrigger_in(1'b0),

		.gt0_rxusrclk_in(qsgmii_rx_clk[0]),
		.gt0_rxusrclk2_in(qsgmii_rx_clk[0]),
		.gt0_rxdata_out(qsgmii_rx_data_out[0]),
		.gt0_rxdisperr_out(qsgmii_rx_disparity_err[0]),
		.gt0_rxnotintable_out(qsgmii_rx_symbol_err[0]),

		.gt0_gtxrxp_in(qsgmii_rx_p[0]),
		.gt0_gtxrxn_in(qsgmii_rx_n[0]),

		.gt0_rxbyteisaligned_out(qsgmii_rx_aligned[0]),

		.gt0_rxdfelpmreset_in(1'b0),
		.gt0_rxmonitorout_out(),
		.gt0_rxmonitorsel_in(2'b0),

		.gt0_rxoutclk_out(qsgmii_rx_clk_raw[0]),
		.gt0_rxoutclkfabric_out(),

		.gt0_gtrxreset_in(1'b0),
		.gt0_rxpmareset_in(1'b0),

		.gt0_rxpolarity_in(1'b0),	//no inversion

		.gt0_rxcharisk_out(qsgmii_rx_data_is_ctl[0]),

		.gt0_rxresetdone_out(),

		.gt0_gttxreset_in(1'b0),
		.gt0_txuserrdy_in(pll_main_lock),
		.gt0_txchardispmode_in(qsgmii_tx_force_disparity_negative[0]),
		.gt0_txchardispval_in(4'b0),

		.gt0_txusrclk_in(qsgmii_tx_clk[0]),
		.gt0_txusrclk2_in(qsgmii_tx_clk[0]),

		.gt0_txdata_in(qsgmii_tx_data[0]),

		.gt0_gtxtxn_out(qsgmii_tx_n[0]),
		.gt0_gtxtxp_out(qsgmii_tx_p[0]),

		.gt0_txoutclk_out(qsgmii_tx_clk_raw[0]),
		.gt0_txoutclkfabric_out(),
		.gt0_txoutclkpcs_out(),

		.gt0_txcharisk_in(qsgmii_tx_data_is_ctl[0]),

		.gt0_txresetdone_out(),
		.gt0_txpolarity_in(1'b0),	//no inversion

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Lane 1 (g4-g7)

		.gt1_cpllfbclklost_out(),
		.gt1_cplllock_out(cpll_lock[1]),
		.gt1_cplllockdetclk_in(clk_125mhz),
		.gt1_cpllreset_in(1'b0),

		.gt1_gtrefclk0_in(serdes_refclk_156m25),
		.gt1_gtrefclk1_in(serdes_refclk_200m),

		.gt1_drpaddr_in(8'b0),
		.gt1_drpclk_in(clk_125mhz),
		.gt1_drpdi_in(16'b0),
		.gt1_drpdo_out(),
		.gt1_drpen_in(1'b0),
		.gt1_drprdy_out(),
		.gt1_drpwe_in(1'b0),

		.gt1_dmonitorout_out(),
		.gt1_eyescanreset_in(1'b0),
		.gt1_rxuserrdy_in(pll_main_lock),
		.gt1_eyescandataerror_out(),
		.gt1_eyescantrigger_in(1'b0),

		.gt1_rxusrclk_in(qsgmii_rx_clk[1]),
		.gt1_rxusrclk2_in(qsgmii_rx_clk[1]),
		.gt1_rxdata_out(qsgmii_rx_data_out[1]),
		.gt1_rxdisperr_out(qsgmii_rx_disparity_err[1]),
		.gt1_rxnotintable_out(qsgmii_rx_symbol_err[1]),

		.gt1_gtxrxp_in(qsgmii_rx_p[1]),
		.gt1_gtxrxn_in(qsgmii_rx_n[1]),

		.gt1_rxbyteisaligned_out(qsgmii_rx_aligned[1]),

		.gt1_rxdfelpmreset_in(1'b0),
		.gt1_rxmonitorout_out(),
		.gt1_rxmonitorsel_in(2'b0),

		.gt1_rxoutclk_out(qsgmii_rx_clk_raw[1]),
		.gt1_rxoutclkfabric_out(),

		.gt1_gtrxreset_in(1'b0),
		.gt1_rxpmareset_in(1'b0),

		.gt1_rxpolarity_in(1'b0),	//no inversion

		.gt1_rxcharisk_out(qsgmii_rx_data_is_ctl[1]),

		.gt1_rxresetdone_out(),

		.gt1_gttxreset_in(1'b0),
		.gt1_txuserrdy_in(pll_main_lock),
		.gt1_txchardispmode_in(qsgmii_tx_force_disparity_negative[1]),
		.gt1_txchardispval_in(4'b0),

		.gt1_txusrclk_in(qsgmii_tx_clk[1]),
		.gt1_txusrclk2_in(qsgmii_tx_clk[1]),

		.gt1_txdata_in(qsgmii_tx_data[1]),

		.gt1_gtxtxn_out(qsgmii_tx_n[1]),
		.gt1_gtxtxp_out(qsgmii_tx_p[1]),

		.gt1_txoutclk_out(qsgmii_tx_clk_raw[1]),
		.gt1_txoutclkfabric_out(),
		.gt1_txoutclkpcs_out(),

		.gt1_txcharisk_in(qsgmii_tx_data_is_ctl[1]),

		.gt1_txresetdone_out(),
		.gt1_txpolarity_in(1'b0),	//no inversion

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Lane 2 (g8-g11)

		.gt2_cpllfbclklost_out(),
		.gt2_cplllock_out(cpll_lock[2]),
		.gt2_cplllockdetclk_in(clk_125mhz),
		.gt2_cpllreset_in(1'b0),

		.gt2_gtrefclk0_in(serdes_refclk_156m25),
		.gt2_gtrefclk1_in(serdes_refclk_200m),

		.gt2_drpaddr_in(8'b0),
		.gt2_drpclk_in(clk_125mhz),
		.gt2_drpdi_in(16'b0),
		.gt2_drpdo_out(),
		.gt2_drpen_in(1'b0),
		.gt2_drprdy_out(),
		.gt2_drpwe_in(1'b0),

		.gt2_dmonitorout_out(),
		.gt2_eyescanreset_in(1'b0),
		.gt2_rxuserrdy_in(pll_main_lock),
		.gt2_eyescandataerror_out(),
		.gt2_eyescantrigger_in(1'b0),

		.gt2_rxusrclk_in(qsgmii_rx_clk[2]),
		.gt2_rxusrclk2_in(qsgmii_rx_clk[2]),
		.gt2_rxdata_out(qsgmii_rx_data_out[2]),
		.gt2_rxdisperr_out(qsgmii_rx_disparity_err[2]),
		.gt2_rxnotintable_out(qsgmii_rx_symbol_err[2]),

		.gt2_gtxrxp_in(qsgmii_rx_p[2]),
		.gt2_gtxrxn_in(qsgmii_rx_n[2]),

		.gt2_rxbyteisaligned_out(qsgmii_rx_aligned[2]),

		.gt2_rxdfelpmreset_in(1'b0),
		.gt2_rxmonitorout_out(),
		.gt2_rxmonitorsel_in(2'b0),

		.gt2_rxoutclk_out(qsgmii_rx_clk_raw[2]),
		.gt2_rxoutclkfabric_out(),

		.gt2_gtrxreset_in(1'b0),
		.gt2_rxpmareset_in(1'b0),

		.gt2_rxpolarity_in(1'b1),	//inverted for pcb routability

		.gt2_rxcharisk_out(qsgmii_rx_data_is_ctl[2]),

		.gt2_rxresetdone_out(),

		.gt2_gttxreset_in(1'b0),
		.gt2_txuserrdy_in(pll_main_lock),
		.gt2_txchardispmode_in(qsgmii_tx_force_disparity_negative[2]),
		.gt2_txchardispval_in(4'b0),

		.gt2_txusrclk_in(qsgmii_tx_clk[2]),
		.gt2_txusrclk2_in(qsgmii_tx_clk[2]),

		.gt2_txdata_in(qsgmii_tx_data[2]),

		.gt2_gtxtxn_out(qsgmii_tx_n[2]),
		.gt2_gtxtxp_out(qsgmii_tx_p[2]),

		.gt2_txoutclk_out(qsgmii_tx_clk_raw[2]),
		.gt2_txoutclkfabric_out(),
		.gt2_txoutclkpcs_out(),

		.gt2_txcharisk_in(qsgmii_tx_data_is_ctl[2]),

		.gt2_txresetdone_out(),
		.gt2_txpolarity_in(1'b0)	//no inversion
	);

	for(genvar g=0; g<3; g=g+1) begin : qsgmii

		//RX can use a BUFH since we transition away from that domain quickly
		//But for now, we place that logic in another clock region so stick with a BUFG?
		BUFG clkbuf_rx(
			.I(qsgmii_rx_clk_raw[g]),
			.O(qsgmii_rx_clk[g])
		);

		//TX clock is used for more stuff
		BUFG clkbuf_tx(
			.I(qsgmii_tx_clk_raw[g]),
			.O(qsgmii_tx_clk[g])
		);

		QSGMIIMACWrapper quad(
			.rx_clk(qsgmii_rx_clk[g]),
			.rx_data_valid(qsgmii_rx_aligned[g]),
			.rx_data_is_ctl(qsgmii_rx_data_is_ctl[g]),
			.rx_data(qsgmii_rx_data_out[g]),
			.rx_disparity_err(qsgmii_rx_disparity_err[g]),
			.rx_symbol_err(qsgmii_rx_symbol_err[g]),

			.tx_clk(qsgmii_tx_clk[g]),
			.tx_data_is_ctl(qsgmii_tx_data_is_ctl[g]),
			.tx_data(qsgmii_tx_data[g]),
			.tx_force_disparity_negative(qsgmii_tx_force_disparity_negative[g]),

			.mac_rx_bus(qsgmii_mac_rx_bus[g*4 +: 4]),
			.link_up(qsgmii_link_up[g*4 +: 4]),
			.link_speed(qsgmii_link_speed[g*4 +: 4]),
			.mac_perf(qsgmii_mac_perf[g*4 +: 4]),

			.mac_tx_bus(qsgmii_mac_tx_bus[g*4 +: 4]),
			.mac_tx_ready(qsgmii_mac_tx_ready[g*4 +: 4])
		);

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SGMII interfaces (g12, g13)

	`include "SGMIIToGMIIBridge.svh"

	wire							g12_rst_stat;
	assign g12_rst_stat = 0;

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

		.mac_rx_clk(),
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

	wire							g13_rst_stat;
	assign g13_rst_stat = 0;

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

		.mac_rx_clk(),
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

		.mac_rx_clk(mgmt0_rx_clk_buf),
		.mac_rx_bus(mgmt0_rx_bus),

		.mac_tx_bus(mgmt0_tx_bus),
		.mac_tx_ready(mgmt0_tx_ready),

		.link_up(mgmt0_link_up),
		.link_speed(mgmt0_link_speed)
		);


endmodule
