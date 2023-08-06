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

	input wire			sfp_rx_los,

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

	//DEBUG: put various interesting signals on PMOD bus
	assign pmod_dq[7:2] = 0;
	assign pmod_dq[0] = dp_mdc;
	assign pmod_dq[1] = g12_rst_n;

	localparam NUM_PORTS = 15;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Level shift LEDs

	assign mgmt0_led_p_3v3 = ~mgmt0_led_n_1v8;
	assign g12_led_p_3v3 = g12_led_p_1v8;
	assign g13_led_p_3v3 = g13_led_p_1v8;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clocking

	wire	qpll_lock;
	wire	qpll_clkout_10g3125;

	wire	qpll_refclk;
	wire	qpll_refclk_lost;

	wire	serdes_refclk_156m25;
	wire	serdes_refclk_200m;

	wire clk_125mhz;
	wire clk_250mhz;
	wire clk_312p5mhz;
	wire clk_400mhz;
	wire clk_625mhz_0;
	wire clk_625mhz_90;

	wire clk_crypt;

	SerdesClocking clk_serdes(
		.gtx_refclk_156m25_p(gtx_refclk_156m25_p),
		.gtx_refclk_156m25_n(gtx_refclk_156m25_n),
		.gtx_refclk_200m_p(gtx_refclk_200m_p),
		.gtx_refclk_200m_n(gtx_refclk_200m_n),

		.serdes_refclk_156m25(serdes_refclk_156m25),
		.serdes_refclk_200m(serdes_refclk_200m),

		.clk_125mhz(clk_125mhz),

		.qpll_lock(qpll_lock),
		.qpll_refclk(qpll_refclk),
		.qpll_refclk_lost(qpll_refclk_lost),
		.qpll_clkout_10g3125(qpll_clkout_10g3125)
	);

	wire pll_rgmii_lock;
	wire pll_sgmii_lock;

	wire clk_ram;
	wire clk_ram_ctl;
	wire clk_ram_90;
	wire clk_sysinfo;

	wire pll_ram_lock;

	ClockGeneration clk_system(
		.clk_125mhz_p(clk_125mhz_p),
		.clk_125mhz_n(clk_125mhz_n),

		.clk_125mhz(clk_125mhz),
		.clk_250mhz(clk_250mhz),
		.pll_rgmii_lock(pll_rgmii_lock),

		.clk_312p5mhz(clk_312p5mhz),
		.clk_400mhz(clk_400mhz),
		.clk_625mhz_0(clk_625mhz_0),
		.clk_625mhz_90(clk_625mhz_90),
		.pll_sgmii_lock(pll_sgmii_lock),

		.clk_ram(clk_ram),
		.clk_ram_ctl(clk_ram_ctl),
		.clk_ram_90(clk_ram_90),
		.clk_sysinfo(clk_sysinfo),
		.clk_crypt(clk_crypt),

		.pll_ram_lock(pll_ram_lock)
	);


	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Network ports

	wire								xg0_mac_rx_clk;
	EthernetRxBus						xg0_mac_rx_bus;

	wire								xg0_mac_tx_clk;
	EthernetTxBus						xg0_mac_tx_bus;

	wire								xg0_link_up;

	wire[2:0]							qsgmii_rx_clk;
	wire[2:0]							qsgmii_tx_clk;

	EthernetRxBus[11:0]					qsgmii_mac_rx_bus;
	GigabitMacPerformanceCounters[11:0]	qsgmii_mac_perf;

	EthernetTxBus[11:0]					qsgmii_mac_tx_bus;
	wire[11:0]							qsgmii_mac_tx_ready;
	wire[11:0]							qsgmii_link_up;
	lspeed_t[11:0]						qsgmii_link_speed;

	EthernetRxBus						g12_rx_bus;
	EthernetTxBus						g12_tx_bus;
	wire								g12_tx_ready;
	wire								g12_link_up;
	lspeed_t							g12_link_speed;
	SGMIIPerformanceCounters			g12_sgmii_perf;
	GigabitMacPerformanceCounters		g12_mac_perf;

	EthernetRxBus						g13_rx_bus;
	EthernetTxBus						g13_tx_bus;
	wire								g13_tx_ready;
	wire								g13_link_up;
	lspeed_t							g13_link_speed;
	SGMIIPerformanceCounters			g13_sgmii_perf;
	GigabitMacPerformanceCounters		g13_mac_perf;

	wire								mgmt0_rx_clk_buf;

	EthernetRxBus						mgmt0_rx_bus;
	EthernetTxBus						mgmt0_tx_bus;
	wire								mgmt0_tx_ready;
	wire								mgmt0_link_up;
	lspeed_t							mgmt0_link_speed;

	assign								sfp_led[0]	= xg0_link_up;

	//Detect 10G link activity
	//TODO: transmit activity too (need CDC shift)
	PulseStretcher stretcher(
		.clk(xg0_mac_rx_clk),
		.pulse(xg0_mac_rx_bus.start),
		.stretched(sfp_led[1])
	);

	NetworkInterfaces interfaces(

		//Top level clocks
		.clk_125mhz(clk_125mhz),
		.clk_250mhz(clk_250mhz),
		.clk_312p5mhz(clk_312p5mhz),
		.clk_400mhz(clk_400mhz),
		.clk_625mhz_0(clk_625mhz_0),
		.clk_625mhz_90(clk_625mhz_90),
		.pll_rgmii_lock(pll_rgmii_lock),

		//QPLL stuff
		.qpll_lock(qpll_lock),
		.qpll_clkout_10g3125(qpll_clkout_10g3125),
		.qpll_refclk(qpll_refclk),
		.qpll_refclk_lost(qpll_refclk_lost),
		.serdes_refclk_156m25(serdes_refclk_156m25),
		.serdes_refclk_200m(serdes_refclk_200m),

		//External IOs for network ports
		.sfp_tx_p(sfp_tx_p),
		.sfp_tx_n(sfp_tx_n),
		.sfp_rx_p(sfp_rx_p),
		.sfp_rx_n(sfp_rx_n),

		.sfp_rx_los(sfp_rx_los),

		.qsgmii_tx_p(qsgmii_tx_p),
		.qsgmii_tx_n(qsgmii_tx_n),
		.qsgmii_rx_p(qsgmii_rx_p),
		.qsgmii_rx_n(qsgmii_rx_n),

		.mgmt0_rx_clk(mgmt0_rx_clk),
		.mgmt0_rx_dv(mgmt0_rx_dv),
		.mgmt0_rxd(mgmt0_rxd),
		.mgmt0_tx_clk(mgmt0_tx_clk),
		.mgmt0_tx_en(mgmt0_tx_en),
		.mgmt0_txd(mgmt0_txd),
		.mgmt0_rst_n(mgmt0_rst_n),

		.g12_rst_n(g12_rst_n),
		.g12_sgmii_tx_p(g12_sgmii_tx_p),
		.g12_sgmii_tx_n(g12_sgmii_tx_n),
		.g12_sgmii_rx_p(g12_sgmii_rx_p),
		.g12_sgmii_rx_n(g12_sgmii_rx_n),
		.g12_sgmii_rxclk_p(g12_sgmii_rxclk_p),
		.g12_sgmii_rxclk_n(g12_sgmii_rxclk_n),

		.g13_rst_n(g13_rst_n),
		.g13_sgmii_tx_p(g13_sgmii_tx_p),
		.g13_sgmii_tx_n(g13_sgmii_tx_n),
		.g13_sgmii_rx_p(g13_sgmii_rx_p),
		.g13_sgmii_rx_n(g13_sgmii_rx_n),
		.g13_sgmii_rxclk_p(g13_sgmii_rxclk_p),
		.g13_sgmii_rxclk_n(g13_sgmii_rxclk_n),

		//MAC buses
		.xg0_mac_rx_clk(xg0_mac_rx_clk),
		.xg0_mac_rx_bus(xg0_mac_rx_bus),
		.xg0_mac_tx_clk(xg0_mac_tx_clk),
		.xg0_mac_tx_bus(xg0_mac_tx_bus),
		.xg0_link_up(xg0_link_up),

		.qsgmii_rx_clk(qsgmii_rx_clk),
		.qsgmii_tx_clk(qsgmii_tx_clk),
		.qsgmii_mac_rx_bus(qsgmii_mac_rx_bus),
		.qsgmii_mac_perf(qsgmii_mac_perf),
		.qsgmii_mac_tx_bus(qsgmii_mac_tx_bus),
		.qsgmii_mac_tx_ready(qsgmii_mac_tx_ready),
		.qsgmii_link_up(qsgmii_link_up),
		.qsgmii_link_speed(qsgmii_link_speed),

		.g12_rx_bus(g12_rx_bus),
		.g12_tx_bus(g12_tx_bus),
		.g12_tx_ready(g12_tx_ready),
		.g12_link_up(g12_link_up),
		.g12_link_speed(g12_link_speed),
		.g12_sgmii_perf(g12_sgmii_perf),
		.g12_mac_perf(g12_mac_perf),

		.g13_rx_bus(g13_rx_bus),
		.g13_tx_bus(g13_tx_bus),
		.g13_tx_ready(g13_tx_ready),
		.g13_link_up(g13_link_up),
		.g13_link_speed(g13_link_speed),
		.g13_sgmii_perf(g13_sgmii_perf),
		.g13_mac_perf(g13_mac_perf),

		.mgmt0_rx_clk_buf(mgmt0_rx_clk_buf),
		.mgmt0_rx_bus(mgmt0_rx_bus),
		.mgmt0_tx_bus(mgmt0_tx_bus),
		.mgmt0_tx_ready(mgmt0_tx_ready),
		.mgmt0_link_up(mgmt0_link_up),
		.mgmt0_link_speed(mgmt0_link_speed),

		//DEBUG
		.gpio_led(gpio_led)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Buffer inbound packets

	vlan_t[NUM_PORTS-1:0]	port_rx_vlan;

	wire[NUM_PORTS-1:0]		port_rx_tagged_allowed;
	wire[NUM_PORTS-1:0]		port_rx_untagged_allowed;

	wire[NUM_PORTS-1:0]		port_rx_clk;
	assign port_rx_clk =
	{
		xg0_mac_rx_clk,		//xg0 serdes clock
		clk_125mhz,			//g13:12 oversample to 125 MHz domain
		clk_125mhz,
		qsgmii_rx_clk[2],	//g11:8 serdes clock
		qsgmii_rx_clk[2],
		qsgmii_rx_clk[2],
		qsgmii_rx_clk[2],
		qsgmii_rx_clk[1],	//g7:4 serdes clock
		qsgmii_rx_clk[1],
		qsgmii_rx_clk[1],
		qsgmii_rx_clk[1],
		qsgmii_rx_clk[0],	//g3:0 serdes clock
		qsgmii_rx_clk[0],
		qsgmii_rx_clk[0],
		qsgmii_rx_clk[0]
	};

	inportstate_t[NUM_PORTS-1:0]	fabric_state;
	wire[NUM_PORTS-1:0]				forward_en;
	wire							frame_last;
	wire							frame_valid;
	wire[127:0]						frame_data;

	wire		mbist_start;
	wire[31:0]	mbist_seed;
	wire		mbist_done;
	wire		mbist_fail;
	wire[17:0]	mbist_fail_addr;
	wire		mbist_select;

	wire[NUM_PORTS-1:0]				port_link_up;
	assign port_link_up =
	{
		xg0_link_up,
		g13_link_up,
		g12_link_up,
		qsgmii_link_up
	};

	PacketBuffering #(
		.NUM_PORTS(NUM_PORTS)
	) buffer (

		.port_rx_clk(port_rx_clk),
		.port_link_up(port_link_up),
		.port_rx_bus(
		{
			xg0_mac_rx_bus,
			g13_rx_bus,
			g12_rx_bus,
			qsgmii_mac_rx_bus
		}),

		.port_vlan(port_rx_vlan),
		.tagged_allowed(port_rx_tagged_allowed),
		.untagged_allowed(port_rx_untagged_allowed),

		.clk_ram_ctl(clk_ram_ctl),
		.clk_ram(clk_ram),
		.clk_ram_90(clk_ram_90),

		.qdr_d(qdr_d),
		.qdr_q(qdr_q),
		.qdr_a(qdr_a),
		.qdr_wps_n(qdr_wps_n),
		.qdr_bws_n(qdr_bws_n),
		.qdr_rps_n(qdr_rps_n),
		.qdr_qvld(qdr_qvld),
		.qdr_k_p(qdr_k_p),
		.qdr_k_n(qdr_k_n),
		.qdr_cq_p(qdr_cq_p),
		.qdr_cq_n(qdr_cq_n),

		.fabric_state(fabric_state),
		.forward_en(forward_en),
		.frame_valid(frame_valid),
		.frame_last(frame_last),
		.frame_data(frame_data),

		.mbist_start(mbist_start),
		.mbist_seed(mbist_seed),
		.mbist_done(mbist_done),
		.mbist_fail(mbist_fail),
		.mbist_fail_addr(mbist_fail_addr),
		.mbist_select(mbist_select)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Forwarding engine: takes frames out of the buffer and makes them go places

	vlan_t[NUM_PORTS-1:0]	port_vlan_fabric;
	wire[NUM_PORTS-1:0]		port_is_trunk;

	wire[NUM_PORTS-1:0]		port_trunk;
	wire[NUM_PORTS-1:0]		port_space_avail;
	logic[NUM_PORTS-1:0]	port_space_avail_ff = 0;

	wire[NUM_PORTS-1:0]		frame_port_wr;
	wire[10:0]				frame_len;

	//Pipeline delay to improve timing on the status flags
	always_ff @(posedge clk_ram_ctl) begin
		port_space_avail_ff	<= port_space_avail;
	end

	ForwardingEngine #(
		.NUM_PORTS(NUM_PORTS)
	) fwd (
		.clk_ram_ctl(clk_ram_ctl),

		.fabric_state(fabric_state),
		.forward_en(forward_en),

		.frame_valid(frame_valid),
		.frame_last(frame_last),
		.frame_data(frame_data),

		.port_vlan(port_vlan_fabric),
		.port_trunk(port_is_trunk),
		.port_space_avail(port_space_avail_ff),

		.frame_port_wr(frame_port_wr),
		.frame_len(frame_len)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Exit queues

	wire[NUM_PORTS-1:0]		port_tx_clk;
	assign port_tx_clk =
	{
		xg0_mac_tx_clk,		//xg0 serdes clock
		clk_125mhz,			//g13:12 oversample to 125 MHz domain
		clk_125mhz,
		qsgmii_tx_clk[2],	//g11:8 serdes clock
		qsgmii_tx_clk[2],
		qsgmii_tx_clk[2],
		qsgmii_tx_clk[2],
		qsgmii_tx_clk[1],	//g7:4 serdes clock
		qsgmii_tx_clk[1],
		qsgmii_tx_clk[1],
		qsgmii_tx_clk[1],
		qsgmii_tx_clk[0],	//g3:0 serdes clock
		qsgmii_tx_clk[0],
		qsgmii_tx_clk[0],
		qsgmii_tx_clk[0]
	};

	wire[NUM_PORTS-1:0] port_tx_ready;
	assign port_tx_ready =
	{
		1'b1,
		g13_tx_ready,
		g12_tx_ready,
		qsgmii_mac_tx_ready
	};

	EthernetTxBus[NUM_PORTS-1:0] port_tx_bus;
	assign xg0_mac_tx_bus = port_tx_bus[14];
	assign g13_tx_bus = port_tx_bus[13];
	assign g12_tx_bus = port_tx_bus[12];
	for(genvar g=0; g<3; g=g+1) begin
		for(genvar h=0; h<4; h=h+1) begin
			assign qsgmii_mac_tx_bus[g*4 + h] = port_tx_bus[g*4 + h];
		end
	end

	EgressFifo #(
		.NUM_PORTS(NUM_PORTS)
	) exit (
		.port_rx_clk(port_rx_clk),
		.port_link_up(port_link_up),

		.clk_ram_ctl(clk_ram_ctl),
		.frame_valid(frame_valid),
		.frame_last(frame_last),
		.frame_data(frame_data),
		.frame_len(frame_len),
		.frame_port_wr(frame_port_wr),
		.port_space_avail(port_space_avail),

		.port_tx_clk(port_tx_clk),
		.port_tx_ready(port_tx_ready),
		.port_tx_bus(port_tx_bus)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Curve25519 crypto_scalarmult accelerator (for speeding up SSH key exchange)

	wire		crypt_en;
	wire[255:0]	crypt_work_in;
	wire[255:0]	crypt_e;
	wire		crypt_out_valid;
	wire[255:0]	crypt_work_out;

	X25519_ScalarMult crypt25519(
		.clk(clk_crypt),
		.en(crypt_en),
		.work_in(crypt_work_in),
		.e(crypt_e),
		.out_valid(crypt_out_valid),
		.work_out(crypt_work_out)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Management subsystem

	//Run core of management logic in the RAM control domain so that we need less synchronizers
	//187.5 MHz, Fmax for QSPI is 1/4 this, so QSPI must be under 46.875 MHz
	ManagementSubsystem mgmt(
		.sys_clk(clk_ram_ctl),
		.clk_sysinfo(clk_sysinfo),

		.qspi_sck(mcu_sck),
		.qspi_cs_n(mcu_cs_n),
		.qspi_dq(mcu_dq),
		.irq(mcu_irq),

		.mgmt0_rx_clk(mgmt0_rx_clk_buf),
		.mgmt0_rx_bus(mgmt0_rx_bus),
		.mgmt0_tx_clk(clk_125mhz),
		.mgmt0_tx_bus(mgmt0_tx_bus),
		.mgmt0_tx_ready(mgmt0_tx_ready),
		.mgmt0_link_up(mgmt0_link_up),
		.mgmt0_link_speed(mgmt0_link_speed),

		.xg0_link_up(xg0_link_up),

		.mgmt0_mdio(mgmt0_mdio),
		.mgmt0_mdc(mgmt0_mdc),
		.dp_mdio(dp_mdio),
		.dp_mdc(dp_mdc),
		.g12_int_n(g12_int_n),
		.g12_gpio(g12_gpio),
		.g13_int_n(g13_int_n),
		.g13_gpio(g13_gpio),
		.vsc_mdc(vsc_mdc),
		.vsc_mdio(vsc_mdio),
		.vsc_mdio_oe(vsc_mdio_oe),

		.fan_tach(fan_tach),

		.port_rx_clk(port_rx_clk),
		.port_rx_vlan(port_rx_vlan),
		.port_rx_tagged_allowed(port_rx_tagged_allowed),
		.port_rx_untagged_allowed(port_rx_untagged_allowed),

		.port_vlan(port_vlan_fabric),
		.port_is_trunk(port_is_trunk),
		.mbist_start(mbist_start),
		.mbist_seed(mbist_seed),
		.mbist_done(mbist_done),
		.mbist_fail(mbist_fail),
		.mbist_fail_addr(mbist_fail_addr),
		.mbist_select(mbist_select),

		.clk_crypt(clk_crypt),
		.crypt_en(crypt_en),
		.crypt_work_in(crypt_work_in),
		.crypt_e(crypt_e),
		.crypt_out_valid(crypt_out_valid),
		.crypt_work_out(crypt_work_out)
	);


endmodule
