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
 */
module ManagementSubsystem #(
	parameter NUM_PORTS				= 15,
	localparam PORT_BITS			= $clog2(NUM_PORTS)
)(
	input wire						sys_clk,
	input wire						clk_sysinfo,

	input wire						qspi_sck,
	input wire						qspi_cs_n,
	inout wire[3:0]					qspi_dq,
	output wire						irq,

	//Management network bus
	input wire						mgmt0_rx_clk,
	input wire						mgmt0_tx_clk,

	input wire EthernetRxBus		mgmt0_rx_bus,
	output EthernetTxBus			mgmt0_tx_bus,
	input wire						mgmt0_tx_ready,
	input wire						mgmt0_link_up,
	input wire lspeed_t				mgmt0_link_speed,

	inout wire						mgmt0_mdio,
	output wire						mgmt0_mdc,

	input wire						xg0_link_up,

	inout wire						dp_mdio,
	output wire						dp_mdc,
	input wire						g12_int_n,
	input wire[1:0]					g12_gpio,
	input wire						g13_int_n,
	input wire[1:0]					g13_gpio,

	output wire						vsc_mdc,
	inout wire						vsc_mdio,
	output wire						vsc_mdio_oe,

	//Tachometers for fans
	input wire[1:0]					fan_tach,

	//Configuration registers in port RX clock domains
	input wire[NUM_PORTS-1:0]		port_rx_clk,
	output vlan_t[NUM_PORTS-1:0]	port_rx_vlan,
	output wire[NUM_PORTS-1:0]		port_rx_tagged_allowed,
	output wire[NUM_PORTS-1:0]		port_rx_untagged_allowed,

	//Configuration registers in core clock domain
	output vlan_t[NUM_PORTS-1:0]	port_vlan,
	output wire[NUM_PORTS-1:0]		port_is_trunk,
	output wire						mbist_start,
	output wire[31:0]				mbist_seed,
	input wire						mbist_done,
	input wire						mbist_fail,
	input wire[17:0]				mbist_fail_addr,
	output wire						mbist_select,

	//Configuration registers in crypto clock domain
	input wire						clk_crypt,
	output wire						crypt_en,
	output wire[255:0]				crypt_work_in,
	output wire[255:0]				crypt_e,
	input wire						crypt_out_valid,
	input wire[255:0]				crypt_work_out,

	//Network interface performance counter access in core clock domain
	output wire						net_perf_rd,
	output wire[PORT_BITS-1:0]		net_perf_rd_port,
	output wire[15:0]				net_perf_regid,
	input wire						net_perf_valid,
	input wire[63:0]				net_perf_value
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// MDIO transceivers

	wire		mgmt0_mdio_tx_data;
	wire		mgmt0_mdio_tx_en;
	wire		mgmt0_mdio_rx_data;

	BidirectionalBuffer mgmt0_mdio_obuf(
		.fabric_in(mgmt0_mdio_rx_data),
		.fabric_out(mgmt0_mdio_tx_data),
		.pad(mgmt0_mdio),
		.oe(mgmt0_mdio_tx_en)
	);

	wire		mgmt0_mdio_busy;
	wire[4:0]	mgmt0_phy_reg_addr;
	wire[15:0]	mgmt0_phy_wr_data;
	wire[15:0]	mgmt0_phy_rd_data;
	wire		mgmt0_phy_reg_wr;
	wire		mgmt0_phy_reg_rd;
	wire[4:0]	mgmt0_phy_md_addr;

	//Prevent any logic from the rest of this module from being optimized into the bridge
	//(because it's placed way off in the corner of the die near the QSPI IOBs)
	(* keep_hierarchy = "yes" *)
	EthernetMDIOTransceiver #(
		.CLK_DIV(75)
	)  mgmt0_mdio_txvr (
		.clk(sys_clk),
		.phy_md_addr(mgmt0_phy_md_addr),

		.mdio_tx_data(mgmt0_mdio_tx_data),
		.mdio_tx_en(mgmt0_mdio_tx_en),
		.mdio_rx_data(mgmt0_mdio_rx_data),
		.mdc(mgmt0_mdc),

		.mgmt_busy_fwd(mgmt0_mdio_busy),
		.phy_reg_addr(mgmt0_phy_reg_addr),
		.phy_wr_data(mgmt0_phy_wr_data),
		.phy_rd_data(mgmt0_phy_rd_data),
		.phy_reg_wr(mgmt0_phy_reg_wr),
		.phy_reg_rd(mgmt0_phy_reg_rd)
	);

	wire		dp_mdio_tx_data;
	wire		dp_mdio_tx_en;
	wire		dp_mdio_rx_data;

	BidirectionalBuffer dp_mdio_obuf(
		.fabric_in(dp_mdio_rx_data),
		.fabric_out(dp_mdio_tx_data),
		.pad(dp_mdio),
		.oe(dp_mdio_tx_en)
	);

	wire		dp_mdio_busy;
	wire[4:0]	dp_phy_reg_addr;
	wire[15:0]	dp_phy_wr_data;
	wire[15:0]	dp_phy_rd_data;
	wire		dp_phy_reg_wr;
	wire		dp_phy_reg_rd;
	wire[4:0]	dp_phy_md_addr;

	wire		dp_mdc_raw;

	(* keep_hierarchy = "yes" *)
	EthernetMDIOTransceiver #(
		.CLK_DIV(75)
	)  dp_mdio_txvr (
		.clk(sys_clk),
		.phy_md_addr(dp_phy_md_addr),

		.mdio_tx_data(dp_mdio_tx_data),
		.mdio_tx_en(dp_mdio_tx_en),
		.mdio_rx_data(dp_mdio_rx_data),
		.mdc(dp_mdc_raw),

		.mgmt_busy_fwd(dp_mdio_busy),
		.phy_reg_addr(dp_phy_reg_addr),
		.phy_wr_data(dp_phy_wr_data),
		.phy_rd_data(dp_phy_rd_data),
		.phy_reg_wr(dp_phy_reg_wr),
		.phy_reg_rd(dp_phy_reg_rd)
	);

	//Ungate MDC after a while
	//TODO: check if this is actually needed
	logic mdc_ce = 0;
	logic[19:0] gate_count = 1;
	always_ff @(posedge sys_clk) begin
		if(gate_count == 0)
			mdc_ce	<= 1;
		else
			gate_count	<= gate_count + 1'h1;
	end
	assign dp_mdc = dp_mdc_raw & mdc_ce;

	wire		vsc_mdio_tx_data;
	wire		vsc_mdio_tx_en;
	wire		vsc_mdio_rx_data;

	assign vsc_mdio_oe = vsc_mdio_tx_en;

	BidirectionalBuffer vsc_mdio_obuf(
		.fabric_in(vsc_mdio_rx_data),
		.fabric_out(vsc_mdio_tx_data),
		.pad(vsc_mdio),
		.oe(vsc_mdio_tx_en)
	);

	wire		vsc_mdio_busy;
	wire[4:0]	vsc_phy_reg_addr;
	wire[15:0]	vsc_phy_wr_data;
	wire[15:0]	vsc_phy_rd_data;
	wire		vsc_phy_reg_wr;
	wire		vsc_phy_reg_rd;
	wire[4:0]	vsc_phy_md_addr;

	//Prevent any logic from the rest of this module from being optimized into the bridge
	//(because it's placed way off in the corner of the die near the QSPI IOBs)
	(* keep_hierarchy = "yes" *)
	EthernetMDIOTransceiver #(
		//.CLK_DIV(75)
		.CLK_DIV(750)
	)  vsc_mdio_txvr (
		.clk(sys_clk),
		.phy_md_addr(vsc_phy_md_addr),

		.mdio_tx_data(vsc_mdio_tx_data),
		.mdio_tx_en(vsc_mdio_tx_en),
		.mdio_rx_data(vsc_mdio_rx_data),
		.mdc(vsc_mdc),

		.mgmt_busy_fwd(vsc_mdio_busy),
		.phy_reg_addr(vsc_phy_reg_addr),
		.phy_wr_data(vsc_phy_wr_data),
		.phy_rd_data(vsc_phy_rd_data),
		.phy_reg_wr(vsc_phy_reg_wr),
		.phy_reg_rd(vsc_phy_reg_rd)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Tachometer

	wire[15:0] fan0_rpm;
	wire[15:0] fan1_rpm;

	Tachometer #(
		.REFCLK_HZ(187500000)
	) tach0 (
		.clk(sys_clk),
		.tach(fan_tach[0]),
		.rpm(fan0_rpm));

	Tachometer #(
		.REFCLK_HZ(187500000)
	) tach1 (
		.clk(sys_clk),
		.tach(fan_tach[1]),
		.rpm(fan1_rpm));

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// FIFO for storing incoming Ethernet frames

	wire		rxfifo_rd_en;
	wire		rxfifo_rd_pop_single;
	wire[31:0]	rxfifo_rd_data;
	wire		rxheader_rd_en;
	wire		rxheader_rd_empty;
	wire[10:0]	rxheader_rd_data;

	ManagementRxFifo rx_fifo(
		.sys_clk(sys_clk),
		.mgmt0_rx_clk(mgmt0_rx_clk),
		.mgmt0_rx_bus(mgmt0_rx_bus),
		.mgmt0_link_up(mgmt0_link_up),

		.rxfifo_rd_en(rxfifo_rd_en),
		.rxfifo_rd_pop_single(rxfifo_rd_pop_single),
		.rxfifo_rd_data(rxfifo_rd_data),
		.rxheader_rd_en(rxheader_rd_en),
		.rxheader_rd_empty(rxheader_rd_empty),
		.rxheader_rd_data(rxheader_rd_data)
	);

	wire		txfifo_wr_en;
	wire[7:0]	txfifo_wr_data;
	wire		txfifo_wr_commit;

	ManagementTxFifo tx_fifo(
		.sys_clk(sys_clk),

		.wr_en(txfifo_wr_en),
		.wr_data(txfifo_wr_data),
		.wr_commit(txfifo_wr_commit),

		.tx_clk(mgmt0_tx_clk),
		.link_up(mgmt0_link_up),
		.tx_ready(mgmt0_tx_ready),
		.tx_bus(mgmt0_tx_bus)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// QSPI device bridge

	wire		mgmt_rd_en;
	wire[15:0]	mgmt_rd_addr;
	wire		mgmt_rd_valid;
	wire[7:0]	mgmt_rd_data;

	wire		mgmt_wr_en;
	wire[15:0]	mgmt_wr_addr;
	wire[7:0]	mgmt_wr_data;

	logic		mgmt_rd_valid_out	= 0;
	logic[7:0]	mgmt_rd_data_out	= 0;

	//Prevent any logic from the rest of this module from being optimized into the bridge
	//(because it's placed way off in the corner of the die near the QSPI IOBs)
	(* keep_hierarchy = "yes" *)
	ManagementBridge bridge(
		.clk(sys_clk),

		.qspi_sck(qspi_sck),
		.qspi_cs_n(qspi_cs_n),
		.qspi_dq(qspi_dq),

		.rd_en(mgmt_rd_en),
		.rd_addr(mgmt_rd_addr),
		.rd_valid(mgmt_rd_valid_out),
		.rd_data(mgmt_rd_data_out),

		.wr_en(mgmt_wr_en),
		.wr_addr(mgmt_wr_addr),
		.wr_data(mgmt_wr_data)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Optionally pipeline read data by one cycle

	//always_ff @(posedge sys_clk) begin
	always_comb begin
		mgmt_rd_valid_out	= mgmt_rd_valid;
		mgmt_rd_data_out	= mgmt_rd_data;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Pipeline register on write data

	logic		mgmt_wr_en_ff	= 0;
	logic[15:0]	mgmt_wr_addr_ff	= 0;
	logic[7:0]	mgmt_wr_data_ff	= 0;

	always_ff @(posedge sys_clk) begin
		mgmt_wr_en_ff	<= mgmt_wr_en;
		mgmt_wr_addr_ff	<= mgmt_wr_addr;
		mgmt_wr_data_ff	<= mgmt_wr_data;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Device information

	wire[63:0]	die_serial;
	wire		die_serial_valid;

	wire[31:0]	idcode;
	wire		idcode_valid;

	DeviceInfo_7series info(
		.clk(clk_sysinfo),

		.die_serial(die_serial),
		.die_serial_valid(die_serial_valid),
		.idcode(idcode),
		.idcode_valid(idcode_valid)
	);

	wire[15:0]	die_temp;
	wire[15:0]	volt_core;
	wire[15:0]	volt_ram;
	wire[15:0]	volt_aux;

	OnDieSensors_7series #(
		.EXT_IN_ENABLE(16'h0)
	) sensors (
		.clk(sys_clk),
		.vin_p(),
		.vin_n(),
		.die_temp(die_temp),
		.volt_core(volt_core),
		.volt_ram(volt_ram),
		.volt_aux(volt_aux),
		.sensors_update(),

		.ext_in(),
		.ext_update(),
		.die_temp_native()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Register interface

	ManagementRegisterInterface #(
		.NUM_PORTS(NUM_PORTS)
	) regs (
		.clk(sys_clk),

		.irq(irq),

		//Memory bus
		.rd_en(mgmt_rd_en),
		.rd_addr(mgmt_rd_addr),
		.rd_valid(mgmt_rd_valid),
		.rd_data(mgmt_rd_data),

		.wr_en(mgmt_wr_en_ff),
		.wr_addr(mgmt_wr_addr_ff),
		.wr_data(mgmt_wr_data_ff),

		//Control registers (device info clock domain)
		.die_serial_valid(die_serial_valid),
		.die_serial(die_serial),
		.idcode_valid(idcode_valid),
		.idcode(idcode),

		//Control registers (core clock domain)
		.fan0_rpm(fan0_rpm),
		.fan1_rpm(fan1_rpm),
		.port_vlan(port_vlan),
		.port_is_trunk(port_is_trunk),
		.die_temp(die_temp),
		.volt_core(volt_core),
		.volt_ram(volt_ram),
		.volt_aux(volt_aux),
		.mbist_start(mbist_start),
		.mbist_seed(mbist_seed),
		.mbist_done(mbist_done),
		.mbist_fail(mbist_fail),
		.mbist_fail_addr(mbist_fail_addr),
		.mbist_select(mbist_select),
		.mgmt0_mdio_busy(mgmt0_mdio_busy),
		.mgmt0_phy_reg_addr(mgmt0_phy_reg_addr),
		.mgmt0_phy_wr_data(mgmt0_phy_wr_data),
		.mgmt0_phy_rd_data(mgmt0_phy_rd_data),
		.mgmt0_phy_reg_wr(mgmt0_phy_reg_wr),
		.mgmt0_phy_reg_rd(mgmt0_phy_reg_rd),
		.mgmt0_phy_md_addr(mgmt0_phy_md_addr),
		.dp_mdio_busy(dp_mdio_busy),
		.dp_phy_reg_addr(dp_phy_reg_addr),
		.dp_phy_wr_data(dp_phy_wr_data),
		.dp_phy_rd_data(dp_phy_rd_data),
		.dp_phy_reg_wr(dp_phy_reg_wr),
		.dp_phy_reg_rd(dp_phy_reg_rd),
		.dp_phy_md_addr(dp_phy_md_addr),
		.vsc_mdio_busy(vsc_mdio_busy),
		.vsc_phy_reg_addr(vsc_phy_reg_addr),
		.vsc_phy_wr_data(vsc_phy_wr_data),
		.vsc_phy_rd_data(vsc_phy_rd_data),
		.vsc_phy_reg_wr(vsc_phy_reg_wr),
		.vsc_phy_reg_rd(vsc_phy_reg_rd),
		.vsc_phy_md_addr(vsc_phy_md_addr),
		.rxfifo_rd_en(rxfifo_rd_en),
		.rxfifo_rd_pop_single(rxfifo_rd_pop_single),
		.rxfifo_rd_data(rxfifo_rd_data),
		.rxheader_rd_en(rxheader_rd_en),
		.rxheader_rd_empty(rxheader_rd_empty),
		.rxheader_rd_data(rxheader_rd_data),
		.txfifo_wr_en(txfifo_wr_en),
		.txfifo_wr_data(txfifo_wr_data),
		.txfifo_wr_commit(txfifo_wr_commit),

		//Control registers (port RX clock domain)
		.port_rx_clk(port_rx_clk),
		.port_rx_vlan(port_rx_vlan),
		.port_rx_tagged_allowed(port_rx_tagged_allowed),
		.port_rx_untagged_allowed(port_rx_untagged_allowed),
		.xg0_link_up(xg0_link_up),

		//Control registers (crypto clock domain)
		.clk_crypt(clk_crypt),
		.crypt_en(crypt_en),
		.crypt_work_in(crypt_work_in),
		.crypt_e(crypt_e),
		.crypt_out_valid(crypt_out_valid),
		.crypt_work_out(crypt_work_out),

		//MAC performance counter access
		.net_perf_rd(net_perf_rd),
		.net_perf_rd_port(net_perf_rd_port),
		.net_perf_regid(net_perf_regid),
		.net_perf_valid(net_perf_valid),
		.net_perf_value(net_perf_value)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// TODO: interrupt logic

	//We need to NOT optimize out the GPIOs so the pulldowns remain functional
	vio_2 vio_irq(
		.clk(sys_clk),
		.probe_in0(g12_int_n),
		.probe_in1(g13_int_n),
		.probe_in2(g12_gpio),
		.probe_in3(g13_gpio)
	);

endmodule
