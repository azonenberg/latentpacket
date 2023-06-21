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
	@brief Input FIFO block, writes data from each of the inbound switch ports to QDR-II+
 */
module IngressFifo #(
	parameter NUM_PORTS = 15
)(
	//Inbound data from network ports
	input wire[NUM_PORTS-1:0]	port_rx_clk,
	input wire[NUM_PORTS-1:0]	port_link_up,
	input wire EthernetRxBus	port_rx_bus,

	//RAM interface
	input wire					clk_ram_ctl,
	output logic				ram_wr_en	= 0,
	output logic[17:0]			ram_wr_addr	= 0,
	output logic[143:0]			ram_wr_data	= 0
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Expand data to 128 bit width and move into SRAM clock domain

	for(genvar g=0; g<NUM_PORTS; g=g+1) begin : cdcs
		IngressCDC cdc(
			.rx_clk(port_rx_clk[g]),
			.link_up(port_link_up[g]),
			.rx_bus(port_rx_bus[g])
		);
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// FIFO write pointers

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Arbitration / muxing to single data stream

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// FEC encoding

endmodule
