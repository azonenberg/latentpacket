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

/**
	@file
	@author Andrew D. Zonenberg
	@brief Performance counter readout for a single network interface
 */
module NetworkInterfacePerfReadout #(
	parameter MAC_TX_RX_SAME_CLOCK = 0
)(

	//Clock domains for performance counters
	input wire			clk_sgmii_rx,
	input wire			clk_sgmii_tx,
	input wire			clk_mac_rx,
	input wire			clk_mac_tx,

	//Performance counter values (not all may be supported in a given port)
	input wire	SGMIIPerformanceCounters	sgmii_perf,
	input wire	EthernetMacPerformanceData	mac_perf,

	//Management bus
	input wire			clk_mgmt,
	input wire			rd_en,
	input wire[15:0]	rd_addr,
	output logic		rd_valid	= 0,
	output logic[63:0]	rd_data		= 0
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Names of registers

	//High 8 bits identifies clock domain
	//Low 8 is register within the domain
	typedef enum logic[15:0]
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SGMIIToGMIIBridge (only for DP83867 based ports)

		//clk_sgmii_rx domain
		REG_RX_DISPARITY_ERRS			= 16'h0000,
		REG_RX_SYMBOL_ERRS				= 16'h0001,
		REG_RX_BITSLIPS					= 16'h0002,
		REG_RX_SYMBOLS					= 16'h0003,

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EthernetPerformanceCounters (for all interfaces)

		//REG_TX_* and REG_RX_* must not have common LSBs
		//(to allow for MAC_TX_RX_SAME_CLOCK)

		//clk_mac_tx domain
		REG_TX_FRAMES					= 16'h1000,
		REG_TX_BYTES					= 16'h1001,

		//clk_mac_rx domain
		REG_RX_FRAMES					= 16'h1180,
		REG_RX_CRC_ERRS					= 16'h1181,
		REG_RX_BYTES					= 16'h1182

	} regid_t;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synchronize read request from management clock domain out into each of the remote clock domains

	wire		rd_mac_rx;
	wire[7:0]	regid_mac_rx;

	wire		rd_mac_tx;
	wire[7:0]	regid_mac_tx;

	//Avoid double sync if mac tx/rx are using same clock domain (common for SGMII etc)
	if(MAC_TX_RX_SAME_CLOCK) begin

		RegisterSynchronizer #(
			.WIDTH(8)
		) sync_req_mac_tx (
			.clk_a(clk_mgmt),
			.en_a(rd_en && ( (rd_addr[15:8] == 8'h10) || (rd_addr[15:8] == 8'h11) ) ),
			.ack_a(),
			.reg_a(rd_addr[7:0]),

			.clk_b(clk_mac_tx),
			.updated_b(rd_mac_tx),
			.reset_b(1'b0),
			.reg_b(regid_mac_tx)
		);

	end

	else begin

		RegisterSynchronizer #(
			.WIDTH(8)
		) sync_req_mac_tx (
			.clk_a(clk_mgmt),
			.en_a(rd_en && (rd_addr[15:8] == 8'h10)),
			.ack_a(),
			.reg_a(rd_addr[7:0]),

			.clk_b(clk_mac_tx),
			.updated_b(rd_mac_tx),
			.reset_b(1'b0),
			.reg_b(regid_mac_tx)
		);

		RegisterSynchronizer #(
			.WIDTH(8)
		) sync_req_mac_rx (
			.clk_a(clk_mgmt),
			.en_a(rd_en && (rd_addr[15:8] == 8'h11)),
			.ack_a(),
			.reg_a(rd_addr[7:0]),

			.clk_b(clk_mac_rx),
			.updated_b(rd_mac_rx),
			.reset_b(1'b0),
			.reg_b(regid_mac_rx)
		);

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Mux read data in remote clock domains

	logic[63:0]	rd_data_mac_rx	= 0;
	logic[63:0]	rd_data_mac_tx	= 0;

	logic		rd_valid_mac_rx	= 0;
	logic		rd_valid_mac_tx	= 0;

	//Avoid double sync if mac tx/rx are using same clock domain (common for SGMII etc)
	if(MAC_TX_RX_SAME_CLOCK) begin

		always_ff @(posedge clk_mac_tx) begin
			rd_valid_mac_tx		<= 0;

			if(rd_mac_tx) begin
				rd_valid_mac_tx	<= 1;

				case(regid_mac_tx)
					REG_TX_FRAMES[7:0]:		rd_data_mac_tx	<= mac_perf.tx_frames;
					REG_TX_BYTES[7:0]:		rd_data_mac_tx	<= mac_perf.tx_bytes;
					REG_RX_FRAMES[7:0]:		rd_data_mac_tx	<= mac_perf.rx_frames;
					REG_RX_CRC_ERRS[7:0]:	rd_data_mac_tx	<= mac_perf.rx_crc_err;
					REG_RX_BYTES[7:0]:		rd_data_mac_tx	<= mac_perf.rx_bytes;
					default:				rd_data_mac_tx	<= 0;
				endcase
			end
		end

	end

	else begin

		always_ff @(posedge clk_mac_rx) begin
			rd_valid_mac_rx		<= 0;

			if(rd_mac_rx) begin
				rd_valid_mac_rx	<= 1;

				case(regid_mac_rx)
					REG_RX_FRAMES[7:0]:		rd_data_mac_rx	<= mac_perf.rx_frames;
					REG_RX_CRC_ERRS[7:0]:	rd_data_mac_rx	<= mac_perf.rx_crc_err;
					REG_RX_BYTES[7:0]:		rd_data_mac_rx	<= mac_perf.rx_bytes;
					default:				rd_data_mac_rx	<= 0;
				endcase
			end
		end

		always_ff @(posedge clk_mac_tx) begin
			rd_valid_mac_tx		<= 0;

			if(rd_mac_tx) begin
				rd_valid_mac_tx	<= 1;

				case(regid_mac_tx)
					REG_TX_FRAMES[7:0]:		rd_data_mac_tx	<= mac_perf.tx_frames;
					REG_TX_BYTES[7:0]:		rd_data_mac_tx	<= mac_perf.tx_bytes;
					default:				rd_data_mac_tx	<= 0;
				endcase
			end
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synchronize read data from remote clock domains back to management clock domain

	wire		rd_updated_mac_rx;
	wire		rd_updated_mac_tx;

	wire[63:0]	rd_data_from_mac_rx;
	wire[63:0]	rd_data_from_mac_tx;

	if(MAC_TX_RX_SAME_CLOCK) begin

		RegisterSynchronizer #(
			.WIDTH(64)
		) sync_data_mac_tx (
			.clk_a(clk_mac_tx),
			.en_a(rd_valid_mac_tx),
			.ack_a(),
			.reg_a(rd_data_mac_tx),

			.clk_b(clk_mgmt),
			.updated_b(rd_updated_mac_tx),
			.reset_b(1'b0),
			.reg_b(rd_data_from_mac_tx)
		);

	end

	else begin

		RegisterSynchronizer #(
			.WIDTH(64)
		) sync_data_mac_rx (
			.clk_a(clk_mac_rx),
			.en_a(rd_valid_mac_rx),
			.ack_a(),
			.reg_a(rd_data_mac_rx),

			.clk_b(clk_mgmt),
			.updated_b(rd_updated_mac_rx),
			.reset_b(1'b0),
			.reg_b(rd_data_from_mac_rx)
		);

		RegisterSynchronizer #(
			.WIDTH(64)
		) sync_data_mac_tx (
			.clk_a(clk_mac_tx),
			.en_a(rd_valid_mac_tx),
			.ack_a(),
			.reg_a(rd_data_mac_tx),

			.clk_b(clk_mgmt),
			.updated_b(rd_updated_mac_tx),
			.reset_b(1'b0),
			.reg_b(rd_data_from_mac_tx)
		);

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Mux read data back from whatever clock domain it came from

	always_ff @(posedge clk_mgmt) begin
		rd_valid	<= 0;

		if(!MAC_TX_RX_SAME_CLOCK) begin
			if(rd_updated_mac_rx) begin
				rd_valid	<= 1;
				rd_data		<= rd_data_from_mac_rx;
			end
		end

		if(rd_updated_mac_tx) begin
			rd_valid	<= 1;
			rd_data		<= rd_data_from_mac_tx;
		end

	end

endmodule
