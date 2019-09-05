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
	@brief RX FIFO for traffic heading into the switch fabric

	Needs to be multiple of 2x 18Kb BRAMs since 64+ bits wide

	The push side interface comes off an Ethernet2TypeDecoder.
 */
module RxFifo #(

	//Default config here is for a 1000baseT port, probably want larger for 10G
	parameter FIFO_LINES		= 2048,				//need 375 lines for a 1500 byte frame
													//2K lines = 5.46 max sized frames or 32 min sized frames
	parameter META_FIFO_LINES	= 32				//enough to hold metadata for FIFO_LINES worth of min sized frames

) (
	//Incoming frame bus
	input wire					mac_clk,			//Incoming frame clock
	input wire EthernetRxL2Bus	mac_rx_bus,			//Incoming frame data

	//Link state (mac_clk domain).
	//When link goes down, all traffic in the buffer is wiped
	input wire					link_state,

	//VLAN configuration (mac_clk domain)
	input wire					has_port_vlan,			//True if the port is configured in "port vlan" mode
	input wire[11:0]			port_vlan_id,			//VLAN ID for port based VLANs
	input wire					native_vlan_allowed,	//True if we can mix port VLAN and tagged traffic
														//(requires has_port_vlan be set too)

	//Performance counters (mac_clk domain). Go high for one cycle to indicate an event has happened.
	output logic				mac_queued		= 0,	//Frame was accepted
	output logic				mac_drop_fifo	= 0,	//Frame was lost due to insufficient buffer space
	output logic				mac_drop_vlan	= 0,	//Frame was lost due to having/not having a vlan tag when port
														//was configured in the opposite mode
	output logic				mac_drop_runt	= 0,	//Frame was dropped because too small
	output logic				mac_drop_jumbo	= 0,	//Frame was dropped because too large

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

	//TODO: delete all in-flight traffic when the link drops

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

	//Headers parallel with port data
	typedef struct packed
	{
		logic[10:0]		len;
		ethertype_t		ethertype;
		logic[47:0]		src_mac;
		logic[47:0]		dst_mac;
		logic[11:0]		vlan;
	} header_t;

	header_t			push_header	= 0;

	logic				headers_valid_ff	= 0;

	always_ff @(posedge mac_clk) begin

		push_en			<= 0;
		push_commit		<= 0;
		push_commit_adv	<= 0;
		push_rollback	<= 0;

		mac_queued		<= 0;
		mac_drop_fifo	<= 0;
		mac_drop_vlan	<= 0;
		mac_drop_runt	<= 0;
		mac_drop_jumbo	<= 0;

		headers_valid_ff	<= mac_rx_bus.headers_valid;

		//Reset when a new frame starts
		if(mac_rx_bus.start) begin
			push_data	<= 0;
			push_valid	<= 0;
			push_header	<= 0;
			dropping	<= 0;
		end

		//Save headers when they come in
		if(mac_rx_bus.headers_valid && !headers_valid_ff) begin
			push_header.ethertype	<= mac_rx_bus.ethertype;
			push_header.src_mac		<= mac_rx_bus.src_mac;
			push_header.dst_mac		<= mac_rx_bus.dst_mac;

			//If we have a VLAN tag, use that VLAN.
			//BUT if we also have a port based vlan configured, we shouldn't see tagged traffic at all
			//Drop the frame to prevent vlan hopping, unless we're in native-vlan mode
			if(mac_rx_bus.has_vlan_tag) begin

				if(has_port_vlan && !native_vlan_allowed) begin
					push_rollback	<= 1;
					dropping		<= 1;
					mac_drop_vlan	<= 1;
				end

				else
					push_header.vlan	<= mac_rx_bus.vlan_id;

			end

			//No VLAN tag on the frame
			else begin

				//Use the port VLAN ID instead.
				if(has_port_vlan)
					push_header.vlan	<= port_vlan_id;

				//If there's no port VLAN we're in trunk-only mode, drop untagged traffic.
				else begin
					push_rollback	<= 1;
					dropping		<= 1;
					mac_drop_vlan	<= 1;
				end

			end

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
			push_header.len	<= 0;
			push_rollback	<= 1;
			dropping		<= 0;
		end

		//Frame ended
		if(mac_rx_bus.commit && !dropping) begin

			//If the frame is too small, drop it
			if( (push_header.len < 60) ||
				(push_header.len == 60 && mac_rx_bus.data_valid && mac_rx_bus.bytes_valid != 4) ) begin
				dropping			<= 1;
				push_rollback		<= 1;
				push_en				<= 0;
				mac_drop_runt		<= 1;
			end

			//Push any remaining half-finished data
			else if(push_valid) begin
				push_en			<= 1;
				push_valid		<= 0;
				push_commit_adv	<= 1;
			end

			//Nope, all good
			else
				push_commit		<= 1;
		end

		//Handle delayed commit after pushing partial packet
		if(push_commit_adv)
			push_commit			<= 1;

		if(push_commit)
			mac_queued			<= 1;

		//Handle fifo running out of space midway through a packet
		if( (push_size <= 2) && !mac_rx_bus.commit && !push_commit_adv && !dropping) begin
			dropping			<= 1;
			push_rollback		<= 1;
			push_en				<= 0;
			mac_drop_fifo		<= 1;
		end

		//Handle excessively large packets
		if(push_header.len > 1600 && !dropping) begin
			dropping			<= 1;
			push_rollback		<= 1;
			push_en				<= 0;
			mac_drop_jumbo		<= 1;
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual packet data FIFO

	logic					data_rd_en			= 0;
	logic[ADDR_BITS-1:0]	data_rd_offset		= 0;
	logic					data_pop_single		= 0;
	logic					data_pop_packet	= 0;
	logic[ADDR_BITS:0]		data_rd_packet_size	= 0;
	wire[63:0]				data_rd_data;
	wire[ADDR_BITS:0]		data_rd_size;

	CrossClockPacketFifo #(
		.WIDTH(64),
		.DEPTH(FIFO_LINES)
	) data_fifo (
		.wr_clk(mac_clk),
		.wr_en(push_en),
		.wr_data(push_data),
		.wr_reset(1'b0),
		.wr_size(push_size),
		.wr_commit(push_commit),
		.wr_rollback(push_rollback),

		.rd_clk(fabric_clk),
		.rd_en(data_rd_en),
		.rd_offset(data_rd_offset),
		.rd_pop_single(data_pop_single),
		.rd_pop_packet(data_pop_packet),
		.rd_packet_size(data_rd_packet_size),
		.rd_data(data_rd_data),
		.rd_size(data_rd_size),
		.rd_reset(1'b0)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Parallel header FIFO for packet metadata

	localparam HEADER_ADDR_BITS = $clog2(META_FIFO_LINES);

	logic						header_rd_en		= 0;
	header_t					header_rd_data;

	wire[HEADER_ADDR_BITS:0]	header_rd_size;
	wire						header_rd_empty;

	CrossClockFifo #(
		.WIDTH($bits(header_t)),
		.DEPTH(META_FIFO_LINES),
		.USE_BLOCK(0),
		.OUT_REG(1)
	) header_fifo (
		.wr_clk(mac_clk),
		.wr_en(push_commit),
		.wr_data(push_header),
		.wr_size(),					//Don't bother checking for FIFO space. We have enough header memory for
									//a full buffer of minimum sized frames, and discard runt frames that would waste
									//too much header space.
		.wr_full(),
		.wr_overflow(),

		.rd_clk(fabric_clk),
		.rd_en(header_rd_en),
		.rd_data(header_rd_data),
		.rd_size(header_rd_size),
		.rd_empty(header_rd_empty),
		.rd_underflow()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// FIFO pop logic

	logic		header_rd_en_ff	= 0;
	logic[63:0]	data_rd_data_ff	= 0;

	logic[ADDR_BITS-1:0]	data_rd_offset_ff	= 0;
	logic[ADDR_BITS-1:0]	data_rd_offset_ff2	= 0;

	enum logic[2:0]
	{
		FWD_STATE_IDLE		= 0,
		FWD_STATE_HEADER	= 1,
		FWD_STATE_FIRST		= 2,
		FWD_STATE_DATA		= 3,
		FWD_STATE_LAST		= 4
	} fwd_state = FWD_STATE_IDLE;

	always_ff @(posedge fabric_clk) begin

		header_rd_en	<= 0;
		data_rd_en		<= 0;
		data_pop_single	<= 0;
		data_pop_packet	<= 0;

		header_rd_en_ff		<= header_rd_en;
		data_rd_data_ff		<= data_rd_data;

		data_rd_offset_ff	<= data_rd_offset;
		data_rd_offset_ff2	<= data_rd_offset_ff;

		fabric_fwd_valid	<= 0;

		//If we don't have a packet in the outbox, and there's headers ready to read, go grab them
		if(!header_rd_en && !header_rd_empty && !fabric_frame_valid)
			header_rd_en		<= 1;

		//If we just read headers, put them in the output so the fabric can decide what to do
		if(header_rd_en_ff) begin
			fabric_frame_valid		<= 1;
			fabric_frame_dst_mac	<= header_rd_data.dst_mac;
			fabric_frame_src_mac	<= header_rd_data.src_mac;
			fabric_frame_vlan		<= header_rd_data.vlan;
		end

		//Pop a packet when we're done working on it
		if(fabric_pop) begin
			data_pop_packet			<= 1;
			fabric_frame_valid		<= 0;

			if(header_rd_data.len[2:0])
				data_rd_packet_size	<= header_rd_data.len[10:3] + 1'h1;
			else
				data_rd_packet_size	<= header_rd_data.len[10:3];
		end

		case(fwd_state)

			//Start forwarding when the fabric requests it
			FWD_STATE_IDLE: begin

				if(fabric_fwd_en) begin
					data_rd_en		<= 1;
					data_rd_offset	<= 0;
					fwd_state		<= FWD_STATE_HEADER;
				end

			end	//end FWD_STATE_IDLE

			//Synthesize a new Ethernet frame header, without a VLAN tag if there was one
			FWD_STATE_HEADER: begin
				data_rd_en				<= 1;
				data_rd_offset			<= 1;

				fabric_fwd_valid		<= 1;
				fabric_fwd_bytes_valid	<= 8;
				fabric_fwd_data			<= { header_rd_data.dst_mac, header_rd_data.src_mac[47:32] };

				fwd_state				<= FWD_STATE_FIRST;

			end	//end FWD_STATE_HEADER

			//Send the rest of the frame header, plus the beginning of the frame data
			FWD_STATE_FIRST: begin
				data_rd_en				<= 1;
				data_rd_offset			<= 2;

				fabric_fwd_valid		<= 1;
				fabric_fwd_bytes_valid	<= 8;
				fabric_fwd_data			<=
				{
					header_rd_data.src_mac[31:0],
					header_rd_data.ethertype,
					data_rd_data[63:48]
				};

				fwd_state				<= FWD_STATE_DATA;
			end	//end FWD_STATE_FIRST

			//Send frame data
			FWD_STATE_DATA: begin

				//Keep reading. Reading is a nondestructive operation that wraps,
				//so it's totally fine to read off the end of the packet if it ends prematurely.
				data_rd_en				<= 1;
				data_rd_offset			<= data_rd_offset + 1;

				fabric_fwd_valid		<= 1;
				fabric_fwd_bytes_valid	<= 8;
				fabric_fwd_data			<=
				{
					data_rd_data_ff[47:0],
					data_rd_data[63:48]
				};

				//End of frame? Stop (and truncate any partial data)
				if(header_rd_data.len[10:3] == data_rd_offset_ff2) begin

					case(header_rd_data.len[2:0])

						//Use 6 saved bytes, 2 padding at the end
						0: begin
							fabric_fwd_data[15:0]	<= 0;
							fabric_fwd_bytes_valid	<= 6;
							fwd_state				<= FWD_STATE_IDLE;
						end

						//6 saved bytes, 1 new byte, 1 padding at the end
						1: begin
							fabric_fwd_data[7:0]	<= 0;
							fabric_fwd_bytes_valid	<= 7;
							fwd_state				<= FWD_STATE_IDLE;
						end

						//6 saved bytes, 2 new bytes, no padding
						2: begin
							fabric_fwd_bytes_valid	<= 2;
							fwd_state				<= FWD_STATE_IDLE;
						end

						default:
							fwd_state				<= FWD_STATE_LAST;

					endcase

				end

			end	//end FWD_STATE_DATA

			//Empty out the last few bytes at the end of the packet
			FWD_STATE_LAST: begin

				fabric_fwd_valid		<= 1;
				fabric_fwd_data			<=
				{
					data_rd_data_ff[47:0],
					data_rd_data[63:48]
				};

				case(header_rd_data.len[2:0])

					//Use 1 saved byte, 7 padding
					3: begin
						fabric_fwd_data[55:0]	<= 0;
						fabric_fwd_bytes_valid	<= 1;
					end

					//Use 2 saved bytes, 6 padding
					4: begin
						fabric_fwd_data[48:0]	<= 0;
						fabric_fwd_bytes_valid	<= 2;
					end

					//Use 3 saved bytes, 5 padding
					3: begin
						fabric_fwd_data[40:0]	<= 0;
						fabric_fwd_bytes_valid	<= 3;
					end

					//Use 4 saved bytes, 4 padding
					4: begin
						fabric_fwd_data[32:0]	<= 0;
						fabric_fwd_bytes_valid	<= 4;
					end

					//Use 5 saved bytes, 3 padding
					5: begin
						fabric_fwd_data[24:0]	<= 0;
						fabric_fwd_bytes_valid	<= 5;
					end

					//Use 6 saved bytes, 2 padding
					6: begin
						fabric_fwd_data[16:0]	<= 0;
						fabric_fwd_bytes_valid	<= 6;
					end

					//Use 6 saved bytes, 1 new, 1 padding
					7: begin
						fabric_fwd_data[7:0]	<= 0;
						fabric_fwd_bytes_valid	<= 7;
					end

				endcase

				fwd_state				<= FWD_STATE_IDLE;

			end	//end FWD_STATE_LAST

		endcase

	end

endmodule
