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

`include "EthernetBus.svh"

module RxFifo_sim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clocking

	logic ready = 0;
	initial begin
		$timeformat(-9, 3, " ns", 6);
		#100;
		ready = 1;
	end

	//156.25 MHz
	logic clk_fabric = 0;
	always begin
		#3.2;
		clk_fabric = ready;
		#3.2;
		clk_fabric = 0;
	end

	//125 MHz
	logic clk_mac = 0;
	always begin
		#4;
		clk_mac = ready;
		#4;
		clk_mac = 0;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Ethernet MAC etc

	GmiiBus			gmii_rx_bus;
	EthernetRxBus	rx_bus;

	TriSpeedEthernetMAC #(
		.RX_CRC_DISABLE(1)		//wireshark captured packets lack crc
	) mac (
		.gmii_rx_clk(clk_mac),
		.gmii_rx_bus(gmii_rx_bus),
		.gmii_tx_clk(clk_mac),
		.gmii_tx_bus(),

		.link_up(1),
		.link_speed(LINK_SPEED_1000M),

		.rx_bus(rx_bus),
		.tx_bus({$bits(EthernetTxBus){1'b0}}),

		.tx_ready(),
		.perf()
	);

	EthernetRxL2Bus rx_l2_bus;

	Ethernet2TypeDecoder decoder(
		.rx_clk(clk_mac),
		.mac_rx_bus(rx_bus),
		.our_mac_address(48'h0),
		.promisc_mode(1),
		.rx_l2_bus(rx_l2_bus),
		.perf()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Traffic generator

	logic[7:0]		packet1[109:0];
	initial begin
		$readmemh("packet1.hex", packet1);
	end

	logic			packet_gen_en_fabric	= 0;
	wire			packet_gen_en;

	PulseSynchronizer sync_packet_gen(
		.clk_a(clk_fabric),
		.pulse_a(packet_gen_en_fabric),

		.clk_b(clk_mac),
		.pulse_b(packet_gen_en)
	);

	logic[6:0]	packet_addr	= 0;

	enum logic[2:0]
	{
		GEN_STATE_IDLE		= 0,
		GEN_STATE_PREAMBLE	= 1,
		GEN_STATE_FRAME		= 2,
		GEN_STATE_CRC		= 3
	} gen_state = GEN_STATE_IDLE;

	logic[3:0] gen_count = 0;

	always_ff @(posedge clk_mac) begin

		//Default state for a gigabit link between packets
		gmii_rx_bus.dvalid	<= 1;
		gmii_rx_bus.er		<= 0;
		gmii_rx_bus.en		<= 0;
		gmii_rx_bus.data	<= 0;

		case(gen_state)

			//Start sending a packet
			GEN_STATE_IDLE: begin

				if(packet_gen_en) begin
					packet_addr			<= 1;
					gmii_rx_bus.en		<= 1;
					gmii_rx_bus.data	<= 8'h55;
					gen_count			<= 0;
					gen_state			<= GEN_STATE_PREAMBLE;
				end

			end	//end GEN_STATE_IDLE

			//Send the preamble
			GEN_STATE_PREAMBLE: begin
				gmii_rx_bus.en			<= 1;
				gmii_rx_bus.data		<= 8'h55;
				gen_count				<= gen_count + 1;

				if(gen_count == 7) begin
					gmii_rx_bus.data	<= 8'hd5;
					packet_addr			<= 0;
					gen_state			<= GEN_STATE_FRAME;
				end
			end	//end GEN_STATE_PREAMBLE

			//Continue sending the packet
			GEN_STATE_FRAME: begin
				packet_addr			<= packet_addr + 1'h1;
				gmii_rx_bus.en		<= 1;
				gmii_rx_bus.data	<= packet1[packet_addr];

				if(packet_addr >= 7'd109) begin
					gen_count		<= 0;
					gen_state		<= GEN_STATE_CRC;
				end
			end	//end GEN_STATE_FRAME

			//Send a dummy CRC (mac doesn't actually verify it)
			GEN_STATE_CRC: begin
				gmii_rx_bus.en			<= 1;
				gmii_rx_bus.data		<= 8'h00;
				gen_count				<= gen_count + 1;

				if(gen_count == 3) begin
					packet_addr			<= 0;
					gen_state			<= GEN_STATE_IDLE;
				end
			end	//end GEN_STATE_CRC

		endcase

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual DUT

	logic	fabric_fwd_en	= 0;
	logic	fabric_pop		= 0;

	wire	fabric_frame_valid;

	`include "RxFifoBus.svh"
	RxFifoBus fabric_bus;

	RxFifo dut(
		.mac_clk(clk_mac),
		.mac_rx_bus(rx_l2_bus),

		.link_state(1'b1),

		.has_port_vlan(1'b1),
		.port_vlan_id(12'd5),
		.native_vlan_allowed(1'b0),

		.mac_queued(),
		.mac_drop_fifo(),
		.mac_drop_vlan(),
		.mac_drop_runt(),
		.mac_drop_jumbo(),

		.fabric_clk(clk_fabric),
		.fabric_fwd_en(fabric_fwd_en),
		.fabric_pop(fabric_pop),
		.fabric_bus(fabric_bus)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test state machine

	logic[7:0] state = 0;

	always_ff @(posedge clk_fabric) begin
		packet_gen_en_fabric	<= 0;

		fabric_fwd_en			<= 0;
		fabric_pop				<= 0;

		case(state)

			//Trigger the traffic generator
			0: begin
				packet_gen_en_fabric	<= 1;
				state					<= 1;
			end

			//Wait for the frame to be fully buffered, then push it out to fabric
			1: begin
				if(fabric_bus.frame_valid) begin
					fabric_fwd_en	<= 1;
					state			<= 2;
				end
			end

			//Frame is done, delete it
			2: begin
				fabric_pop			<= 1;
				state				<= 3;
			end

		endcase

	end

endmodule
