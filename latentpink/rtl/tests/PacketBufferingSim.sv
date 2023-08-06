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

module PacketBufferingSim();

	parameter NUM_PORTS = 15;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Simulated external oscillator

	logic	clk_125mhz_p = 1;
	logic	clk_125mhz_n = 0;

	always begin
		#4;
		clk_125mhz_p = !clk_125mhz_p;
		clk_125mhz_n = !clk_125mhz_n;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clock synthesis

	wire clk_125mhz;
	wire clk_250mhz;
	wire clk_312p5mhz;
	wire clk_400mhz;
	wire clk_625mhz_0;
	wire clk_625mhz_90;

	wire pll_sgmii_lock;

	wire clk_ram;
	wire clk_ram_ctl;
	wire clk_ram_90;

	wire pll_ram_lock;

	ClockGeneration clk_system(
		.clk_125mhz_p(clk_125mhz_p),
		.clk_125mhz_n(clk_125mhz_n),

		.clk_125mhz(clk_125mhz),
		.clk_250mhz(clk_250mhz),
		.clk_312p5mhz(clk_312p5mhz),
		.clk_400mhz(clk_400mhz),
		.clk_625mhz_0(clk_625mhz_0),
		.clk_625mhz_90(clk_625mhz_90),

		.pll_sgmii_lock(pll_sgmii_lock),

		.clk_ram(clk_ram),
		.clk_ram_ctl(clk_ram_ctl),
		.clk_ram_90(clk_ram_90),

		.pll_ram_lock(pll_ram_lock)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The RAM

	wire		qdr_k_p;
	wire		qdr_k_n;

	wire[20:0]	qdr_a;
	wire		qdr_rps_n;
	wire		qdr_wps_n;

	wire[3:0]	qdr_bws_n;

	wire[35:0]	qdr_d;

	wire		qdr_cq_p;
	wire		qdr_cq_n;
	wire		qdr_qvld;
	wire[35:0]	qdr_q;

	cyqdr2_b4 ram(

		//JTAG
		.TCK(1'b0),
		.TMS(1'b0),
		.TDI(1'b0),
		.TDO(),

		//Mode straps
		.ODT(1'b1),
		.DOFF(1'b1),

		//Impedance control resistor (ignored except for boundary scan)
		.ZQ(1'b0),

		//Command/address bus
		.K(qdr_k_p),
		.Kb(qdr_k_n),
		.A(qdr_a[17:0]),
		.RPSb(qdr_rps_n),
		.WPSb(qdr_wps_n),

		//Write data bus
		.BWS0b(qdr_bws_n[0]),
		.BWS1b(qdr_bws_n[1]),
		.BWS2b(qdr_bws_n[2]),
		.BWS3b(qdr_bws_n[3]),
		.D(qdr_d),

		//Read data bus
		.CQ(qdr_cq_p),
		.CQb(qdr_cq_n),

		.QVLD(qdr_qvld),
		.Q(qdr_q)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Packet generators

	wire[14:0]			port_rx_clk;
	logic[14:0]			port_link_up	= 0;

	EthernetRxBus[14:0]	port_rx_bus;
	logic[14:0]			port_next_packet	= 0;

	vlan_t[14:0]		port_vlan;
	wire[14:0]			tagged_allowed;
	wire[14:0]			untagged_allowed;

	for(genvar g=0; g<15; g=g+1) begin

		//all rx ports use the same clock for now
		assign port_rx_clk[g] = clk_125mhz_p;

		//allow tagged and untagged on all traffic
		assign tagged_allowed[g] = 1;
		assign untagged_allowed[g] = 1;

		//g3 has two packets tagged for vlan 5 and two untagged using the port native vlan (4)
		if(g == 3) begin
			PcapPacketGenerator #(
				.FILENAME("../../../../../../../testdata/2tagged-2untagged.pcapng")
			) gen (
				.clk(clk_125mhz_p),
				.next(port_next_packet[g]),
				.bus(port_rx_bus[g])
			);

			assign port_vlan[g] = 4;
		end

		//g4 has ten untagged 1024 byte (payload) pings using the port native vlan (6)
		else if(g == 4) begin
			PcapPacketGenerator #(
				.FILENAME("../../../../../../../testdata/big-pings.pcapng")
			) gen (
				.clk(clk_125mhz_p),
				.next(port_next_packet[g]),
				.bus(port_rx_bus[g])
			);

			assign port_vlan[g] = 6;
		end

		//all other ports get tied off, on vlan 1, and never send anything
		else begin
			assign port_rx_bus[g] = 0;
			assign port_vlan[g] = 1;
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// DUT

	`include "IngressPortState.svh"

	inportstate_t[14:0]	fabric_state;
	wire[14:0]			forward_en;
	wire				frame_last;
	wire				frame_valid;
	wire[127:0]			frame_data;
	wire[10:0]			frame_len;

	PacketBuffering dut(
		.port_rx_clk(port_rx_clk),
		.port_link_up(port_link_up),
		.port_rx_bus(port_rx_bus),

		.port_vlan(port_vlan),
		.tagged_allowed(tagged_allowed),
		.untagged_allowed(untagged_allowed),

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

		.mbist_select(1'b0),
		.mbist_start(1'b0),
		.mbist_seed(32'b0),
		.mbist_done(),
		.mbist_fail(),
		.mbist_fail_addr()
	);

	logic[NUM_PORTS-1:0]	port_trunk = 15'h4001;			//port g0 and xg0 are trunk ports
	wire[NUM_PORTS-1:0]		port_space_avail;
	wire[NUM_PORTS-1:0]		frame_port_wr;

	ForwardingEngine fwd(
		.clk_ram_ctl(clk_ram_ctl),

		.fabric_state(fabric_state),
		.forward_en(forward_en),
		.frame_valid(frame_valid),
		.frame_last(frame_last),
		.frame_data(frame_data),
		.frame_port_wr(frame_port_wr),
		.frame_len(frame_len),

		.port_vlan(port_vlan),
		.port_trunk(port_trunk),
		.port_space_avail(port_space_avail)
	);

	EgressFifo exit(
		.port_rx_clk(port_rx_clk),
		.port_link_up(port_link_up),

		.clk_ram_ctl(clk_ram_ctl),
		.frame_valid(frame_valid),
		.frame_last(frame_last),
		.frame_data(frame_data),
		.frame_len(frame_len),
		.frame_port_wr(frame_port_wr),
		.port_space_avail(port_space_avail),

		.port_tx_clk(port_rx_clk),
		.port_tx_ready(15'h7fff),
		.port_tx_bus()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test logic

	logic[7:0] state = 0;
	logic[15:0] count = 0;

	always_ff @(posedge clk_125mhz_p) begin

		port_next_packet	<= 0;

		case(state)

			//Bring up all links
			0: begin
				if(pll_ram_lock && pll_sgmii_lock) begin
					port_link_up	<= 15'h7fff;
					state			<= 1;
				end
			end

			1: begin
				count	<= count + 1;
				if(count == 'h5)
					state <= 2;
			end

			//Send a single tagged frame on vlan 5 to port g3
			2: begin
				port_next_packet[3]	<= 1;
				state				<= 3;
			end

			//Send a single untagged frame on vlan 6 to port g4
			3: begin
				port_next_packet[4]	<= 1;
				state				<= 4;
			end

			//As soon as the frame on g3 finishes sending, start another one
			4: begin
				if(port_rx_bus[3].commit) begin
					port_next_packet[3]	<= 1;
					state				<= 5;
				end
			end

		endcase

	end

endmodule
