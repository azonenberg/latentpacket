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
`include "RxFifoBus.svh"

/**
	@brief RX FIFO for traffic from 1G ports to the switch fabric using external QDR-II+ for storage

	The logical QDR interface is 144 bits wide, but we only use the low 128 bits for packet data.
	The rest is currently unused.

	Assuming a 36 Mbit QDR, we allocate 8K lines (1 Mbit) of FIFO space to each interface.
	A minimum sized packet is 64 bytes (512 bits) or four FIFO lines, so we need metadata storage for
	2K packets per port.

	The packet metadata is 135 bits long, so we can use the extra bits and fit one header into one line of QDR.
	We thus need 2K lines per port for metadata storage.

	Memory map
		00000 ... 01fff	Port 0 packet data
		02000 ... 03fff	Port 1 packet data
		...
		2e000 ... 2ffff	Port 23 packet data
		30000 ... 307ff	Port 0 metadata
		30800 ... 30fff Port 1 metadata
		...
		3b800 ... 3bfff	Port 23 metadata
		3c000 ... 3ffff Reserved, not used
 */
module GigabitRxFifo #(
	parameter NUM_PORTS			= 24,
	parameter LINES_PER_PORT	= 8192,
	parameter META_FIFO_LINES	= 2048
) (
	//QDR RAM controller (fabric_clk domain)
	output logic					rd_en		= 0,
	output logic[ADDR_BITS-1:0]		rd_addr		= 0,
	input wire						rd_valid,
	input wire[CTRL_WIDTH-1:0]		rd_data,
	output logic					wr_en		= 0,
	output logic[ADDR_BITS-1:0]		wr_addr		= 0,
	output logic[CTRL_WIDTH-1:0]	wr_data		= 0,

	//Incoming frame bus
	input wire[NUM_PORTS-1:0]					mac_clk,		//Incoming frame clock
	input wire EthernetRxL2Bus[NUM_PORTS-1:0]	mac_rx_bus,		//Incoming frame data

	//VLAN configuration (mac_clk domain)
	input wire[NUM_PORTS-1:0]					has_port_vlan,			//True if the port is configured in "port vlan" mode
	input wire vlan_t[NUM_PORTS-1:0]			port_vlan_id,			//VLAN ID for port based VLANs
	input wire[NUM_PORTS-1:0]					native_vlan_allowed,	//True if we can mix port VLAN and tagged traffic
																		//(requires has_port_vlan be set too)

	//Performance counters (mac_clk domain). Go high for one cycle to indicate an event has happened.
	output logic[NUM_PORTS-1:0]					mac_queued		= 0,	//Frame was accepted
	output logic[NUM_PORTS-1:0]					mac_drop_fifo	= 0,	//Frame was lost due to insufficient buffer space
	output logic[NUM_PORTS-1:0]					mac_drop_vlan	= 0,	//Frame was lost due to having/not having a vlan tag when port
																		//was configured in the opposite mode
	output logic[NUM_PORTS-1:0]					mac_drop_runt	= 0,	//Frame was dropped because too small
	output logic[NUM_PORTS-1:0]					mac_drop_jumbo	= 0,	//Frame was dropped because too large

	//Outbound bus to fabric
	input wire									fabric_clk,				//Main switch clock
	input wire[NUM_PORTS-1:0]					fabric_pop,				//Bring high for one cycle to pop this frame
	input wire[NUM_PORTS-1:0]					fabric_fwd_en,			//Bring high for one cycle to forward this frame
	output RxFifoBus[NUM_PORTS-1:0]				fabric_bus		= 0
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// CDC for incoming traffic

	//Headers parallel with port data
	typedef struct packed
	{
		logic[10:0]		len;
		ethertype_t		ethertype;
		macaddr_t		src_mac;
		macaddr_t		dst_mac;
		vlan_t			vlan;
	} header_t;

	for(genvar g=0; g<NUM_PORTS; g=g+1) begin

		//Small BRAM CDC FIFO for data (one packet and change)

		//Small LUT based metadata fifo

	end

endmodule
