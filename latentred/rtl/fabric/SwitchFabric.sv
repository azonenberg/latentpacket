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

/**
	@brief The actual switch fabric for LATENTRED

	The switch fabric internally runs at 64 bit width and is clocked at 156.25 MHz.
	This provides full 10 Gbps throughput per lane.

	TODO: output needs some filtering by vlan
 */
module SwitchFabric #(
	parameter NUM_1G_PORTS	= 24,
	parameter NUM_10G_PORTS	= 4,

	//Total number of 10G (64 bit * 156.25 MHz) ports on the internal fabric crossbar.
	//Up to six 1G, or one 10G, interfaces attach to each fabric port.
	localparam PORT_GROUP_SIZE = 6,
	localparam CROSSBAR_1G_PORTS = NUM_1G_PORTS / PORT_GROUP_SIZE,
	localparam CROSSBAR_PORTS = CROSSBAR_1G_PORTS + NUM_10G_PORTS,

	localparam TOTAL_PORTS = NUM_1G_PORTS + NUM_10G_PORTS
)(
	//Main fabric clock (156.25 MHz)
	input wire			clk,

	//Interface to the MAC address table
	output logic		mac_lookup_en		= 0,
	output vlan_t		mac_lookup_src_vlan	= 0,
	output macaddr_t	mac_lookup_src_mac	= 0,
	output port_t		mac_lookup_src_port	= 0,
	output macaddr_t	mac_lookup_dst_mac	= 0,
	input wire			mac_lookup_hit,
	input wire port_t	mac_lookup_dst_port,

	//Interface to the FIFOs.
	//First NUM_1G_PORTS are 1G, rest are 10G
	//All FIFOs have fabric_clk = clk so no need to hook that up here.
	output logic[TOTAL_PORTS-1:0]			fifo_pop	= 0,
	output logic[TOTAL_PORTS-1:0]			fifo_fwd_en	= 0,
	input wire RxFifoBus[TOTAL_PORTS-1:0]	fifo_bus

	//TODO: transmit side ports
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Helper for pretty-printing port names

	function string InterfaceName;
		input[4:0] portnum;

		if(portnum > NUM_1G_PORTS)
			return $sformatf("x0/%0d", portnum - NUM_1G_PORTS[4:0]);
		else
			return $sformatf("g%0d/%0d", (portnum / 5'd8) + 1'h1, portnum % 5'd8);
	endfunction

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Keep track of destinations for each port

	typedef struct packed
	{
		logic	dst_valid;
		logic	broadcast;
		port_t	dst_port;
	} portstate_t;

	portstate_t[TOTAL_PORTS-1:0] port_state	= 0;

	//Round robin address lookup for each port
	logic	mac_lookup_en_ff		= 0;
	logic	mac_lookup_en_ff2		= 0;
	port_t	mac_lookup_src_port_ff	= 0;
	port_t	mac_lookup_src_port_ff2	= 0;

	port_t	mac_port_id = 0;

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

			`ifdef SIMULATION
				$display("[%t] Frame ready to look up on interface %s",
					$realtime(), InterfaceName(mac_port_id));
			`endif

			mac_lookup_en		<= 1;
			mac_lookup_src_port	<= mac_port_id;
			mac_lookup_src_vlan	<= fifo_bus[mac_port_id].frame_vlan;
			mac_lookup_src_mac	<= fifo_bus[mac_port_id].frame_src_mac;
			mac_lookup_dst_mac	<= fifo_bus[mac_port_id].frame_dst_mac;
		end

		//When a lookup completes, save the reply
		if(mac_lookup_en_ff2) begin
			`ifdef SIMULATION
				$display("[%t] Frame ready to forward on interface %s",
					$realtime(), InterfaceName(mac_lookup_src_port_ff2));
			`endif
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
	//src_to_dest[dst][src] means src is sending to dst
	logic[TOTAL_PORTS-1:0]	src_to_dest[TOTAL_PORTS-1:0];

	always_comb begin
		for(integer src = 0; src < TOTAL_PORTS; src ++) begin
			for(integer dst = 0; dst < TOTAL_PORTS; dst ++) begin

				//No frame to forward? Skip it
				if(!port_state[src].dst_valid)
					src_to_dest[dst][src] = 0;

				//Broadcast? Forward everywhere (except the port it came from)
				else if(port_state[src].broadcast)
					src_to_dest[dst][src] = (src != dst);

				//Unicast? Forward wherever it wants to go
				else
					src_to_dest[dst][src] = (port_state[src].dst_port == dst);

			end
		end
	end

	//Sum a port plus an offset mod TOTAL_PORTS
	function port_t ModularOffset;
		input integer	port;
		input integer	offset;

		begin
			if( (port + offset) >= TOTAL_PORTS)
				ModularOffset = (port + offset) - TOTAL_PORTS;
			else
				ModularOffset = (port + offset);
		end

	endfunction

	//Channels within the crossbar switch
	typedef struct packed
	{
		logic					busy;				//true if we're in the middle of a forward operation
		logic					valid;				//true if data should be processed by the output port
		port_t					dest_port;			//ID of the output port
		port_t					src_port;			//ID of the input port
		vlan_t					vlan;				//vlan ID of the frame being forwarded
		logic[3:0]				bytes_valid;		//number of valid bytes in data (only used in last word of packet)
		logic[63:0]				data;				//data being forwarded
		logic[TOTAL_PORTS-1:0]	broadcast_done;		//indicates which ports still need to receive the current broadcast
		logic[2:0]				channel_offset;		//Offset of port within the 1G port group (ignored for 10G)
		port_t					rr_offset;			//Round robin offset for arbitration
	} CrossbarChannel;

	CrossbarChannel[CROSSBAR_PORTS-1:0] channels = 0;

	localparam INVALID_PORT = 5'd31;

	//Pick who gets to send to each destination
	integer hit;
	always_ff @(posedge clk) begin

		fifo_fwd_en		<= 0;

		for(integer chan = 0; chan < CROSSBAR_PORTS; chan ++) begin

			//Early out if nobody wants to send to us
			if(src_to_dest[chan] == 0) begin
				channels[chan].busy	<= 0;
			end

			//If the channel is busy, forward traffic
			else if(channels[chan].busy) begin
				channels[chan].valid		<= fifo_bus[channels[chan].src_port].fwd_valid;
				channels[chan].bytes_valid	<= fifo_bus[channels[chan].src_port].fwd_bytes_valid;
				channels[chan].data			<= fifo_bus[channels[chan].src_port].fwd_data;

				//If
			end

			//Not forwarding. Check if we should start forwarding something.
			else begin

				//1G port? This channel is being time-shared by multiple output ports.
				//Figure out the actual output port ID.
				if(chan < CROSSBAR_1G_PORTS)
					channels[chan].dest_port = chan * PORT_GROUP_SIZE + channels[chan].channel_offset;

				//10G port, easy peasy. Just use the channel ID, offset as needed.
				else
					channels[chan].dest_port = NUM_1G_PORTS + chan;

				//Check all input buffers and see if they want to send to us.
				hit = 0;
				for(integer i=0; i<TOTAL_PORTS; i=i+1) begin

					//If we already found something, stop
					if(hit) begin
					end

					//Check the next port
					else begin
						integer srcport = ModularOffset(i, channels[chan].rr_offset);
						if(src_to_dest[chan][srcport]) begin

							//We found something, don't look any further
							hit = 1;

							//Select the port
							channels[chan].busy			<= 1;
							channels[chan].src_port		<= srcport;
							channels[chan].vlan			<= fifo_bus[srcport].frame_vlan;

							//Bump round robin counter for next frame
							if( (channels[chan].rr_offset + 1) >= PORT_GROUP_SIZE)
								channels[chan].rr_offset	<= 0;
							else
								channels[chan].rr_offset	<= channels[chan].rr_offset + 1'h1;

							//Ask the source FIFO to forward the frame
							//TODO: Need to make sure the FIFO isn't already doing anything!!!
							fifo_fwd_en[srcport]			<= 1;

							`ifdef SIMULATION
								$display("[%t] Forwarding frame from interface %s (addr %02x:%02x:%02x:%02x:%02x:%02x) to %s (addr %02x:%02x:%02x:%02x:%02x:%02x) (via crossbar channel %d)",
									$realtime(),
									InterfaceName(srcport),
									fifo_bus[srcport].frame_src_mac[47:40], fifo_bus[srcport].frame_src_mac[39:32],
									fifo_bus[srcport].frame_src_mac[31:24], fifo_bus[srcport].frame_src_mac[23:16],
									fifo_bus[srcport].frame_src_mac[15:8], fifo_bus[srcport].frame_src_mac[7:0],
									InterfaceName(channels[chan].dest_port),
									fifo_bus[srcport].frame_dst_mac[47:40], fifo_bus[srcport].frame_dst_mac[39:32],
									fifo_bus[srcport].frame_dst_mac[31:24], fifo_bus[srcport].frame_dst_mac[23:16],
									fifo_bus[srcport].frame_dst_mac[15:8], fifo_bus[srcport].frame_dst_mac[7:0],
									chan[4:0]
								);
							`endif

						end
					end

				end

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
