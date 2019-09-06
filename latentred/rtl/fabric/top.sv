`default_nettype none
`timescale 1ns/1ps
/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2018-2019 Andrew D. Zonenberg                                                                          *
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

`include "RxFifoBus.svh"
`include "SwitchFabric.svh"

module top(

	//Clocks
	input wire			clk_ref156,		//156.25 MHz refclk input for fabric

	input wire			gtx_ref156_p,	//156.25 MHz refclk input for GTX
	input wire			gtx_ref156_n,

	input wire			gtx_ref125_p,	//125 MHz refclk input for GTX
	input wire			gtx_ref125_n,

	//SGMII ports
	input wire[23:0]	sgmii_rx_n,
	input wire[23:0]	sgmii_rx_p,
	output wire[23:0]	sgmii_tx_n,
	output wire[23:0]	sgmii_tx_p,

	//10Gbase-R ports
	input wire[3:0]		sfi_rx_n,
	input wire[3:0]		sfi_rx_p,
	output wire[3:0]	sfi_tx_n,
	output wire[3:0]	sfi_tx_p,

	//TODO: SFP+ status pins

	//TODO: Flash interface

	//QDR-II+ SRAM
	output wire[35:0]	qdr_d,
	input wire[35:0]	qdr_q,
	output wire[17:0]	qdr_a,
	output wire			qdr_wps_n,
	output wire[3:0]	qdr_bws_n,
	output wire			qdr_rps_n,
	input wire			qdr_qvld,
	output wire			qdr_clk_p,
	output wire			qdr_clk_n,
	input wire			qdr_kclk_p,
	input wire			qdr_kclk_n

	//TODO: some kind of interface to INTEGRALSTICK FPGA for I/O expansion

	//TODO: slave SPI to INTEGRALSTICK MCU
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clock synthesis

	wire	clk_fabric;
	wire	clk_gmac;

	ClockGeneration clkgen(
		.clk_ref156(clk_ref156),
		.clk_fabric(clk_fabric),
		.clk_gmac(clk_gmac),
		.clk_ok()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// MAC address table

	wire		mac_lookup_en;
	vlan_t		mac_lookup_src_vlan;
	macaddr_t	mac_lookup_src_mac;
	port_t		mac_lookup_src_port;
	macaddr_t	mac_lookup_dst_mac;
	wire		mac_lookup_hit;
	port_t		mac_lookup_dst_port;

	//TODO: trigger the garbage collector on a timer
	logic		mac_gc_en	= 0;
	wire		mac_gc_done;

	//TODO: management interface, SPI slave, etc
	logic		mac_mgmt_rd_en	= 0;
	logic		mac_mgmt_del_en	= 0;
	wire		mac_mgmt_ack;
	logic[10:0]	mac_mgmt_addr		= 0;
	logic[2:0]	mac_mgmt_way		= 0;
	wire		mac_mgmt_rd_valid;
	wire		mac_mgmt_gc_mark;
	macaddr_t	mac_mgmt_rd_mac;
	vlan_t		mac_mgmt_rd_vlan;
	port_t		mac_mgmt_rd_port;

	MACAddressTable mactable(
		.clk(clk_fabric),

		.lookup_en(mac_lookup_en),
		.lookup_src_vlan(mac_lookup_src_vlan),
		.lookup_src_mac(mac_lookup_src_mac),
		.lookup_src_port(mac_lookup_src_port),
		.lookup_dst_mac(mac_lookup_dst_mac),
		.lookup_hit(mac_lookup_hit),
		.lookup_dst_port(mac_lookup_dst_port),

		.gc_en(mac_gc_en),
		.gc_done(mac_gc_done),

		.mgmt_rd_en(mac_mgmt_rd_en),
		.mgmt_del_en(mac_mgmt_del_en),
		.mgmt_ack(mac_mgmt_ack),
		.mgmt_addr(mac_mgmt_addr),
		.mgmt_way(mac_mgmt_way),
		.mgmt_rd_valid(mac_mgmt_rd_valid),
		.mgmt_rd_gc_mark(mac_mgmt_gc_mark),
		.mgmt_rd_mac(mac_mgmt_rd_mac),
		.mgmt_rd_vlan(mac_mgmt_rd_vlan),
		.mgmt_rd_port(mac_mgmt_rd_port)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 10G MACs

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 1G PCSes

	//packet1 is router advertisement from scrypt

	//The GMII buses, tie off all unused ports to zero for now
	GmiiBus[23:0]	gmii_rx_bus;
	assign gmii_rx_bus[23:1] = {23*$bits(GmiiBus){1'b0}};

	//Dummy packet generators for testing until we write the SGMII decoder
	logic			packet_gen_en	= 0;

	`ifdef SIMULATION
		TrafficGenerator #( .PACKET_FNAME("packet1.hex") ) gen (
			.packet_gen_en(packet_gen_en),
			.clk_fabric(clk_fabric),
			.clk_mac(clk_gmac),
			.gmii_rx_bus(gmii_rx_bus[0])
		);
	`endif

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 1G MACs

	EthernetRxBus[23:0] mac_rx_bus;

	for(genvar g=0; g<24; g=g+1) begin

		TriSpeedEthernetMAC #(
			.RX_CRC_DISABLE(1)		//injected packets lack crc so don't check for now
		) mac (
			.gmii_rx_clk(clk_gmac),
			.gmii_rx_bus(gmii_rx_bus[g]),
			.gmii_tx_clk(clk_gmac),
			.gmii_tx_bus(),

			.link_up(1),
			.link_speed(LINK_SPEED_1000M),

			.rx_bus(mac_rx_bus[g]),
			.tx_bus({$bits(EthernetTxBus){1'b0}}),

			.tx_ready(),
			.perf()
		);

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 1G frame parsing

	EthernetRxL2Bus[23:0] rx_l2_bus;

	for(genvar g=0; g<24; g=g+1) begin
		Ethernet2TypeDecoder decoder(
			.rx_clk(clk_gmac),
			.mac_rx_bus(mac_rx_bus[g]),
			.our_mac_address(48'h0),
			.promisc_mode(1),
			.rx_l2_bus(rx_l2_bus[g]),
			.perf()
		);
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 10G RX FIFOs

	wire[27:0]		fifo_pop;
	wire[27:0]		fifo_fwd_en;

	RxFifoBus[27:0]	fifo_bus;

	assign fifo_bus[27:24] = {4*$bits(RxFifoBus){1'b0}};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 1G RX FIFOs

	`include "RxFifoBus.svh"

	RxFifoBus[23:0] rx_fabric_bus;

	for(genvar g=0; g<24; g=g+1) begin
		RxFifo dut(
			.mac_clk(clk_gmac),
			.mac_rx_bus(rx_l2_bus[g]),

			.link_state(1'b1),

			.has_port_vlan(1'b1),			//TODO: port VLAN configuration
			.port_vlan_id(12'd5),
			.native_vlan_allowed(1'b0),

			.mac_queued(),
			.mac_drop_fifo(),
			.mac_drop_vlan(),
			.mac_drop_runt(),
			.mac_drop_jumbo(),

			.fabric_clk(clk_fabric),
			.fabric_fwd_en(fifo_fwd_en[g]),
			.fabric_pop(fifo_pop[g]),
			.fabric_bus(fifo_bus[g])
		);
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual switch fabric

	SwitchFabric fabric(
		.clk(clk_fabric),

		.mac_lookup_en(mac_lookup_en),
		.mac_lookup_src_vlan(mac_lookup_src_vlan),
		.mac_lookup_src_mac(mac_lookup_src_mac),
		.mac_lookup_src_port(mac_lookup_src_port),
		.mac_lookup_dst_mac(mac_lookup_dst_mac),
		.mac_lookup_hit(mac_lookup_hit),
		.mac_lookup_dst_port(mac_lookup_dst_port),

		.fifo_pop(fifo_pop),
		.fifo_fwd_en(fifo_fwd_en),
		.fifo_bus(fifo_bus)
	);

endmodule
