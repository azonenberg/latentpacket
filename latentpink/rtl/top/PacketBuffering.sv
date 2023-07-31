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
`include "IngressPortState.svh"

/**
	@file
	@author Andrew D. Zonenberg
	@brief Packet buffer
 */
module PacketBuffering #(
	parameter NUM_PORTS						= 15
)(

	//Inbound data from network ports
	input wire[NUM_PORTS-1:0]				port_rx_clk,
	input wire[NUM_PORTS-1:0]				port_link_up,
	input wire EthernetRxBus[NUM_PORTS-1:0]	port_rx_bus,

	//Port configuration (rx_clk domain)
	input wire vlan_t[NUM_PORTS-1:0]		port_vlan,
	input wire[NUM_PORTS-1:0]				tagged_allowed,
	input wire[NUM_PORTS-1:0]				untagged_allowed,

	//Controller clock (1/2 RAM clock, 1/4 bit rate).
	//All control/data signals on the FPGA side are synchronous to this clock.
	input wire								clk_ram_ctl,

	//RAM clock (1/2 bit rate, 2x clk_ctl rate)
	//All RAM signals are synchronous to this clock.
	input wire								clk_ram,
	input wire								clk_ram_90,

	//Interface to the RAM itself
	output wire[35:0]						qdr_d,
	input wire[35:0]						qdr_q,
	output wire[20:0]						qdr_a,
	output wire								qdr_wps_n,
	output wire[3:0]						qdr_bws_n,
	output wire								qdr_rps_n,
	input wire								qdr_qvld,
	output wire								qdr_k_p,
	output wire								qdr_k_n,
	input wire								qdr_cq_p,
	input wire								qdr_cq_n,

	//Outbound bus to rest of switch fabric
	output inportstate_t[NUM_PORTS-1:0]		fabric_state,
	input wire[NUM_PORTS-1:0]				forward_en,
	output wire								frame_valid,
	output wire								frame_last,
	output wire[127:0]						frame_data,

	//MBIST controls
	input wire								mbist_select,
	input wire								mbist_start,
	input wire[31:0]						mbist_seed,
	output wire								mbist_done,
	output wire								mbist_fail,
	output wire[17:0]						mbist_fail_addr
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// QDR-II+ controller

	//Tie off unused address pins since we've only got a 36 Mbit SRAM stuffed
	assign qdr_a[20:18] = 2'b0;

	wire			ram_rd_en;
	wire[17:0]		ram_rd_addr;
	wire			ram_rd_valid;

	wire[143:0]		ram_rd_data;
	wire			ram_wr_en;
	wire[17:0]		ram_wr_addr;
	wire[143:0]		ram_wr_data;

	wire			qdr_pll_lock;

	QDR2PController #(
		.RAM_WIDTH(36),
		.ADDR_BITS(18)
	) qdr (
		.clk_ctl(clk_ram_ctl),
		.clk_ram(clk_ram),
		.clk_ram_90(clk_ram_90),

		.rd_en(ram_rd_en),
		.rd_addr(ram_rd_addr),
		.rd_valid(ram_rd_valid),
		.rd_data(ram_rd_data),
		.wr_en(ram_wr_en),
		.wr_addr(ram_wr_addr),
		.wr_data(ram_wr_data),
		.pll_lock(qdr_pll_lock),

		.qdr_d(qdr_d),
		.qdr_q(qdr_q),
		.qdr_a(qdr_a[17:0]),
		.qdr_wps_n(qdr_wps_n),
		.qdr_bws_n(qdr_bws_n),
		.qdr_rps_n(qdr_rps_n),
		.qdr_qvld(qdr_qvld),
		.qdr_dclk_p(qdr_k_p),
		.qdr_dclk_n(qdr_k_n),
		.qdr_qclk_p(qdr_cq_p),
		.qdr_qclk_n(qdr_cq_n)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// BIST muxing

	wire		ram_wr_en_fifo;
	wire[17:0]	ram_wr_addr_fifo;
	wire[143:0]	ram_wr_data_fifo;
	wire		ram_rd_en_fifo;
	wire[17:0]	ram_rd_addr_fifo;

	wire		ram_wr_en_bist;
	wire[17:0]	ram_wr_addr_bist;
	wire[143:0]	ram_wr_data_bist;
	wire		ram_rd_en_bist;
	wire[17:0]	ram_rd_addr_bist;

	wire		mbist_select_ff;
	wire		mbist_start_ff;

	BISTMuxes bistmux(
		.clk_ram_ctl(clk_ram_ctl),

		.mbist_select(mbist_select),
		.mbist_start(mbist_start),

		.mbist_select_ff(mbist_select_ff),
		.mbist_start_ff(mbist_start_ff),

		.ram_wr_en_fifo(ram_wr_en_fifo),
		.ram_wr_addr_fifo(ram_wr_addr_fifo),
		.ram_wr_data_fifo(ram_wr_data_fifo),
		.ram_rd_en_fifo(ram_rd_en_fifo),
		.ram_rd_addr_fifo(ram_rd_addr_fifo),

		.ram_wr_en_bist(ram_wr_en_bist),
		.ram_wr_addr_bist(ram_wr_addr_bist),
		.ram_wr_data_bist(ram_wr_data_bist),
		.ram_rd_en_bist(ram_rd_en_bist),
		.ram_rd_addr_bist(ram_rd_addr_bist),

		.ram_wr_en(ram_wr_en),
		.ram_wr_addr(ram_wr_addr),
		.ram_wr_data(ram_wr_data),
		.ram_rd_en(ram_rd_en),
		.ram_rd_addr(ram_rd_addr)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// FIFO logic

	IngressFifo #(
		.NUM_PORTS(NUM_PORTS)
	) infifo (
		.port_rx_clk(port_rx_clk),
		.port_link_up(port_link_up),
		.port_rx_bus(port_rx_bus),

		.port_vlan(port_vlan),
		.tagged_allowed(tagged_allowed),
		.untagged_allowed(untagged_allowed),

		.clk_ram_ctl(clk_ram_ctl),
		.ram_wr_en(ram_wr_en_fifo),
		.ram_wr_addr(ram_wr_addr_fifo),
		.ram_wr_data(ram_wr_data_fifo),
		.ram_rd_en(ram_rd_en_fifo),
		.ram_rd_addr(ram_rd_addr_fifo),
		.ram_rd_valid(ram_rd_valid && !mbist_select_ff),
		.ram_rd_data(ram_rd_data),

		.fabric_state(fabric_state),
		.forward_en(forward_en),
		.frame_valid(frame_valid),
		.frame_last(frame_last),
		.frame_data(frame_data)
	);


	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Memory tester

	QDRMemoryBIST bist(
		.clk(clk_ram_ctl),

		.ram_rd_en(ram_rd_en_bist),
		.ram_rd_addr(ram_rd_addr_bist),
		.ram_rd_valid(ram_rd_valid && mbist_select_ff),
		.ram_rd_data(ram_rd_data),
		.ram_wr_en(ram_wr_en_bist),
		.ram_wr_addr(ram_wr_addr_bist),
		.ram_wr_data(ram_wr_data_bist),

		.start(mbist_start_ff),
		.seed(mbist_seed),
		.done(mbist_done),
		.fail(mbist_fail),
		.fail_addr(mbist_fail_addr)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Debug LA

	ila_0 ila(
		.clk(clk_ram_ctl),
		.probe0(infifo.prefetch_target[0]),
		.probe1(ram_wr_en),
		.probe2(ram_wr_addr),
		.probe3(infifo.fec_wr_en),
		.probe4(infifo.fec_wr_data),
		.probe5(ram_rd_en),
		.probe6(ram_rd_addr),
		.probe7(ram_rd_valid),
		.probe8(infifo.fec_rd_valid),
		.probe9(infifo.fec_rd_data),
		.probe10(infifo.fec_correctable_err),
		.probe11(infifo.fec_uncorrectable_err),
		.probe12(infifo.portstates[0]),
		.probe13(infifo.prefetch_count[0]),
		.probe14(infifo.prefetch_rcount[0]),
		.probe15(infifo.prefetch_wordlen[0])
	);

endmodule
