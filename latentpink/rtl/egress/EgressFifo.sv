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

/**
	@file
	@author Andrew D. Zonenberg
	@brief Forwarding logic

	Takes frames from forwarding engine and transitions them to the port MAC buses
 */
module EgressFifo #(
	parameter NUM_PORTS						= 15,
	localparam PORT_BITS					= $clog2(NUM_PORTS)
)(
	//Link state flags for resets
	input wire[NUM_PORTS-1:0]				port_rx_clk,
	input wire[NUM_PORTS-1:0]				port_link_up,

	//Output bus from forwarding engine and ingress fifo
	input wire								clk_ram_ctl,
	input wire								frame_valid,
	input wire								frame_last,
	input wire[127:0]						frame_data,
	input wire[10:0]						frame_len,
	input wire[NUM_PORTS-1:0]				frame_port_wr,
	output wire[NUM_PORTS-1:0]				port_space_avail,

	//Per-port transmit interfaces
	input wire[NUM_PORTS-1:0]				port_tx_clk,
	input wire[NUM_PORTS-1:0]				port_tx_ready,
	output EthernetTxBus[NUM_PORTS-1:0]		port_tx_bus
);

	for(genvar g=0; g<NUM_PORTS; g=g+1) begin : fifos

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Generate resets from synchronized link states

		wire	link_up_core;

		ThreeStageSynchronizer sync_link_up(
			.clk_in(port_rx_clk[g]),
			.din(port_link_up[g]),
			.clk_out(clk_ram_ctl),
			.dout(link_up_core)
		);

		logic	link_up_ff	= 0;
		logic	rst_core	= 0;
		always_ff @(posedge clk_ram_ctl) begin
			link_up_ff	<= link_up_core;
			rst_core 	<= (link_up_core != link_up_ff);
		end

		wire	rst_tx;
		PulseSynchronizer sync_rst_tx(
			.clk_a(clk_ram_ctl),
			.pulse_a(rst_core),
			.clk_b(port_tx_clk[g]),
			.pulse_b(rst_tx)
		);

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CDC FIFOs

		wire[9:0]	data_wr_size;

		logic		data_rd_en 			= 0;
		wire[127:0]	data_rd_data;
		wire		data_rd_empty;

		CrossClockFifo #(
			.WIDTH(128),
			.DEPTH(512),
			.USE_BLOCK(1),
			.OUT_REG(1)
		) data_fifo (
			.wr_clk(clk_ram_ctl),
			.wr_en(frame_valid && frame_port_wr[g]),
			.wr_data(frame_data),
			.wr_reset(rst_core),
			.wr_size(data_wr_size),
			.wr_overflow(),
			.wr_full(),

			.rd_clk(port_tx_clk[g]),
			.rd_en(data_rd_en),
			.rd_data(data_rd_data),
			.rd_size(),
			.rd_underflow(),
			.rd_empty(data_rd_empty),
			.rd_reset(rst_tx)
		);

		wire		header_wr_full;
		wire[6:0]	header_wr_size;

		wire		header_rd_empty;
		logic		header_rd_en	= 0;
		wire[10:0]	header_rd_data;

		CrossClockFifo #(
			.WIDTH(11),
			.DEPTH(64),
			.USE_BLOCK(0),
			.OUT_REG(1)
		) header_fifo (
			.wr_clk(clk_ram_ctl),
			.wr_en(frame_last && frame_port_wr[g]),
			.wr_data(frame_len),
			.wr_size(header_wr_size),
			.wr_full(header_wr_full),
			.wr_overflow(),
			.wr_reset(rst_core),

			.rd_clk(port_tx_clk[g]),
			.rd_en(header_rd_en),
			.rd_data(header_rd_data),
			.rd_size(),
			.rd_empty(header_rd_empty),
			.rd_underflow(),
			.rd_reset(rst_tx)
		);

		//Use conservative estimates for available space so that we can pipeline the "space available" flag
		assign port_space_avail[g] = (data_wr_size >= 128) && (header_wr_size >= 2);

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Transmit state machine

		//TODO: vlan tag insertion
		//For now, all outbound traffic will be untagged

		enum logic[1:0]
		{
			TX_STATE_IDLE,
			TX_STATE_INITIAL,
			TX_STATE_FORWARD
		} tx_state = TX_STATE_IDLE;

		logic[10:0]	tx_count	= 0;

		//Uplink is 10G, everything else is 1G
		wire	speed_is_10g;
		assign speed_is_10g = (g == NUM_PORTS-1);

		always_ff @(posedge port_tx_clk[g]) begin

			header_rd_en				<= 0;
			data_rd_en					<= 0;

			port_tx_bus[g].start		<= 0;
			port_tx_bus[g].data_valid	<= 0;
			port_tx_bus[g].data			<= 0;
			port_tx_bus[g].bytes_valid	<= 0;

			case(tx_state)

				//When data shows up and the MAC is ready, read the length and first data word simultaneously
				TX_STATE_IDLE: begin
					if(!header_rd_empty && port_tx_ready[g] && !data_rd_empty) begin
						header_rd_en	<= 1;
						data_rd_en		<= 1;
						tx_state		<= TX_STATE_INITIAL;
					end
				end

				//Wait for initial reads to execute
				//then pop the data word off the FIFO
				TX_STATE_INITIAL: begin
					tx_count				<= 0;
					tx_state				<= TX_STATE_FORWARD;
					port_tx_bus[g].start	<= 1;
				end

				//Forward frame data
				TX_STATE_FORWARD: begin

					//10G: 32 bit datapath
					if(speed_is_10g) begin

						port_tx_bus[g].data_valid	<= 1;

						case(tx_count[3:2])
							0:	port_tx_bus[g].data	<= data_rd_data[96 +: 32];
							1: 	port_tx_bus[g].data	<= data_rd_data[64 +: 32];
							2: begin
								port_tx_bus[g].data	<= data_rd_data[32 +: 32];

								//Read the next word from memory if needed
								if(tx_count + 8 < header_rd_data)
									data_rd_en		<= 1;
							end

							3: port_tx_bus[g].data	<= data_rd_data[0 +: 32];

						endcase

						//Sending 4 bytes per clock
						tx_count	<= tx_count + 4;

						//Last word? We're done
						if(tx_count + 4 >= header_rd_data) begin
							tx_state					<= TX_STATE_IDLE;
							port_tx_bus[g].bytes_valid	<= (header_rd_data - tx_count);
						end

						//Nope, full 4-byte block
						else
							port_tx_bus[g].bytes_valid	<= 4;

					end

					//1G: 8 bit datapath
					else begin

						port_tx_bus[g].data_valid	<= 1;
						port_tx_bus[g].bytes_valid	<= 1;
						tx_count					<= tx_count + 1;

						port_tx_bus[g].data[7:0]	<= data_rd_data[(15 - tx_count[3:0])*8 +: 8];
						port_tx_bus[g].data[31:8]	<= 0;

						//Read the next word from memory if needed
						if( (tx_count[3:0] == 'he) && ( (tx_count + 2) < header_rd_data ) )
							data_rd_en				<= 1;

						//Last word? We're done
						if(tx_count + 1 >= header_rd_data)
							tx_state				<= TX_STATE_IDLE;

					end

				end

			endcase

			//sync reset when link state changes
			if(rst_tx) begin
				header_rd_en	<= 0;
				tx_state		<= TX_STATE_IDLE;
				tx_count		<= 0;
			end

		end

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Debug ILA

		if( (g == 0) || (g == 2) ) begin

			ila_1 ila(
				.clk(clk_ram_ctl),
				.probe0(frame_valid),
				.probe1(frame_port_wr[g]),
				.probe2(frame_data),
				.probe3(frame_len),
				.probe4(frame_last),
				.probe5(port_space_avail[g]),
				.probe6(data_wr_size),
				.probe7(header_wr_size)
			);

		end

	end	//main loop

endmodule
