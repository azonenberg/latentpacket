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
	@brief Forwarding logic

	Takes frames from packet buffer and puts them in exit queues
 */
module ForwardingEngine #(
	parameter NUM_PORTS						= 15,
	localparam PORT_BITS					= $clog2(NUM_PORTS)
)(

	//Main datapath clock
	input wire								clk_ram_ctl,

	//Interface to PacketBuffering
	input wire inportstate_t[NUM_PORTS-1:0]	fabric_state,
	output logic[NUM_PORTS-1:0]				forward_en = 0,
	input wire								frame_valid,
	input wire								frame_last,
	input wire[127:0]						frame_data,

	//Interface to exit queues
	input wire vlan_t[NUM_PORTS-1:0]		port_vlan,
	input wire[NUM_PORTS-1:0]				port_trunk,
	input wire[NUM_PORTS-1:0]				port_space_avail,

	output logic[NUM_PORTS-1:0]				frame_port_wr	= 0,
	output logic[10:0]						frame_len		= 0
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// MAC address table

	//TODO: move this to a CDC FIFO

	logic					mac_lookup_en		= 0;
	vlan_t					mac_lookup_src_vlan	= 0;
	macaddr_t				mac_lookup_src_mac	= 0;
	logic[PORT_BITS-1:0]	mac_lookup_src_port	= 0;
	macaddr_t				mac_lookup_dst_mac	= 0;

	logic					mac_lookup_en_ff		= 0;
	logic					mac_lookup_en_ff2		= 0;
	logic					mac_lookup_en_ff3		= 0;
	logic					mac_lookup_en_ff4		= 0;

	logic[PORT_BITS-1:0]	mac_lookup_src_port_ff	= 0;
	logic[PORT_BITS-1:0]	mac_lookup_src_port_ff2	= 0;
	logic[PORT_BITS-1:0]	mac_lookup_src_port_ff3	= 0;

	vlan_t					mac_lookup_src_vlan_ff	= 0;
	vlan_t					mac_lookup_src_vlan_ff2	= 0;
	vlan_t					mac_lookup_src_vlan_ff3	= 0;

	wire					mac_lookup_hit;
	wire[PORT_BITS-1:0]		mac_lookup_dst_port;

	MACAddressTable #(
		.TABLE_ROWS(2048),
		.ASSOC_WAYS(8),
		.PENDING_SIZE(8),
		.NUM_PORTS(NUM_PORTS)
	) mactable (
		.clk(clk_ram_ctl),

		.lookup_en(mac_lookup_en),
		.lookup_src_vlan(mac_lookup_src_vlan),
		.lookup_src_mac(mac_lookup_src_mac),
		.lookup_src_port(mac_lookup_src_port),
		.lookup_dst_mac(mac_lookup_dst_mac),

		.lookup_hit(mac_lookup_hit),
		.lookup_dst_port(mac_lookup_dst_port),

		//TODO: garbage collection
		.gc_en(1'b0),
		.gc_done(),

		//TODO: management interface
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
	// Control logic

	//Destination information for ports
	logic[PORT_BITS-1:0]	dst_port[NUM_PORTS-1:0];
	logic[NUM_PORTS-1:0]	broadcast		= 0;
	vlan_t					dst_vlan[NUM_PORTS-1:0];

	typedef enum logic[1:0]
	{
		PORT_STATE_IDLE,
		PORT_STATE_LOOKUP_PENDING,
		PORT_STATE_READY,
		PORT_STATE_FORWARDING
	} portstate_t;

	portstate_t[NUM_PORTS-1:0]	port_state;
	initial begin
		for(integer i=0; i<NUM_PORTS; i=i+1) begin
			port_state[i]	= PORT_STATE_IDLE;
			dst_port[i]		= 0;
			dst_vlan[i]		= 0;
		end
	end

	logic[PORT_BITS-1:0]	lookup_rr_port			= 0;
	logic[PORT_BITS-1:0]	fwd_rr_port				= 0;
	logic					forwarding				= 0;
	logic					start_forwarding_adv	= 0;
	logic					start_forwarding		= 0;

	(* DONT_TOUCH = "TRUE" *)
	logic[PORT_BITS-1:0]	fwd_source				= 0;

	//Pipelined match registers
	logic					fwd_broadcast			= 0;
	logic[NUM_PORTS-1:0]	port_vlan_match			= 0;
	logic[NUM_PORTS-1:0]	unicast_match			= 0;

	always_ff @(posedge clk_ram_ctl) begin

		//Clear single cycle flags
		mac_lookup_en		= 0;
		mac_lookup_src_vlan	<= 0;
		mac_lookup_src_mac	<= 0;
		mac_lookup_src_port	<= 0;
		mac_lookup_dst_mac	<= 0;

		//Pipeline the forwarding decision
		start_forwarding		<= start_forwarding_adv;
		if(start_forwarding)
			forwarding			= 1;

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Arbitration for lookups

		//First, check the RR port
		if((port_state[lookup_rr_port] == PORT_STATE_IDLE) && fabric_state[lookup_rr_port].ready) begin
			mac_lookup_en				= 1;
			mac_lookup_src_port			<= lookup_rr_port;
			mac_lookup_src_vlan			<= fabric_state[lookup_rr_port].src_vlan;
			mac_lookup_src_mac			<= fabric_state[lookup_rr_port].src_mac;
			mac_lookup_dst_mac			<= fabric_state[lookup_rr_port].dst_mac;
			lookup_rr_port				<= lookup_rr_port + 1;
			port_state[lookup_rr_port]	<= PORT_STATE_LOOKUP_PENDING;
		end

		//No, try ports in numerical order from highest to lowest (since 10G port is highest, it should get precedence)
		else begin

			for(integer i=NUM_PORTS-1; i>=0; i=i-1) begin

				if(!mac_lookup_en && (port_state[i] == PORT_STATE_IDLE) && fabric_state[i].ready) begin
					mac_lookup_en		= 1;
					mac_lookup_src_port	<= i;
					mac_lookup_src_vlan	<= fabric_state[i].src_vlan;
					mac_lookup_src_mac	<= fabric_state[i].src_mac;
					mac_lookup_dst_mac	<= fabric_state[i].dst_mac;
					lookup_rr_port		<= lookup_rr_port + 1;
					port_state[i]		<= PORT_STATE_LOOKUP_PENDING;
				end

			end

		end

		//Pipeline source info so when a lookup completes, we know where it came from
		//(This has to be after the arbitration)
		//TODO: put this as a FIFO instead
		mac_lookup_en_ff		<= mac_lookup_en;
		mac_lookup_en_ff2		<= mac_lookup_en_ff;
		mac_lookup_en_ff3		<= mac_lookup_en_ff2;
		mac_lookup_en_ff4		<= mac_lookup_en_ff3;

		mac_lookup_src_port_ff	<= mac_lookup_src_port;
		mac_lookup_src_port_ff2	<= mac_lookup_src_port_ff;
		mac_lookup_src_port_ff3	<= mac_lookup_src_port_ff2;

		mac_lookup_src_vlan_ff	<= mac_lookup_src_vlan;
		mac_lookup_src_vlan_ff2	<= mac_lookup_src_vlan_ff;
		mac_lookup_src_vlan_ff3	<= mac_lookup_src_vlan_ff2;

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// When a lookup completes, mark the port as ready to forward and save the dest port

		if(mac_lookup_en_ff4) begin
			port_state[mac_lookup_src_port_ff3]	<= PORT_STATE_READY;
			dst_port[mac_lookup_src_port_ff3]	<= mac_lookup_dst_port;
			broadcast[mac_lookup_src_port_ff3]	<= !mac_lookup_hit;
			dst_vlan[mac_lookup_src_port_ff3]	<= mac_lookup_src_vlan_ff3;
		end

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Decide when to actually forward stuff where

		//If the current frame is ending, we're no longer forwarding
		if(frame_last) begin
			forwarding				= 0;
			port_state[fwd_source]	<= PORT_STATE_IDLE;
		end

		if(start_forwarding_adv) begin

			//Match flag detection
			for(integer i=0; i<NUM_PORTS; i=i+1) begin
				port_vlan_match[i]	<= (port_vlan[i] == dst_vlan[fwd_source]);
				unicast_match[i]	<= (i == dst_port[fwd_source]);
			end
			fwd_broadcast			<= broadcast[fwd_source];

		end

		//Start forwarding after a pipeline delay
		if(start_forwarding) begin

			//We're sending from the source port
			fwd_rr_port					<= fwd_rr_port + 1;
			forward_en[fwd_source]		<= 1;
			port_state[fwd_source]		<= PORT_STATE_FORWARDING;
			frame_len					<= fabric_state[fwd_source].bytelen;

			//Decide where it goes
			for(integer i=0; i<NUM_PORTS; i=i+1) begin

				//Never send a frame out the port it came in
				if(i == fwd_source)
					frame_port_wr[i]		<= 0;

				//If broadcast: send to everything matching the target VLAN,
				//or to all trunk ports
				//TODO: exit filter for trunks that don't do all vlans
				else if(fwd_broadcast)
					frame_port_wr[i]		<= port_vlan_match[i] || port_trunk[i];

				//If unicast, send to the requested destination port
				else
					frame_port_wr[i]		<= unicast_match[i];

			end

		end

		start_forwarding_adv					= 0;

		//But should we start forwarding a new one?
		if( (!forwarding && !start_forwarding) || frame_last) begin

			//Check the RR winner first
			if(port_state[fwd_rr_port] == PORT_STATE_READY) begin

				//Forward if there's space in the destination FIFO, or broadcast and space in all FIFOs
				if(	(port_space_avail[dst_port[fwd_rr_port]] && !broadcast[fwd_rr_port] ) ||
					(&port_space_avail && broadcast[fwd_rr_port] ) ) begin

					fwd_source					<= fwd_rr_port;
					start_forwarding_adv		= 1;

				end

			end

			//Check all ports
			for(integer i=NUM_PORTS-1; i>=0; i=i-1) begin

				if(!start_forwarding_adv && (port_state[i] == PORT_STATE_READY) ) begin

					//Forward if there's space in the destination FIFO, or broadcast and space in all FIFOs
					if(	(port_space_avail[dst_port[i]] && !broadcast[i] ) ||
						(&port_space_avail && broadcast[i] ) ) begin

						fwd_source					<= i;
						start_forwarding_adv		= 1;

					end

				end

			end

		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Debug LA
	/*
	ila_1 ila(
		.clk(clk_ram_ctl),
		.probe0(mac_lookup_en),
		.probe1(mac_lookup_en_ff4),
		.probe2(mac_lookup_src_port),
		.probe3(start_forwarding),
		.probe4(fwd_source),
		.probe5(frame_valid),
		.probe6(frame_data),
		.probe7(frame_last),
		.probe8(mac_lookup_hit),
		.probe9(mac_lookup_dst_port)
	);
	*/

endmodule
