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
	parameter NUM_PORTS						= 15
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

	//Configuration registers in crypto clock domain
	input wire						clk_crypt,
	output wire						crypt_en,
	output wire[255:0]				crypt_work_in,
	output wire[255:0]				crypt_e,
	input wire						crypt_out_valid,
	input wire[255:0]				crypt_work_out
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

	ManagementRxFifo rx_fifo(
		.sys_clk(sys_clk),
		.mgmt0_rx_clk(mgmt0_rx_clk),
		.mgmt0_rx_bus(mgmt0_rx_bus),
		.mgmt0_link_up(mgmt0_link_up)
	);

	//DEBUG: vio on tx bus so it doesn't get optimized out
	vio_1 vio(
		.clk(mgmt0_tx_clk),
		.probe_in0(mgmt0_tx_ready),
		.probe_out0(mgmt0_tx_bus));

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// QSPI device bridge

	wire		mgmt_rd_en;
	wire[15:0]	mgmt_rd_addr;
	wire		mgmt_rd_valid;
	wire[7:0]	mgmt_rd_data;

	wire		mgmt_wr_en;
	wire[15:0]	mgmt_wr_addr;
	wire[7:0]	mgmt_wr_data;

	ManagementBridge bridge(
		.clk(sys_clk),

		.qspi_sck(qspi_sck),
		.qspi_cs_n(qspi_cs_n),
		.qspi_dq(qspi_dq),
		.irq(irq),

		.rd_en(mgmt_rd_en),
		.rd_addr(mgmt_rd_addr),
		.rd_valid(mgmt_rd_valid),
		.rd_data(mgmt_rd_data),

		.wr_en(mgmt_wr_en),
		.wr_addr(mgmt_wr_addr),
		.wr_data(mgmt_wr_data)
	);

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

	vio_2 vio_sensors(
		.clk(sys_clk),
		.probe_in0(die_temp),
		.probe_in1(volt_core),
		.probe_in2(volt_ram),
		.probe_in3(volt_aux)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Register interface

	ila_0 ila(
		.clk(sys_clk),
		.probe0(bridge.start),
		.probe1(bridge.insn_valid),
		.probe2(bridge.insn),
		.probe3(bridge.rd_mode),
		.probe4(bridge.rd_en),
		.probe5(bridge.rd_valid),
		.probe6(bridge.rd_data),
		.probe7(mgmt_rd_en),
		.probe8(mgmt_rd_addr),
		.probe9(mgmt_rd_valid),
		.probe10(mgmt_rd_data),
		.probe11(mgmt_wr_en),
		.probe12(mgmt_wr_addr),
		.probe13(mgmt_wr_data),
		.probe14(idcode_valid),
		.probe15(idcode),

		.probe16(qspi_sck),
		.probe17(qspi_cs_n),
		.probe18(bridge.qspi.dq_in),
		.probe19(bridge.qspi.dq_out)
	);

	ManagementRegisterInterface #(
		.NUM_PORTS(NUM_PORTS)
	) regs (
		.clk(sys_clk),

		//Memory bus
		.rd_en(mgmt_rd_en),
		.rd_addr(mgmt_rd_addr),
		.rd_valid(mgmt_rd_valid),
		.rd_data(mgmt_rd_data),

		.wr_en(mgmt_wr_en),
		.wr_addr(mgmt_wr_addr),
		.wr_data(mgmt_wr_data),

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

		//Control registers (port RX clock domain)
		.port_rx_clk(port_rx_clk),
		.port_rx_vlan(port_rx_vlan),
		.port_rx_tagged_allowed(port_rx_tagged_allowed),
		.port_rx_untagged_allowed(port_rx_untagged_allowed),

		//Control registers (crypto clock domain)
		.clk_crypt(clk_crypt),
		.crypt_work_in(crypt_work_in),
		.crypt_e(crypt_e),
		.crypt_out_valid(crypt_out_valid),
		.crypt_work_out(crypt_work_out)
	);

endmodule
