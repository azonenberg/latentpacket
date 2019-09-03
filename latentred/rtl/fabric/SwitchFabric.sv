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

/**
	@brief The actual switch fabric for LATENTRED

	The switch fabric internally runs at 64 bit width and is clocked at 156.25 MHz.

	Resource estimate for the core crossbar:
		64 bits wide, 8 input ports, 8 output ports
		One 4:1 mux fits in a single LUT6, an 8:1 mux fits in two LUT6s and a F7MUX.
		Each output port thus needs 128 LUT6s and 64 F7MUX's.
		The entire fabric will use 1024 LUT6s and 512 F7MUX's for the core crossbar.

		Actual fabric will be much bigger due to FIFOs and muxing for the 1G ports, plus MAC lookup logic etc.
 */
module SwitchFabric #(
	parameter NUM_1G_PORTS	= 24,
	parameter NUM_10G_PORTS	= 4,

	//Total number of 10G (64 bit * 156.25 MHz) ports on the internal fabric crossbar.
	//Up to six 1G, or one 10G, interfaces attach to each fabric port.
	localparam FABRIC_PORTS = (NUM_1G_PORTS/6) + NUM_10G_PORTS
)(
	//Main fabric clock (156.25 MHz)
	input wire			clk,

	//Interface to the MAC address table
	output logic		mac_lookup_en,
	output logic[11:0]	mac_lookup_src_vlan,
	output logic[47:0]	mac_lookup_src_mac,
	output logic[4:0]	mac_lookup_src_port,
	input wire[47:0]	mac_lookup_dst_mac,
	input wire			mac_lookup_hit,
	input wire[4:0]		mac_lookup_dst_port,

	//1G ports: 32 bits @ 125 MHz with gaps
	input wire[NUM_1G_PORTS-1:0]					rx_1g_clk,
	input wire EthernetRxL2Bus[NUM_1G_PORTS-1:0]	rx_1g_bus,

	//10G ports: 32 bits @ 312.5 MHz
	input wire[NUM_10G_PORTS-1:0]					rx_10g_clk,
	input wire EthernetRxL2Bus[NUM_10G_PORTS-1:0]	rx_10g_bus

	//TODO: transmit side ports
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 1G RX buffers

endmodule
