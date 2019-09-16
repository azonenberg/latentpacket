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
	);

	wire	clk_125mhz;

	IBUFGDS clk_125mhz_ibuf(
		.I(clk125mhz_p),
		.IB(clk125mhz_n),
		.O(clk_125mhz)
		);

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

	/*
	//Reset the quad
	logic		gty_reset		= 0;
	logic[7:0]	rst_count = 1;
	always_ff @(posedge clk_125mhz) begin
		rst_count <= rst_count + 1;
		if(rst_count == 128)
			gty_reset	<= 1;
		if(rst_count == 0)
			gty_reset	<= 0;
	end*/

	wire	gty_reset;

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
	// Debug VIO

	vio_0 vio(
		.clk(clk_125mhz),
		.probe_in0(pwrgood),
		.probe_in1(rx_pmaresetdone),
		.probe_in2(rx_divresetdone),
		.probe_in3(tx_pmaresetdone),
		.probe_in4(tx_divresetdone),
		.probe_out0(gty_reset)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The PCSes

	wire[3:0]	link_up;

	for(genvar g=0; g<4; g++) begin
		wire	block_sync_good;
		wire	remote_fault;

		assign tx_header[g][5:2] = 4'h0;

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

			.xgmii_rx_clk(),
			.xgmii_rxc(),
			.xgmii_rxd(),

			.xgmii_tx_clk(),
			.xgmii_txc(4'hf),
			.xgmii_txd(32'h07070707),

			.block_sync_good(block_sync_good),
			.link_up(link_up[g]),
			.remote_fault(remote_fault)
		);

		if(g == 0) begin
			vio_1(
				.clk(rx_usrclk[g]),
				.probe_in0(block_sync_good),
				.probe_in1(link_up[g]),
				.probe_in2(remote_fault),
				.probe_in3(rx_valid[g][0])
			);
		end

	end

endmodule
