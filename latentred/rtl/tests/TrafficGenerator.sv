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

module TrafficGenerator #(
	parameter PACKET_FNAME = "packet1.hex"
)(
	input wire		packet_gen_en,
	input wire		clk_fabric,

	input wire		clk_mac,

	output GmiiBus	gmii_rx_bus
);

	logic[7:0]		packet1[109:0];
	initial begin
		$readmemh(PACKET_FNAME, packet1);
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

endmodule
