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
	@brief Removes 802.1q tags from inbound frames and assigns a vlan ID to the frame.

	If the frame is untagged, a port based VLAN ID is attached instead.

	Separate enable flags allow tagged or untagged traffic to be passed or dropped.

		Tagged + untagged allowed:	native VLAN mode (same behavior as Cisco trunk ports)
		Tagged allowed only: 		LATENTPINK trunk mode
		Untagged allowed only:		access mode
		Neither allowed: 			port effectively disabled, no packets forwarded
 */
module VlanUntagger(
	input wire					clk,

	input wire[11:0]			port_vlan,
	input wire					tagged_allowed,
	input wire					untagged_allowed,

	input wire EthernetRxBus	in_bus,

	output EthernetRxBus		out_bus		= 0,
	output logic[11:0]			out_vlan	= 0
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Find VLAN tags

	logic[8:0]	count		= 0;
	logic		had_tag		= 0;
	logic		dropping	= 0;

	always_ff @(posedge clk) begin

		//Clear single cycle flags
		out_bus			<= 0;

		//Forward start flag
		out_bus.start	<= in_bus.start;

		//Reset word counter at start of packet
		if(in_bus.start) begin
			count		<= 0;
			dropping	<= 0;
		end

		//Ignore if dropping this frame
		if(in_bus.drop)
			dropping	<= 1;
		else if(dropping) begin
		end

		//Forward incoming data
		else if(in_bus.data_valid) begin

			out_bus.data_valid	<= 1;
			out_bus.data		<= in_bus.data;
			out_bus.bytes_valid	<= in_bus.bytes_valid;

			//Cycle 0 = dest MAC[47:16]
			//Cycle 1 = dest MAC[15:0], src MAC[47:32]
			//Cycle 2 = src MAC[31:0]

			//Cycle 3 = VLAN tag (if present)
			//Conveniently, it's exactly four octets!
			//So we can just not forward this one word if required
			if(count == 3) begin

				//Is it a VLAN tag?
				if(in_bus.data[31:16] == 16'h8100) begin

					//Don't send this word along to the fabric
					out_bus				<= 0;

					//Extract VLAN ID
					out_vlan			<= in_bus.data[11:0];

					//Is tagged traffic allowed? If not, drop the frame
					if(!tagged_allowed) begin
						out_bus.drop	<= 1;
						dropping		<= 1;
					end

				end

				//No, it's untagged
				else begin

					//Use port VLAN
					out_vlan			<= port_vlan;

					//Is untagged traffic allowed? If not, drop the frame
					if(!untagged_allowed) begin
						out_bus			<= 0;
						out_bus.drop	<= 1;
						dropping		<= 1;
					end

				end

			end

			count		<= count + 1;

		end

	end

endmodule
