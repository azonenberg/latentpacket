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

/**
	@brief RX FIFO for 1000base-T ports

	Needs to be multiple of 2x 18Kb BRAMs since 64+ bits wide
 */
module GigabitRxFifo #(
	parameter FIFO_LINES		= 2048,				//need 375 lines for a 1500 byte frame
													//2K lines = 5.46 max sized frames or 32 min sized frames
	parameter META_FIFO_LINES	= 32				//enough to hold metadata for FIFO_LINES worth of min sized frames
) (
	//Incoming frame bus
	input wire					mac_clk,			//Incoming frame clock
	input wire EthernetRxL2Bus	mac_rx_bus,			//Incoming frame data
	input wire					mac_port_vlan_en,	//True if the port is configured in "port vlan" mode
	input wire[11:0]			mac_port_vlan_id,	//VLAN ID for port based VLANs

	//Performance counters
	output logic				mac_drop	= 0,	//Goes high for one cycle if an incoming frame is lost
													//due to insufficient buffer space
	output logic				mac_queued	= 0,	//Goes high for one cycle when an incoming frame is accepted

	//Outbound bus to fabric
	input wire					fabric_clk,						//Main switch clock
	output logic				fabric_frame_valid		= 0,	//When high, there is a frame ready to forward
	output logic[47:0]			fabric_frame_dst_mac	= 0,	//Destination of the frame
	output logic[47:0]			fabric_frame_src_mac	= 0,	//Source of the frame
	output logic[11:0]			fabric_frame_vlan		= 0,	//VLAN ID of the frame
	input wire					fabric_fwd_en,					//Bring high for one cycle to forward this frame
	output logic				fabric_fwd_valid		= 0,	//High if data being forwarded is valid
	output logic[3:0]			fabric_fwd_bytes_valid	= 0,	//Number of valid bytes in this 64-bit block
																//(always 8 except in last one)
	output logic[63:0]			fabric_fwd_data			= 0,	//The actual data being forwarded through the fabric
	input wire					fabric_pop						//Bring high for one cycle to pop this frame
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Input data processing / width shifting

	localparam ADDR_BITS = $clog2(FIFO_LINES);

	logic				push_en		= 0;
	logic[63:0]			push_data	= 0;
	logic				push_valid	= 0;

	wire[ADDR_BITS:0]	push_size;

	logic				push_commit		= 0;
	logic				push_commit_adv	= 0;
	logic				push_rollback	= 0;

	logic				dropping		= 0;

	//TODO: header info
	typedef struct packed
	{
		logic[10:0]		len;
		logic[47:0]		src_mac;
		logic[47:0]		dst_mac;
	} header_t;

	header_t			push_header	= 0;

	always_ff @(posedge mac_clk) begin
		/*
		push_en			<= 0;
		push_commit		<= 0;
		push_commit_adv	<= 0;
		push_rollback	<= 0;

		//Reset when a new frame starts
		if(mac_rx_bus.start) begin
			push_data	<= 0;
			push_valid	<= 0;
			push_header	<= 0;
			dropping	<= 0;
		end

		//Handle incoming frame data
		if(mac_rx_bus.data_valid && !dropping) begin

			push_data		<= { push_data[31:0], mac_rx_bus.data };
			push_header.len	<= push_header.len + mac_rx_bus.bytes_valid;

			//If buffer is half full, push it and clear
			if(push_valid) begin
				push_en		<= 1;
				push_valid	<= 0;
			end

			//If buffer is empty, save this half
			else
				push_valid	<= 1;

		end

		//Bail when a frame is dropped by the MAC
		if(mac_rx_bus.drop) begin
			push_data		<= 0;
			push_valid		<= 0;
			push_len		<= 0;
			push_rollback	<= 1;
			dropping		<= 0;
		end

		//Push any remaining half-finished data when the frame ends
		if(mac_rx_bus.commit) begin
			dropping		<= 0;

			if(push_valid) begin
				push_en			<= 1;
				push_valid		<= 0;
				push_commit_adv	<= 1;
			end
			else
				push_commit		<= 1;
		end

		//Handle delayed commit after pushing partial packet
		if(push_commit_adv)
			push_commit			<= 1;

		//Handle fifo running out of space midway through a packet
		if( (wr_size <= 2) && !mac_rx_bus.commit && !push_commit_adv) begin
			dropping			<= 1;
			push_rollback		<= 1;
			push_en				<= 0;
		end
		*/
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual packet data FIFO

	CrossClockPacketFifo #(
		.WIDTH(64),
		.DEPTH(FIFO_LINES)
	) fifo (
		.wr_clk(mac_clk),
		.wr_en(push_en),
		.wr_data(push_data),
		.wr_reset(1'b0),
		.wr_size(push_size),
		.wr_commit(push_commit),
		.wr_rollback(push_rollback)

		//TODO: Read ports
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Parallel header FIFO for packet metadata

endmodule
