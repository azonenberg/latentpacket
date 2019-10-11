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

`include "TxFifoBus.svh"
`include "EthernetBus.svh"
`include "SwitchFabric.svh"
`include "Ethertypes.svh"
`include "GmiiBus.svh"

/**
	@file
	@author Andrew D. Zonenberg
	@brief	Output buffer and VLAN tag insertion
 */
module OutputFifo #(
	parameter DEPTH = 256,
	parameter USE_BLOCK = 1
)(

	//Bus to switch fabric
	input wire				fabric_clk,
	input wire TxFifoBus	fabric_bus,
	output logic			fabric_ready,
	input wire lspeed_t		fabric_link_speed,	//fabric clock domain

	//Bus to MAC
	input wire				mac_clk,
	output EthernetTxBus	mac_bus,

	//Configuration
	input wire vlan_t		port_vlan,			//port based VLAN ID
	input wire				add_vlan_tag,		//True if we should insert 802.1q tags (trunk port)
												//If false, all traffic not going to vlan "port_vlan" is dropped.
												//TODO: mask of allowed vlans for trunks.
												//For now, all vlans are allowed on all trunks.
	input wire				has_native_vlan		//If true, do not insert vlan tags for vlan "port_vlan", only for
												//everything else.
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual buffer

	typedef struct packed
	{
		logic		start;
		logic[3:0]	bytes_valid;
		logic[63:0]	data;
	} data_t;

	localparam SIZE_BITS = $clog2(DEPTH);

	logic				push_en		= 0;
	data_t				push_data	= 0;
	wire[SIZE_BITS:0]	push_size;

	logic				pop_en		= 0;
	wire[SIZE_BITS:0]	pop_size;
	data_t				pop_data;

	CrossClockFifo #(
		.WIDTH($bits(data_t)),
		.DEPTH(DEPTH)
	) fifo (
		.wr_clk(fabric_clk),
		.wr_en(push_en),
		.wr_data(push_data),
		.wr_size(push_size),
		.wr_full(),
		.wr_overflow(),

		.rd_clk(mac_clk),
		.rd_en(pop_en),
		.rd_data(pop_data),
		.rd_size(pop_size),
		.rd_empty(),
		.rd_underflow()
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Push side logic

	enum logic[1:0]
	{
		PUSH_IDLE		= 0,
		PUSH_DROPPING	= 1,
		PUSH_UNTAGGED	= 2,
		PUSH_TAGGED		= 3
	} push_state = PUSH_IDLE;

	//TODO: pick reasonable sizes
	logic[SIZE_BITS:0] min_size;
	always_comb begin

		case(fabric_link_speed)
			LINK_SPEED_10G:		min_size	= 8;
			LINK_SPEED_1000M:	min_size	= 187;
			LINK_SPEED_100M:	min_size	= 187;
			LINK_SPEED_10M:		min_size	= 187;
			default:			min_size	= 8;
		endcase

		//Flow control
		fabric_ready	= (push_size >= min_size);
	end

	logic		push_first		= 0;
	logic[31:0]	fabric_data_ff	= 0;
	logic[2:0]	fabric_valid_ff	= 0;

	always_ff @(posedge fabric_clk) begin

		push_first	<= 0;
		push_en		<= 0;
		push_data	<= 0;

		case(push_state)

			//Start a new frame
			PUSH_IDLE: begin
				if(fabric_bus.valid) begin

					//Drop frames if they don't go to our vlan
					//TODO: check vlan mask once we have it
					if(!add_vlan_tag && (port_vlan != fabric_bus.vlan)) begin
						$display("[%t] Ignoring frame to vlan %d because we're vlan %d", $time(), fabric_bus.vlan, port_vlan);
						push_state	<= PUSH_DROPPING;
					end

					//TEMP: drop STP etc
					else if(fabric_bus.ethertype == 0) begin
						push_state	<= PUSH_DROPPING;
					end

					//Drop frames if we don't have enough FIFO space for them.
					//This should never happen due to flow control
					else if(!fabric_ready) begin
						$display("[%t] Dropping frame because we only have %0d bytes of TX FIFO space", $time(), push_size);
						push_state	<= PUSH_DROPPING;
					end

					//All good, start pushing the frame into the TX queue
					//First 64 bits is dest MAC + first 2 of source MAC, just forward that as is regardless
					else begin
						push_en					<= 1;
						push_data.bytes_valid	<= 8;
						push_data.data			<= fabric_bus.data;
						push_data.start			<= 1;

						push_first				<= 1;

						//Decide whether to add a 802.1q tag or not
						if(add_vlan_tag && !(has_native_vlan && (port_vlan == fabric_bus.vlan)))
							push_state			<= PUSH_TAGGED;
						else
							push_state			<= PUSH_UNTAGGED;

					end

				end
			end	//end PUSH_IDLE

			//Drop a frame that we're not going to forward
			PUSH_DROPPING: begin
				if(!fabric_bus.valid)
					push_state		<= PUSH_IDLE;
			end	//end PUSH_DROPPING

			//Forward an untagged frame, no processing needed
			PUSH_UNTAGGED: begin
				if(fabric_bus.valid) begin
					push_en					<= 1;
					push_data.bytes_valid	<= fabric_bus.bytes_valid;
					push_data.data			<= fabric_bus.data;
				end

				else
					push_state				<= PUSH_IDLE;
			end	//end PUSH_UNTAGGED

			//Forward a tagged frame, adding an 802.1q tag as we go
			PUSH_TAGGED: begin

				fabric_data_ff				<= fabric_bus.data[31:0];

				if(fabric_bus.valid) begin

					push_en						<= 1;

					//Next block is last 4 of source MAC plus VLAN tag
					if(push_first) begin
						push_data.data			<=
						{
							fabric_bus.data[63:32],
							ETHERTYPE_DOT1Q,
							4'h0,
							fabric_bus.vlan
						};
						push_data.bytes_valid	<= 8;
					end

					//Shift data by 4 bytes because of 802.1q tag
					else begin
						push_data.data				<= { fabric_data_ff, fabric_bus.data[63:32] };

						//Last block of data, even with the tag?
						if(fabric_bus.bytes_valid <= 4) begin
							push_data.bytes_valid	<= fabric_bus.bytes_valid + 4;
							push_state				<= PUSH_IDLE;
							fabric_valid_ff			<= 0;
						end

						//Nope, we have data in the next block
						else begin
							push_data.bytes_valid	<= 8;
							fabric_valid_ff			<= fabric_bus.bytes_valid - 4;
						end

					end

				end

				//Push the last (partial) block of data, if needed
				else begin
					push_en					<= 1;
					push_data.data			<= { fabric_data_ff, 32'h0 };
					push_data.bytes_valid	<= fabric_valid_ff;
					push_state				<= PUSH_IDLE;
				end

			end	//end PUSH_TAGGED

		endcase

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Pop side logic

	logic	start_ff	= 0;

	enum logic[1:0]
	{
		POP_STATE_IDLE 		= 0,
		POP_STATE_PIPE		= 1,
		POP_STATE_FIRST 	= 2,
		POP_STATE_SECOND	= 3
	} pop_state = POP_STATE_IDLE;

	always_ff @(posedge mac_clk) begin
		mac_bus.start		<= 0;
		mac_bus.data_valid	<= 0;
		mac_bus.data		<= 0;
		mac_bus.bytes_valid	<= 0;

		pop_en				<= 0;
		start_ff			<= pop_data.start;

		case(pop_state)

			POP_STATE_IDLE: begin

				//Wait for a frame to start (leave some room to allow for CDC latency)
				if(pop_size >= 8) begin
					pop_en		<= 1;
					pop_state	<= POP_STATE_PIPE;
				end

			end	//end POP_STATE_IDLE

			POP_STATE_PIPE: begin
				pop_state	<= POP_STATE_FIRST;
			end	//end POP_STATE_PIPE

			POP_STATE_FIRST: begin

				//Start a new frame
				if(pop_data.start && !start_ff)
					mac_bus.start	<= 1;

				else begin
					mac_bus.data			<= pop_data.data[63:32];
					mac_bus.data_valid		<= 1;

					//More data left in packet
					if(pop_data.bytes_valid > 4) begin
						mac_bus.bytes_valid	<= 4;

						//Pop more data if we have it
						if(pop_size > 0)
							pop_en		<= 1;

						pop_state			<= POP_STATE_SECOND;
					end

					//End of packet
					else begin
						mac_bus.bytes_valid	<= pop_data.bytes_valid;
						pop_state			<= POP_STATE_IDLE;
					end

				end

			end	//end POP_STATE_FIRST

			POP_STATE_SECOND: begin
				mac_bus.data		<= pop_data.data[31:0];
				mac_bus.data_valid	<= 1;
				mac_bus.bytes_valid	<= pop_data.bytes_valid - 4;

				pop_state			<= POP_STATE_FIRST;

				if(!pop_en)
					pop_state		<= POP_STATE_IDLE;
			end	//end POP_STATE_SECOND

		endcase

	end

endmodule
