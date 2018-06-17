`default_nettype none
`timescale 1ns/1ps
/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2018 Andrew D. Zonenberg                                                                               *
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
	@file
	@author Andrew D. Zonenberg
	@brief MAC address table

	SUMMARY / USAGE

		Fully pipelined MAC table with VLAN support, address learning, and garbage collection.

		TODO: management interface to query table status

	THEORY OF OPERATION

		A single Ethernet frame can be a minimum size of 8 bytes preamble/SFD, 64 bytes frame, plus 12 of IFG which
		comes out to a total of 84 bytes * 8 bits = 672 UIs. This comes out to 1.488 Mpps/Gbps.

		We target a sustained throughput of 1 clock per packet with a fixed latency from request to reply. This gives
		us a maximum forwarding throughput of 156.25 Mpps, significantly more than the 95.23 Mpps that LATENTRED can
		theoretically forward. (However, running at the theoretical forwarding limit will prevent table bandwidth from
		being available for learning new addresses and garbage-collecting old ones.)

		The table is organized as a set-associative cache, indexed by a simple XOR hash of the MAC address. Replacement
		policy is random.

		The MAC table memory is dual ported, with table lookups and learning occurring simultaneously on different ports.

		When a packet comes in, the destination address is looked up on one port while the source is looked up on
		another. After the lookup completes the external interface is presented with the destination results.

		On the internal port, if the source address was found to not be in the table, the address/port tuple are added
		to a FIFO of learned MAC addresses. If the FIFO is full, the address will not be learned.

		Any cycle that a table lookup is not in progress, the learning FIFO is popped and the learned addresses are
		saved in the main address table.

		Old addresses are removed by a mark-and-sweep garbage collector. The mark is set any time a packet from that
		address is forwarded. When a GC is requested by the host system, all un-marked addresses are erased and all
		marked addresses are un-marked.
 */
