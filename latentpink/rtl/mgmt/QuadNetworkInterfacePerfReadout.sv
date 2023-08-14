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
`include "SGMIIToGMIIBridge.svh"
`include "NetworkPerfCounters.svh"

/**
	@file
	@author Andrew D. Zonenberg
	@brief Performance counter readout for four QSGMII network interfaces
 */
module QuadNetworkInterfacePerfReadout(

	//Clock domains for performance counters
	input wire									clk_mac,

	//Performance counter values
	input wire EthernetMacPerformanceData[3:0]	mac_perf,

	//Management bus
	input wire									clk_mgmt,
	input wire									rd_en,
	input wire[1:0]								rd_port,
	input wire[15:0]							rd_addr,
	output logic								rd_valid	= 0,
	output logic[47:0]							rd_data		= 0
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synchronize read request from management clock domain out into each of the remote clock domains

	wire		rd_mac;
	wire[7:0]	regid_mac;
	wire[1:0]	port_mac;

	RegisterSynchronizer #(
		.WIDTH(10),
		.IN_REG(0)
	) sync_req_mac (
		.clk_a(clk_mgmt),
		.en_a(rd_en && ( (rd_addr[15:8] == 8'h10) || (rd_addr[15:8] == 8'h11) ) ),
		.ack_a(),
		.reg_a({rd_addr[7:0], rd_port}),

		.clk_b(clk_mac),
		.updated_b(rd_mac),
		.reset_b(1'b0),
		.reg_b({regid_mac, port_mac})
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Mux read data in remote clock domains

	logic[47:0]	rd_data_mac	= 0;
	logic		rd_valid_mac	= 0;

	always_ff @(posedge clk_mac) begin
		rd_valid_mac		<= 0;

		if(rd_mac) begin
			rd_valid_mac	<= 1;

			case(regid_mac)
				REG_TX_FRAMES[7:0]:		rd_data_mac	<= mac_perf[port_mac].tx_frames;
				REG_TX_BYTES[7:0]:		rd_data_mac	<= mac_perf[port_mac].tx_bytes;
				REG_RX_FRAMES[7:0]:		rd_data_mac	<= mac_perf[port_mac].rx_frames;
				REG_RX_CRC_ERRS[7:0]:	rd_data_mac	<= mac_perf[port_mac].rx_crc_err;
				REG_RX_BYTES[7:0]:		rd_data_mac	<= mac_perf[port_mac].rx_bytes;
				default:				rd_data_mac	<= 0;
			endcase
		end
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synchronize read data from remote clock domains back to management clock domain

	wire		rd_updated_mac;
	wire[47:0]	rd_data_from_mac;

	RegisterSynchronizer #(
		.WIDTH(48),
		.IN_REG(0)
	) sync_data_mac (
		.clk_a(clk_mac),
		.en_a(rd_valid_mac),
		.ack_a(),
		.reg_a(rd_data_mac),

		.clk_b(clk_mgmt),
		.updated_b(rd_updated_mac),
		.reset_b(1'b0),
		.reg_b(rd_data_from_mac)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Mux read data back from whatever clock domain it came from

	always_ff @(posedge clk_mgmt) begin
		rd_valid	<= 0;

		if(rd_updated_mac) begin
			rd_valid	<= 1;
			rd_data		<= rd_data_from_mac;
		end

	end

endmodule
