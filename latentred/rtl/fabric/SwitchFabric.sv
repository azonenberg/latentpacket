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

/**
	@brief The actual switch fabric for LATENTRED

	The switch fabric internally runs at 64 bit width and is clocked at 156.25 MHz.
	This provides full 10 Gbps throughput per lane.

	Resource estimate for the core crossbar:
		28 input ports, 8 output ports
		(six 1G ports share one crossbar output, only one can forward at a time)

		A 28:1 mux needs:
			First level: 7x 4:1 = 7 LUTs
			Second level: 1x 7:1 = 2 LUTs
			Third level: 1x F7MUX
			Total = 9 LUTs

		Each channel is 81 bits wide (64x data + 12x VLAN tag + 5x dest port number)

		Each output port thus needs 729 LUT6s, for total fabric mux usage of 5832.
 */
module SwitchFabric #(
	parameter NUM_1G_PORTS	= 24,
	parameter NUM_10G_PORTS	= 4,

	//Total number of 10G (64 bit * 156.25 MHz) ports on the internal fabric crossbar.
	//Up to six 1G, or one 10G, interfaces attach to each fabric port.
	localparam CROSSBAR_1G_PORTS = NUM_1G_PORTS / 6,
	localparam CROSSBAR_PORTS = CROSSBAR_1G_PORTS + NUM_10G_PORTS,

	localparam TOTAL_PORTS = NUM_1G_PORTS + NUM_10G_PORTS
)(
	//Main fabric clock (156.25 MHz)
	input wire			clk,

	//Interface to the MAC address table
	output logic		mac_lookup_en		= 0,
	output logic[11:0]	mac_lookup_src_vlan	= 0,
	output logic[47:0]	mac_lookup_src_mac	= 0,
	output logic[4:0]	mac_lookup_src_port	= 0,
	output logic[47:0]	mac_lookup_dst_mac	= 0,
	input wire			mac_lookup_hit,
	input wire[4:0]		mac_lookup_dst_port,

	//Interface to the FIFOs.
	//First NUM_1G_PORTS are 1G, rest are 10G
	//All FIFOs have fabric_clk = clk so no need to hook that up here.
	output logic[TOTAL_PORTS-1:0]			fifo_pop	= 0,
	output logic[TOTAL_PORTS-1:0]			fifo_fwd_en	= 0,
	input wire RxFifoBus[TOTAL_PORTS-1:0]	fifo_bus

	//TODO: transmit side ports
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Keep track of destinations for each port

	logic[4:0]	mac_port_id;

	typedef struct packed
	{
		logic		dst_valid;
		logic		broadcast;
		logic[4:0]	dst_port;
	} portstate_t;

	portstate_t[TOTAL_PORTS-1:0] port_state	= 0;

	//Round robin address lookup for each port
	logic		mac_lookup_en_ff		= 0;
	logic		mac_lookup_en_ff2		= 0;
	logic[4:0]	mac_lookup_src_port_ff	= 0;
	logic[4:0]	mac_lookup_src_port_ff2	= 0;
	always_ff @(posedge clk) begin

		//Clear flags
		mac_lookup_en		<= 0;

		//Keep track of where we looked up recently, so we know what results are for
		mac_lookup_en_ff		<= mac_lookup_en;
		mac_lookup_en_ff2		<= mac_lookup_en_ff;
		mac_lookup_src_port_ff	<= mac_lookup_src_port;
		mac_lookup_src_port_ff2	<= mac_lookup_src_port_ff;

		//Round robin every cycle
		mac_port_id			<= mac_port_id + 1;
		if(mac_port_id == TOTAL_PORTS - 1)
			mac_port_id		<= 0;

		//If there is a packet waiting to be forwarded, and we don't know where it goes, start the lookup.
		if(fifo_bus[mac_port_id].frame_valid && !fifo_pop[mac_port_id] && !port_state[mac_port_id].dst_valid) begin
			mac_lookup_en		<= 1;
			mac_lookup_src_port	<= mac_port_id;
			mac_lookup_src_vlan	<= fifo_bus[mac_port_id].frame_vlan;
			mac_lookup_src_mac	<= fifo_bus[mac_port_id].frame_src_mac;
			mac_lookup_dst_mac	<= fifo_bus[mac_port_id].frame_dst_mac;
		end

		//When a lookup completes, save the reply
		if(mac_lookup_en_ff2) begin
			port_state[mac_lookup_src_port_ff2].dst_valid	<= 1;
			port_state[mac_lookup_src_port_ff2].broadcast	<= !mac_lookup_hit;	//anything not in table is broadcast
			port_state[mac_lookup_src_port_ff2].dst_port	<= mac_lookup_dst_port;
		end

		//When we finish forwarding a packet, clear the state
		for(integer i=0; i<TOTAL_PORTS; i++) begin
			if(fifo_pop[i])
				port_state[i].dst_valid	<= 0;
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Link selection

	//Bitmap of which source wants to send to which destination
	logic[TOTAL_PORTS-1:0]	src_to_dest[TOTAL_PORTS-1:0];

	always_comb begin
		for(integer src = 0; src < TOTAL_PORTS; src ++) begin
			for(integer dst = 0; dst < TOTAL_PORTS; dst ++)
				src_to_dst[src][dst] = (port_state[src].dst_port == dst) || port_state[src].broadcast;
		end
	end

	//Channels within the crossbar switch
	typedef struct packed
	{
		logic					busy;				//true if we're in the middle of a forward operation
		logic					valid;				//true if data should be processed by the output port
		logic[4:0]				dest_port;			//ID of the output port
		logic[11:0]				vlan;				//dest vlan ID
		logic[3:0]				bytes_valid;		//number of valid bytes in data (only used in last word of packet)
		logic[63:0]				data;				//data being forwarded
		logic[2:0]				rr_source_lane;		//round robin offset for the source port (0-5? FIXME)
		logic[TOTAL_PORTS_1:0]	broadcast_pending;	//indicates which ports still need to receive the current broadcast
	} CrossbarChannel;

	CrossbarChannel[CROSSBAR_PORTS-1:0] channels = 0;

	localparam INVALID_PORT = 5'd31;

	//Pick who gets to send to each destination
	always_ff @(posedge clk) begin

		for(integer dport = 0; dport < CROSSBAR_PORTS; dport ++) begin

			//Early out if nobody wants to send to use
			if(src_to_dest[dport] == 0) begin
				channels[dport].busy		<= 0;
				channels[dport].dest_port	<= INVALID_PORT;
			end

			//1G ports
			else if(dport < CROSSBAR_1G_PORTS) begin

				//This channel

			end

			//10G ports
			else begin

			end

		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual forwarding crossbar

	always_ff @(posedge clk) begin

		for(integer dport = 0; dport < CROSSBAR_PORTS; dport ++) begin

			//1G ports
			if(dport < CROSSBAR_1G_PORTS) begin
				//
			end

			//10G ports
			else begin

			end

		end

	end

endmodule