module MACAddressTable #(
	parameter TABLE_ROWS	= 2048,				//Number of rows in each set
	parameter ASSOC_WAYS	= 8,				//Number of associative sets
	parameter PENDING_SIZE	= 8					//Number of addresses that can be pending write to the table
)(
	input wire			clk,					//nominally 156.25 MHz

	input wire			lookup_en,				//indicates a new packet has arrived
	input wire[11:0]	lookup_src_vlan,		//VLAN ID of the packet
	input wire[47:0]	lookup_src_mac,			//source address of the packet (inserted in table if needed)
	input wire[4:0]		lookup_src_port,		//port ID of the packet (0...31)
	input wire[47:0]	lookup_dst_mac,			//dest address of the packet (to be looked up)

	output reg			lookup_hit		= 0,	//indicates the lookup has completed
	output reg[4:0]		lookup_dst_port = 0,	//port ID of the destination (only valid if lookup_hit is true)

	input wire			gc_en,					//assert for one clock to start garbage collection
	output reg			gc_done			= 0		//goes high at end of garbage collection
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Useful constants

	`include "../../../antikernel-ipcores/synth_helpers/clog2.vh"

	localparam			ROW_BITS	= clog2(TABLE_ROWS);
	localparam			ASSOC_BITS	= clog2(ASSOC_WAYS);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Cache indexing

	//Create a 16-bit index (enough for 64K table rows) by XOR reduction, then truncate to ROW_BITS
	wire[15:0]			lookup_src_index_raw =
		lookup_src_mac[47:32] ^ lookup_src_mac[31:16] ^ lookup_src_mac[15:0] ^ lookup_src_vlan;
	wire[ROW_BITS-1:0]	lookup_src_index = lookup_src_index_raw[ROW_BITS-1:0];

	wire[15:0]			lookup_dst_index_raw =
		lookup_dst_mac[47:32] ^ lookup_dst_mac[31:16] ^ lookup_dst_mac[15:0] ^ lookup_src_vlan;	//src/dest vlan are same

	wire[ROW_BITS-1:0]	lookup_dst_index = lookup_dst_index_raw[ROW_BITS-1:0];

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// PRNG for cache replacement

	//for now, sequential replacement policy
	reg[ASSOC_BITS-1:0] cache_set 	= 0;
	reg					bump_set	= 0;

	always @(posedge clk) begin
		if(bump_set)
			cache_set <= cache_set + 1'h1;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The table

	genvar g;

	/*
		Memory structure:
		66		GC mark bit
		65		Valid bit
		64:53	VLAN number
		52:48	Port number
		47:0	MAC address
	*/
	localparam			INDEX_GC	= 66;
	localparam			INDEX_VALID	= 65;
	localparam			INDEX_VLAN	= 53;
	localparam			INDEX_PORT	= 48;
	localparam			INDEX_MAC	= 0;

	wire[66:0]			lookup_rdata[ASSOC_WAYS-1:0];
	wire[66:0]			learn_rdata[ASSOC_WAYS-1:0];

	reg					learn_en		= 0;
	reg[ASSOC_WAYS-1:0]	learn_wr		= 0;
	reg[ROW_BITS-1:0]	learn_addr		= 0;
	reg[66:0]			learn_wdata		= 0;

	generate

		for(g=0; g<ASSOC_WAYS; g=g+1) begin : sets
			MemoryMacro #(
				.WIDTH(67),
				.DEPTH(TABLE_ROWS),
				.DUAL_PORT(1),
				.USE_BLOCK(1),
				.OUT_REG(2),
				.TRUE_DUAL(1),
				.INIT_VALUE(0)
			) mem (
				.porta_clk(clk),
				.porta_en(lookup_en),
				.porta_addr(lookup_dst_index),
				.porta_we(1'b0),
				.porta_din(67'h0),
				.porta_dout(lookup_rdata[g]),

				.portb_clk(clk),
				.portb_en(learn_en),
				.portb_addr(learn_addr),
				.portb_we(learn_wr[g]),
				.portb_din(learn_wdata),
				.portb_dout(learn_rdata[g])
			);
		end

	endgenerate

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Pipeline delay for read requests

	reg					lookup_en_ff			= 0;
	reg					lookup_en_ff2			= 0;
	reg[ROW_BITS-1:0]	lookup_src_index_ff		= 0;
	reg[ROW_BITS-1:0]	lookup_src_index_ff2	= 0;
	reg[47:0]			lookup_src_mac_ff		= 0;
	reg[47:0]			lookup_src_mac_ff2		= 0;
	reg[4:0]			lookup_src_port_ff		= 0;
	reg[4:0]			lookup_src_port_ff2		= 0;
	reg[47:0]			lookup_dst_mac_ff		= 0;
	reg[47:0]			lookup_dst_mac_ff2		= 0;
	reg[11:0]			lookup_src_vlan_ff		= 0;
	reg[11:0]			lookup_src_vlan_ff2		= 0;

	always @(posedge clk) begin
		lookup_en_ff			<= lookup_en;
		lookup_en_ff2			<= lookup_en_ff;
		lookup_src_index_ff		<= lookup_src_index;
		lookup_src_index_ff2	<= lookup_src_index_ff;
		lookup_src_mac_ff		<= lookup_src_mac;
		lookup_src_mac_ff2		<= lookup_src_mac_ff;
		lookup_src_port_ff		<= lookup_src_port;
		lookup_src_port_ff2		<= lookup_src_port_ff;
		lookup_dst_mac_ff		<= lookup_dst_mac;
		lookup_dst_mac_ff2		<= lookup_dst_mac_ff;
		lookup_src_vlan_ff		<= lookup_src_vlan;
		lookup_src_vlan_ff2		<= lookup_src_vlan_ff;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Readout logic

	integer i;

	reg		hit_comb	= 0;

	always @(posedge clk) begin

		lookup_hit		<= 0;
		lookup_dst_port	<= 0;

		hit_comb		= 0;

		//Print status when a new packet arrives.
		//Nothing else to do at this point, we have to wait 2 clocks for the RAM to give us data
		if(lookup_en) begin
			$display("[%t] Packet on interface %d, vlan %d, from %x:%x:%x:%x:%x:%x to %x:%x:%x:%x:%x:%x",
				$time(),
				lookup_src_port,
				lookup_src_vlan,
				lookup_src_mac[47:40], lookup_src_mac[39:32], lookup_src_mac[31:24], lookup_src_mac[23:16], lookup_src_mac[15:8], lookup_src_mac[7:0],
				lookup_dst_mac[47:40], lookup_dst_mac[39:32], lookup_dst_mac[31:24], lookup_dst_mac[23:16], lookup_dst_mac[15:8], lookup_dst_mac[7:0]
			);
		end

		//When a lookup completes, check if any set has a hit.
		//We should never have >1 hit but if we do, use the highest numbered set.
		if(lookup_en_ff2) begin

			for(i=0; i<ASSOC_WAYS; i=i+1) begin

				//Row valid plus vlan/mac match?
				if( lookup_rdata[i][INDEX_VALID] &&
					(lookup_rdata[i][INDEX_VLAN +: 12] == lookup_src_vlan_ff2) &&
					(lookup_rdata[i][INDEX_MAC +: 48] == lookup_dst_mac_ff2) ) begin

					//It's a hit! Report the target
					hit_comb			= 1;
					lookup_hit			<= 1;
					lookup_dst_port		<= lookup_rdata[i][INDEX_PORT +: 5];
					$display("[%t] Hit - Destination %x:%x:%x:%x:%x:%x in vlan %d is on port %d",
						$time(),
						lookup_dst_mac_ff2[47:40], lookup_dst_mac_ff2[39:32], lookup_dst_mac_ff2[31:24], lookup_dst_mac_ff2[23:16], lookup_dst_mac_ff2[15:8], lookup_dst_mac_ff2[7:0],
						lookup_src_vlan_ff2,
						lookup_rdata[i][INDEX_PORT +: 5]
					);

					//TODO: If this address needs to have the GC mark bit set, do that
					if(!lookup_rdata[i][INDEX_GC]) begin
						$display("             Need to set GC mark");
					end

				end

				/*
				else begin
					$display("             Lookup slot %d doesn't match: valid=%d, vlan=%d, mac=%x:%x:%x:%x:%x:%x",
						i,
						lookup_rdata[i][INDEX_VALID],
						lookup_rdata[i][INDEX_VLAN +: 12],
						lookup_rdata[i][INDEX_MAC + 40 +: 8],
						lookup_rdata[i][INDEX_MAC + 32 +: 8],
						lookup_rdata[i][INDEX_MAC + 24 +: 8],
						lookup_rdata[i][INDEX_MAC + 16 +: 8],
						lookup_rdata[i][INDEX_MAC + 8 +: 8],
						lookup_rdata[i][INDEX_MAC + 0 +: 8]);
				end
				*/

			end

			//No hit in any cache set
			if(!hit_comb) begin
				$display("[%t] Miss - Destination %x:%x:%x:%x:%x:%x in vlan %d is not in table",
					$time(),
					lookup_dst_mac_ff2[47:40], lookup_dst_mac_ff2[39:32], lookup_dst_mac_ff2[31:24], lookup_dst_mac_ff2[23:16], lookup_dst_mac_ff2[15:8], lookup_dst_mac_ff2[7:0],
					lookup_src_vlan_ff2
				);
			end

		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Arbitration for address learning and management traffic

	/*
		Prioritization (highest to lowest precedence):
			1) Looking up addresses to be learned
			2) Writing learned addresses to the table
			3) Garbage collection
			4) Interactive UI
	 */

	reg					pend_wr_en		= 0;
	reg[66:0]			pend_wr_data	= 0;
	reg[ROW_BITS-1:0]	pend_wr_addr	= 0;
	reg					pend_wr_done	= 0;

	reg					pend_wr_done_fwd	= 0;

	always @(*) begin

		//Default to not doing anything
		learn_en			<= 0;
		learn_wr			<= 0;
		learn_addr			<= 0;
		learn_wdata			<= 0;
		pend_wr_done_fwd	<= 0;

		//If an incoming packet is arriving, look up the source
		if(lookup_en) begin
			learn_en		<= 1;
			learn_wr		<= 0;
			learn_addr		<= lookup_src_index;
		end

		//Write pending data to the table
		else if(pend_wr_en && !pend_wr_done) begin
			learn_en			<= 1;
			learn_wr[pend_col]	<= 1;
			learn_addr			<= pend_wr_addr;
			learn_wdata			<= pend_wr_data;
			pend_wr_done_fwd	<= 1;
		end

	end

	always @(posedge clk) begin
		pend_wr_done			<= pend_wr_done_fwd;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Set of addresses that need to be learned but haven't yet been pushed to the table

	//The pending queue
	reg[PENDING_SIZE-1:0]	pending_valid	= 0;
	reg[47:0]				pending_addr[PENDING_SIZE-1:0];
	reg[11:0]				pending_vlan[PENDING_SIZE-1:0];
	reg[4:0]				pending_port[PENDING_SIZE-1:0];
	reg[ASSOC_BITS-1:0]		pending_col[PENDING_SIZE-1:0];

	//New data being added to the pending queue
	reg					need_to_learn	= 0;
	reg[47:0]			pend_addr		= 0;
	reg[11:0]			pend_vlan		= 0;
	reg[4:0]			pend_port		= 0;
	reg[ASSOC_BITS-1:0]	pend_col		= 0;

	//Clear completed entries once written to memory
	reg					pend_clear		= 0;
	localparam			PEND_BITS		= clog2(PENDING_SIZE);
	reg[PEND_BITS-1:0]	pend_clear_slot	= 0;

	//Wipe the table
	initial begin
		for(i=0; i<PENDING_SIZE; i=i+1) begin
			pending_addr[i]	<= 0;
			pending_vlan[i]	<= 0;
			pending_port[i]	<= 0;
			pending_col[i] <= 0;
		end
	end

	//Add new entries to the table, avoiding duplication
	//TODO: this should probably be refactored into a standalone module?
	reg					already_pending	= 0;
	reg					found_opening	= 0;
	always @(posedge clk) begin

		already_pending	= 0;
		found_opening	= 0;

		if(need_to_learn) begin
			$display("[%t] Need to learn -  Source %x:%x:%x:%x:%x:%x in vlan %d (from port %d) is not in table, adding at column %d",
					$time(),
					pend_addr[47:40], pend_addr[39:32], pend_addr[31:24], pend_addr[23:16], pend_addr[15:8], pend_addr[7:0],
					pend_vlan,
					pend_port,
					pend_col
				);

			//Iterate over table entries and see if it's already in the learn queue
			for(i=0; i<PENDING_SIZE; i=i+1) begin

				//Already pending, no action required
				if(pending_valid[i] &&
					(pending_addr[i] == pend_addr) &&
					(pending_vlan[i] == pend_vlan) &&
					(pending_port[i] == pend_port)
				) begin
					$display("             Already in pending set");
					already_pending	= 1;
				end

			end

			//Not in the learn queue. Find the first free spot in the set and insert it
			if(!already_pending) begin
				for(i=0; i<PENDING_SIZE; i=i+1) begin

					//Stop if we already did the insert
					if(found_opening) begin
					end

					//Insert when we find a free spot
					else if(!pending_valid[i]) begin
						pending_valid[i]	<= 1;
						pending_vlan[i]		<= pend_vlan;
						pending_port[i]		<= pend_port;
						pending_addr[i]		<= pend_addr;
						pending_col[i]		<= pend_col;
						found_opening		= 1;
						$display("             Added to pending set (slot %d)", i[7:0]);
					end

				end
			end

		end

		//Once we've written a pending item to the table, remove it from the queue
		if(pend_clear) begin
			pending_valid[pend_clear_slot]	<= 0;

			$display("             Clearing slot %d of pending set", pend_clear_slot);
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Check if the source address is already learned. If not, add to the learning queue

	reg					learned_comb 	= 0;

	always @(posedge clk) begin

		need_to_learn	<= 0;
		bump_set		<= 0;

		if(lookup_en_ff2) begin

			learned_comb	= 0;

			for(i=0; i<ASSOC_WAYS; i=i+1) begin

				//Row valid plus vlan/mac match? All good
				if( learn_rdata[i][INDEX_VALID] &&
					(learn_rdata[i][INDEX_VLAN +: 12] == lookup_src_vlan_ff2) &&
					(learn_rdata[i][INDEX_MAC +: 48] == lookup_src_mac_ff2) ) begin

					//It's a hit! Report the target
					learned_comb		= 1;
					$display("[%t] OK - Source %x:%x:%x:%x:%x:%x in vlan %d is on port %d",
						$time(),
						lookup_src_mac_ff2[47:40], lookup_src_mac_ff2[39:32], lookup_src_mac_ff2[31:24], lookup_src_mac_ff2[23:16], lookup_src_mac_ff2[15:8], lookup_src_mac_ff2[7:0],
						lookup_src_vlan_ff2,
						learn_rdata[i][INDEX_PORT +: 5]
					);


					//TODO: handle this situation
					if(learn_rdata[i][INDEX_PORT +: 5] != lookup_src_port_ff2) begin
						$display("FIXME: Host appears to have jumped to another port, this isn't implemented yet");
					end

				end

			end

			//No hit in any cache set
			if(!learned_comb) begin
				need_to_learn	<= 1;
				pend_addr		<= lookup_src_mac_ff2;
				pend_vlan		<= lookup_src_vlan_ff2;
				pend_port		<= lookup_src_port_ff2;

				pend_col		<= cache_set;
				bump_set		<= 1;
			end

		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Pop data from the pending set and push it into the table proper

	reg	found_slot		= 0;

	//Clear slots out combinatorially
	always @(*) begin
		pend_clear	<= pend_wr_done;
	end

	always @(posedge clk) begin

		pend_wr_data	<= 0;
		pend_wr_addr	<= 0;

		found_slot		= 0;

		if(pend_wr_done)
			pend_wr_en	<= 0;

		//If we don't have another write in progress, go look for a free table slot and write it
		if(!pend_wr_en || pend_wr_done) begin

			for(i=0; i<PENDING_SIZE; i=i+1) begin

				//If we're in the process of clearing this slot, don't look at it
				if(pend_clear && (pend_clear_slot == i)) begin
				end

				//This slot is eligible to be looked at
				else if(pending_valid[i] && !found_slot) begin
					found_slot		= 1;

					pend_clear_slot	<= i;

					pend_wr_en		<= 1;
					pend_wr_data	<= {1'b1, 1'b1, pending_vlan[i], pending_port[i], pending_addr[i]};
					pend_wr_addr	<=
						pending_addr[i][47:32] ^ pending_addr[i][31:16] ^ pending_addr[i][15:0] ^ pending_vlan[i];

					$display("[%t] Learning address %x:%x:%x:%x:%x:%x in vlan %d (from port %d) at column %d",
						$time(),
						pending_addr[i][47:40], pending_addr[i][39:32], pending_addr[i][31:24], pending_addr[i][23:16], pending_addr[i][15:8], pending_addr[i][7:0],
						pending_vlan[i],
						pending_port[i],
						pending_col[i]
					);
				end
			end

		end

	end

endmodule
