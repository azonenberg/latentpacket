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

module top(
	//Reset sequencing etc clock
	input wire			clk125mhz_p,
	input wire			clk125mhz_n,

	//10Gbase-R interfaces
	input wire			qsfp1_refclk_p,
	input wire			qsfp1_refclk_n,

	input wire[3:0]		qsfp1_rx_p,
	input wire[3:0]		qsfp1_rx_n,

	output wire[3:0]	qsfp1_tx_p,
	output wire[3:0]	qsfp1_tx_n

	//TODO: add SGMII 1G interface
	);

	wire	clk_125mhz;

	IBUFGDS clk_125mhz_ibuf(
		.I(clk125mhz_p),
		.IB(clk125mhz_n),
		.O(clk_125mhz)
		);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Generate 156.25 MHz fabric clock from external reference

	wire		clk_fabric;

	fabric_clkgen clkgen( .clk_in1(clk_125mhz), .clk_out1(clk_fabric));

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The GTY quad

	//Power-good flag control
	logic		tx_clock_stable	= 0;
	logic		rx_clock_stable = 0;
	wire[3:0]	pwrgood;
	logic[15:0] pgood_count = 1;
	always_ff @(posedge clk_125mhz) begin
		if(gty_reset)
			pgood_count			<= 1;
		else if(pwrgood != 4'hf) begin
			tx_clock_stable	<= 0;
			rx_clock_stable	<= 0;
			if(pgood_count > 1)
				pgood_count		<= 1;
		end
		else if(pgood_count)
			pgood_count			<= pgood_count + 1;
		else if(pwrgood) begin
			tx_clock_stable	<= 1;
			rx_clock_stable	<= 1;
		end
	end

	//Reset the quad
	logic		gty_reset		= 0;

	wire[31:0]	tx_data[3:0];
	wire[31:0]	rx_data[3:0];
	wire[3:0]	rx_bitslip;
	wire[3:0]	rx_usrclk;
	wire[3:0]	tx_usrclk;
	wire[5:0]	tx_header[3:0];
	wire[5:0]	rx_header[3:0];
	wire		tx_header_valid[3:0];
	wire[1:0]	rx_header_valid[3:0];
	wire[3:0]	rx_outclk;
	wire[3:0]	tx_outclk;

	for(genvar g=0; g<4; g++) begin
		BUFG_GT rxbuf(
			.I(rx_outclk[g]),
			.O(rx_usrclk[g]),
			.CLR(0),
			.CE(1),
			.CEMASK(0),
			.CLRMASK(0),
			.DIV(3'h0)
			);
		BUFG_GT txbuf(
			.I(tx_outclk[g]),
			.O(tx_usrclk[g]),
			.CLR(0),
			.CE(1),
			.CEMASK(0),
			.CLRMASK(0),
			.DIV(3'h0)
			);
	end

	wire		refclk;
	IBUFDS_GTE4 refbuf(
		.I(qsfp1_refclk_p),
		.IB(qsfp1_refclk_n),
		.O(refclk),
		.CEB(1'b0),
		.ODIV2()
	);

	//status signals
	wire[3:0]	rx_pmaresetdone;
	wire[3:0]	rx_divresetdone;
	wire[3:0]	tx_pmaresetdone;
	wire[3:0]	tx_divresetdone;
	wire[1:0]	rx_valid[3:0];

	gty_block quad (
		.gtwiz_userclk_tx_active_in(tx_clock_stable),
		.gtwiz_userclk_rx_active_in(rx_clock_stable),
		.gtwiz_reset_clk_freerun_in(clk_125mhz),
		.gtwiz_reset_all_in(gty_reset),
		.gtwiz_reset_tx_pll_and_datapath_in(1'b0),
		.gtwiz_reset_tx_datapath_in(1'b0),
		.gtwiz_reset_rx_pll_and_datapath_in(1'b0),
		.gtwiz_reset_rx_datapath_in(1'b0),
		.gtwiz_reset_rx_cdr_stable_out(),
		.gtwiz_reset_tx_done_out(),
		.gtwiz_reset_rx_done_out(),
		.gtwiz_userdata_tx_in({tx_data[3], tx_data[2], tx_data[1], tx_data[0]}),
		.gtwiz_userdata_rx_out({rx_data[3], rx_data[2], rx_data[1], rx_data[0]}),
		.gtrefclk00_in(refclk),
		.qpll0outclk_out(),
		.qpll0outrefclk_out(),
		.gtyrxn_in(qsfp1_rx_n),
		.gtyrxp_in(qsfp1_rx_p),
		.rxgearboxslip_in(rx_bitslip),
		.rxusrclk_in(rx_usrclk),
		.rxusrclk2_in(rx_usrclk),
		.txheader_in({tx_header[3], tx_header[2], tx_header[1], tx_header[0]}),
		.txusrclk_in(tx_usrclk),
		.txusrclk2_in(tx_usrclk),
		.txsequence_in({
			6'h0, tx_header_valid[3], 6'h0, tx_header_valid[2],
			6'h0, tx_header_valid[1], 6'h0, tx_header_valid[0]}),
		.gtpowergood_out(pwrgood),
		.gtytxn_out(qsfp1_tx_n),
		.gtytxp_out(qsfp1_tx_p),
		.rxdatavalid_out({rx_valid[3], rx_valid[2], rx_valid[1], rx_valid[0]}),
		.rxheader_out({rx_header[3], rx_header[2], rx_header[1], rx_header[0]}),
		.rxheadervalid_out({rx_header_valid[3], rx_header_valid[2], rx_header_valid[1], rx_header_valid[0]}),
		.rxoutclk_out(rx_outclk),
		.rxpmaresetdone_out(rx_pmaresetdone),
		.rxprgdivresetdone_out(rx_divresetdone),
		.rxstartofseq_out(),
		.txoutclk_out(tx_outclk),
		.txpmaresetdone_out(tx_pmaresetdone),
		.txprgdivresetdone_out(tx_divresetdone)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Buses to the fabric from all interfaces

	`include "RxFifoBus.svh"

	wire[27:0]		fabric_pop;
	wire[27:0]		fabric_fwd_en;
	RxFifoBus[27:0]	fabric_bus;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 1G SGMII interfaces (dummies for now)

	`include "GmiiBus.svh"

	for(genvar g=0; g<24; g++) begin : ports_1g

		/*
		EthernetRxL2Bus rx_l2_bus = {$bits(EthernetRxL2Bus){1'b0}};

		Ethernet2TypeDecoder decoder(
			.rx_clk(clk_125mhz),
			.mac_rx_bus({$bits(GmiiBus){1'b0}}),
			.our_mac_address(48'h0),
			.promisc_mode(1),
			.rx_l2_bus(rx_l2_bus),
			.perf()					//TODO: performance counters
		);


		RxFifo #(
			.FIFO_LINES(2048),
			.META_FIFO_LINES(256),
			.META_USE_BLOCK(1)
		) fifo (
			.mac_clk(clk_125mhz),
			.mac_rx_bus(rx_l2_bus),
			.link_state(1),

			.has_port_vlan(1),
			.port_vlan_id(g+1),			//port X (one based) is on vlan X
			.native_vlan_allowed(0),

			.mac_queued(),
			.mac_drop_fifo(),
			.mac_drop_vlan(),
			.mac_drop_runt(),
			.mac_drop_jumbo(),

			.fabric_clk(clk_fabric),
			.fabric_pop(fabric_pop[g]),
			.fabric_fwd_en(fabric_fwd_en[g]),
			.fabric_bus(fabric_bus[g])
		);
		*/
		assign fabric_bus[g] = {$bits(RxFifoBus){1'b0}};
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 10G interfaces

	`include "GmiiBus.svh"

	wire[3:0]	link_up;

	for(genvar g=0; g<4; g++) begin : ports_10g
		wire	block_sync_good;
		wire	remote_fault;

		assign tx_header[g][5:2] = 4'h0;

		wire		rx_clk;
		XgmiiBus	xgmii_rx_bus;
		wire		tx_clk;
		XgmiiBus	xgmii_tx_bus;

		//PCSes
		XGEthernetPCS pcs(
			.rx_clk(rx_usrclk[g]),
			.tx_clk(tx_usrclk[g]),
			.rx_header_valid(rx_header_valid[g][0]),
			.rx_header(rx_header[g][1:0]),
			.rx_data(rx_data[g]),
			.rx_bitslip(rx_bitslip[g]),
			.tx_header_valid(tx_header_valid[g]),
			.tx_header(tx_header[g][1:0]),
			.tx_data(tx_data[g]),

			.xgmii_rx_clk(rx_clk),
			.xgmii_rx_bus(xgmii_rx_bus),

			.xgmii_tx_clk(tx_clk),
			.xgmii_tx_bus(xgmii_tx_bus),

			.block_sync_good(block_sync_good),
			.link_up(link_up[g]),
			.remote_fault(remote_fault)
		);

		//MACs
		EthernetRxBus	rx_bus;
		EthernetRxBus	tx_bus = {$bits(EthernetRxBus){1'b0}};

		XGEthernetMAC mac(
			.xgmii_rx_clk(rx_clk),
			.xgmii_rx_bus(xgmii_rx_bus),
			.xgmii_tx_clk(tx_clk),
			.xgmii_tx_bus(xgmii_tx_bus),
			.link_up(link_up[g]),
			.rx_bus(rx_bus),
			.tx_bus(tx_bus)
		);

		//Ethernet frame parsing
		EthernetRxL2Bus rx_l2_bus;
		Ethernet2TypeDecoder decoder(
			.rx_clk(rx_clk),
			.mac_rx_bus(rx_bus),
			.our_mac_address(48'h0),
			.promisc_mode(1),
			.rx_l2_bus(rx_l2_bus),
			.perf()					//TODO: performance counters
		);

		RxFifo #(
			.FIFO_LINES(8192),
			.META_FIFO_LINES(1024),
			.META_USE_BLOCK(1)
		) fifo (
			.mac_clk(rx_clk),
			.mac_rx_bus(rx_l2_bus),
			.link_state(link_up[g]),

			.has_port_vlan(1),
			.port_vlan_id(2),		//TODO: make at least one port be a trunk?
			.native_vlan_allowed(0),

			.mac_queued(),
			.mac_drop_fifo(),
			.mac_drop_vlan(),
			.mac_drop_runt(),
			.mac_drop_jumbo(),

			.fabric_clk(clk_fabric),
			.fabric_pop(fabric_pop[24+g]),
			.fabric_fwd_en(fabric_fwd_en[24+g]),
			.fabric_bus(fabric_bus[24+g])
		);

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The MAC address table

	wire		mac_lookup_en;
	vlan_t		mac_lookup_src_vlan;
	macaddr_t	mac_lookup_src_mac;
	port_t		mac_lookup_src_port;
	macaddr_t	mac_lookup_dst_mac;

	wire		mac_lookup_hit;
	port_t		mac_lookup_dst_port;

	MACAddressTable mactbl(
		.clk(clk_fabric),

		.lookup_en(mac_lookup_en),
		.lookup_src_vlan(mac_lookup_src_vlan),
		.lookup_src_mac(mac_lookup_src_mac),
		.lookup_src_port(mac_lookup_src_port),
		.lookup_dst_mac(mac_lookup_dst_mac),
		.lookup_hit(mac_lookup_hit),
		.lookup_dst_port(mac_lookup_dst_port),

		.gc_en(0),	//never garbage collect for now
		.gc_done(),

		.mgmt_rd_en(1'b0),
		.mgmt_del_en(1'b0),
		.mgmt_ack(),
		.mgmt_addr(0),
		.mgmt_way(0),
		.mgmt_rd_valid(),
		.mgmt_rd_gc_mark(),
		.mgmt_rd_mac(),
		.mgmt_rd_vlan(),
		.mgmt_rd_port()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual switch fabric

	`include "TxFifoBus.svh"

	wire[27:0]	tx_fifo_ready;
	assign tx_fifo_ready = {28{1'b1}};

	TxFifoBus[27:0]	tx_fifo_bus;

	SwitchFabric fabric(
		.clk(clk_fabric),
		.mac_lookup_en(mac_lookup_en),
		.mac_lookup_src_vlan(mac_lookup_src_vlan),
		.mac_lookup_src_mac(mac_lookup_src_mac),
		.mac_lookup_src_port(mac_lookup_src_port),
		.mac_lookup_dst_mac(mac_lookup_dst_mac),
		.mac_lookup_hit(mac_lookup_hit),
		.mac_lookup_dst_port(mac_lookup_dst_port),

		.fifo_pop(fabric_pop),
		.fifo_fwd_en(fabric_fwd_en),
		.fifo_bus(fabric_bus),

		.tx_fifo_ready(tx_fifo_ready),
		.tx_fifo_bus(tx_fifo_bus)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// TODO

	//LA for testing
	ila_0 ila(
		.clk(clk_fabric),
		.probe0(fabric_pop[24]),
		.probe1(fabric_fwd_en[24]),
		.probe2(fabric_bus[24]),
		.probe3(tx_fifo_bus[24]),
		.probe4(tx_fifo_bus[1]),	//vlan 2 output
		.probe5(tx_fifo_bus[2]),	//vlan 3 output
		.probe6(mac_lookup_en),
		.probe7(mac_lookup_src_vlan),
		.probe8(mac_lookup_src_port),
		.probe9(mac_lookup_dst_mac),
		.probe10(mac_lookup_src_mac),
		.probe11(mac_lookup_hit),
		.probe12(mac_lookup_dst_port)
	);

endmodule
