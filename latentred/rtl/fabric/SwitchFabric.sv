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
`include "TxFifoBus.svh"
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

	//Interface to the input FIFOs.
	//First NUM_1G_PORTS are 1G, rest are 10G
	//All FIFOs have fabric_clk = clk so no need to hook that up here.
	output logic[TOTAL_PORTS-1:0]			fifo_pop	= 0,
	output logic[TOTAL_PORTS-1:0]			fifo_fwd_en	= 0,
	input wire RxFifoBus[TOTAL_PORTS-1:0]	fifo_bus,

	//Interface to the output FIFOs
	//NOTE: no vlan filtering is applied here
	input wire[TOTAL_PORTS-1:0]				tx_fifo_ready,
	output TxFifoBus[TOTAL_PORTS-1:0]		tx_fifo_bus
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Helper for pretty-printing port names

	function string InterfaceName;
		input[4:0] portnum;

		if(portnum >= NUM_1G_PORTS)
			return $sformatf("x0/%0d", portnum - NUM_1G_PORTS[4:0] + 1'd1);
		else
			return $sformatf("g%0d/%0d", (portnum / 5'd8) + 1'h1, portnum % 5'd8 + 1'd1);
	endfunction

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Keep track of destinations for each port

	typedef struct packed
	{
		logic					dst_valid;
		logic					broadcast;
		logic[TOTAL_PORTS-1:0]	broadcast_done;		//indicates which ports still need to receive the current broadcast
		port_t					dst_port;
		logic					forwarding;
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
	// Link selection and forwarding

	//Bitmap of which source wants to send to which destination
	//src_to_dest[dst][src] means src is sending to dst
	logic[TOTAL_PORTS-1:0]	src_to_dest[TOTAL_PORTS-1:0];

	always_comb begin
		for(integer src = 0; src < TOTAL_PORTS; src ++) begin
			for(integer dst = 0; dst < TOTAL_PORTS; dst ++) begin

				//No frame to forward? Skip it
				if(!port_state[src].dst_valid)
					src_to_dest[dst][src] = 0;

				//Source being popped? Ignore the stale frame
				else if(fifo_pop[src])
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
		ethertype_t				ethertype;
		logic[3:0]				bytes_valid;		//number of valid bytes in data (only used in last word of packet)
		logic[63:0]				data;				//data being forwarded
		logic[2:0]				rr_1g_dest;			//Offset of port within the 1G port group (ignored for 10G)
		port_t					rr_source;			//Round robin offset for arbitration
	} CrossbarChannel;

	CrossbarChannel[CROSSBAR_PORTS-1:0] channels = 0;

	logic[TOTAL_PORTS-1:0]				fifo_fwd_en_ff	= 0;

	localparam INVALID_PORT = 5'd31;

	always_ff @(posedge clk) begin

		fifo_fwd_en		<= 0;
		fifo_pop		<= 0;

		fifo_fwd_en_ff	<= fifo_fwd_en;

		//Clear broadcast state when we finish forwarding a frame.
		for(integer i=0; i < TOTAL_PORTS; i++) begin
			if(fifo_pop[i])
				port_state[i].broadcast_done 	<= 0;
		end

		//Pop FIFO when all broadcasts have completed
		for(integer i=0; i < TOTAL_PORTS; i++) begin

			//Always set the done bit for traffic from ourself (we never send to the source interface)
			port_state[i].broadcast_done[i]		<= 1;

			//Valid broadcast frame not already being popped?
			if(port_state[i].broadcast && port_state[i].dst_valid && !fifo_pop[i]) begin

				//Pop if all broadcasting is done
				if(port_state[i].broadcast_done == {TOTAL_PORTS{1'b1}}) begin
					fifo_pop[i]	<= 1;

					`ifdef SIMULATION
						$display("[%t] Popping ingress FIFO on interface %s because broadcast forwarding is complete",
							$realtime(),
							InterfaceName(i)
							);
					`endif
				end

			end

		end

		for(integer chan = 0; chan < CROSSBAR_PORTS; chan ++) begin

			//If the channel is busy, forward traffic
			if(channels[chan].busy) begin

				//Cache the source port to make everything less verbose
				automatic integer src = channels[chan].src_port;

				//Forward traffic (this is the actual crossbar mux)
				channels[chan].valid		<= fifo_bus[src].fwd_valid;
				channels[chan].bytes_valid	<= fifo_bus[src].fwd_bytes_valid;
				channels[chan].data			<= fifo_bus[src].fwd_data;

				//When the channel finishes forwarding, we have a bunch of stuff to do.
				if(!fifo_bus[src].fwd_valid && !fifo_fwd_en[src] && !fifo_fwd_en_ff[src]) begin

					//Mark the source port as no longer busy, so somebody else can forward from it if they want.
					port_state[src].forwarding	<= 0;

					//If the frame is a broadcast, mark our destination as having received it.
					//TODO: optimization, allow sending to multiple 1G ports at once
					//TODO: optimization, don't waste time sending to ports in other vlans who will just ignore it
					port_state[src].broadcast_done[channels[chan].dest_port] <= 1;

					//If the frame is a unicast, pop the FIFO. Broadcast/multicast popping is handled separately.
					if(!port_state[src].broadcast)
						fifo_pop[src]	<= 1;

					//This crossbar channel is now free for further traffic
					channels[chan].busy	<= 0;

					//Bump the round-robin destination counter for 1G ports
					//so that we can forward to the next destination
					if(chan < CROSSBAR_1G_PORTS) begin
						channels[chan].rr_1g_dest	<= channels[chan].rr_1g_dest + 1'h1;

						if( (channels[chan].rr_1g_dest + 1) >= PORT_GROUP_SIZE)
							channels[chan].rr_1g_dest <= 0;
					end

					//Bump round-robin source channel counter for next frame
					if( (channels[chan].rr_source + 1) >= TOTAL_PORTS)
						channels[chan].rr_source	<= 0;
					else
						channels[chan].rr_source	<= channels[chan].rr_source + 1'h1;

				end

			end

			//Not forwarding. Check if we should start forwarding something.
			else begin
				automatic integer hit = 0;

				//1G port? This channel is being time-shared by multiple output ports.
				//Figure out the actual output port ID.
				if(chan < CROSSBAR_1G_PORTS)
					channels[chan].dest_port = chan * PORT_GROUP_SIZE + channels[chan].rr_1g_dest;

				//10G port, easy peasy. Just use the channel ID, offset as needed.
				else
					channels[chan].dest_port = NUM_1G_PORTS + chan - CROSSBAR_1G_PORTS;

				//Check all input buffers and see if they want to send to us.
				for(integer i=0; i<TOTAL_PORTS; i=i+1) begin

					automatic integer srcport = ModularOffset(i, channels[chan].rr_source);

					//If we already found something, stop
					if(hit) begin
					end

					//If the destination port doesn't have space in the exit queue, don't waste time looking
					else if(!tx_fifo_ready[channels[chan].dest_port]) begin
					end

					//If the source port is already forwarding somewhere else, don't bother checking any further.
					//We came too late. Need to wait until that forwarding operation completes, then we might get
					//a crack at the frame (which must be a broadcast/multicast if it's going to us too)
					else if(port_state[srcport].forwarding) begin
					end

					//If the source port broadcasted to us already, don't forward the same frame again
					else if(port_state[srcport].broadcast &&
						port_state[srcport].broadcast_done[channels[chan].dest_port]) begin
					end

					//Source is eligible to send to use. See if it wants to.
					else if(src_to_dest[channels[chan].dest_port][srcport]) begin

						//We found something, don't look any further
						hit = 1;

						//Select the port
						channels[chan].busy			<= 1;
						channels[chan].src_port		<= srcport;
						channels[chan].vlan			<= fifo_bus[srcport].frame_vlan;
						channels[chan].ethertype	<= fifo_bus[srcport].ethertype;

						//Ask the source FIFO to forward the frame.
						//Mark the source port as busy so nobody else tries to use it next cycle.
						//(multiple channels forwarding from the same source *on the same cycle* is totally fine)
						fifo_fwd_en[srcport]			<= 1;
						port_state[srcport].forwarding	<= 1;

						`ifdef SIMULATION
							$display("[%t] Forwarding frame from interface %s (addr %02x:%02x:%02x:%02x:%02x:%02x) to %s (addr %02x:%02x:%02x:%02x:%02x:%02x) (via crossbar channel %0d)",
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

				//If we didn't hit anything, move on to the next port in the group
				if(!hit && chan < CROSSBAR_1G_PORTS && !port_state[channels[chan].src_port].forwarding) begin
					channels[chan].rr_1g_dest	<= channels[chan].rr_1g_dest + 1'h1;

					if( (channels[chan].rr_1g_dest + 1) >= PORT_GROUP_SIZE)
						channels[chan].rr_1g_dest <= 0;

				end

			end

		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Outputs to TX FIFOs

	always_ff @(posedge clk) begin
		tx_fifo_bus	<= 0;

		for(integer chan=0; chan<CROSSBAR_PORTS; chan++) begin

			if(channels[chan].busy) begin
				tx_fifo_bus[channels[chan].dest_port].valid			<= channels[chan].valid;
				tx_fifo_bus[channels[chan].dest_port].bytes_valid	<= channels[chan].bytes_valid;
				tx_fifo_bus[channels[chan].dest_port].data			<= channels[chan].data;
				tx_fifo_bus[channels[chan].dest_port].ethertype		<= channels[chan].ethertype;
				tx_fifo_bus[channels[chan].dest_port].vlan			<= channels[chan].vlan;
			end

		end
	end

endmodule
