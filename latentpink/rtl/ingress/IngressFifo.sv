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
`include "IngressPortState.svh"

/**
	@file
	@author Andrew D. Zonenberg
	@brief Input FIFO block, writes data from each of the inbound switch ports to QDR-II+

	With a 36 Mbit SRAM (32 Mbit after FEC overhead) and 15 ports (round to 16 to keep addressing simple),
	we have 2 Mbits per port of buffer.

	This is 256 kB or 16K (0x4000) 128-bit data blocks, and we need 14 pointer bits per port
 */
module IngressFifo #(
	parameter NUM_PORTS			= 15,
	parameter PORT_FIFO_SIZE	= 'h4000,
	parameter META_FIFO_SIZE 	= 4096,

	localparam META_FIFO_BITS	= $clog2(META_FIFO_SIZE),
	localparam PTR_BITS			= $clog2(PORT_FIFO_SIZE),
	localparam PORT_BITS		= $clog2(NUM_PORTS),
	localparam ADDR_BITS		= PTR_BITS + PORT_BITS
)(
	//Inbound data from network ports
	input wire[NUM_PORTS-1:0]				port_rx_clk,
	input wire[NUM_PORTS-1:0]				port_link_up,
	input wire EthernetRxBus[NUM_PORTS-1:0]	port_rx_bus,

	//Port configuration (rx_clk domain)
	input wire vlan_t[NUM_PORTS-1:0]		port_vlan,
	input wire[NUM_PORTS-1:0]				tagged_allowed,
	input wire[NUM_PORTS-1:0]				untagged_allowed,

	//RAM interface
	input wire								clk_ram_ctl,
	output wire								ram_wr_en,
	output logic[ADDR_BITS-1:0]				ram_wr_addr	= 0,
	output wire[143:0]						ram_wr_data,

	output logic							ram_rd_en	= 0,
	output logic[ADDR_BITS-1:0]				ram_rd_addr	= 0,
	input wire								ram_rd_valid,
	input wire[143:0]						ram_rd_data,

	//Outbound bus to rest of switch fabric
	output inportstate_t[NUM_PORTS-1:0]		fabric_state		= 0,
	input wire[NUM_PORTS-1:0]				forward_en,
	output logic							frame_valid			= 0,
	output logic							frame_last			= 0,
	output wire[127:0]						frame_data
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// FEC decode on QDR-II+ read data

	wire		fec_rd_valid;
	wire[127:0]	fec_rd_data;

	wire[1:0]	fec_correctable_err;
	wire[1:0]	fec_uncorrectable_err;

	HammingDecoder #(
		.DATA_BITS(64)
	) decc_hi (
		.clk(clk_ram_ctl),

		.valid_in(ram_rd_valid),
		.data_in(ram_rd_data[143:72]),

		.valid_out(fec_rd_valid),
		.data_out(fec_rd_data[127:64]),
		.correctable_err(fec_correctable_err[1]),
		.uncorrectable_err(fec_uncorrectable_err[1])
	);

	HammingDecoder #(
		.DATA_BITS(64)
	) decc_lo (
		.clk(clk_ram_ctl),

		.valid_in(ram_rd_valid),
		.data_in(ram_rd_data[71:0]),

		.valid_out(),		//redundant, fec_rd_valid driven by high lane
		.data_out(fec_rd_data[63:0]),
		.correctable_err(fec_correctable_err[0]),
		.uncorrectable_err(fec_uncorrectable_err[0])
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Expand data to 128 bit width and move into SRAM clock domain

	logic[NUM_PORTS-1:0]	port_frame_start	= 0;
	wire					port_frame_ready[NUM_PORTS-1:0];
	wire[10:0]				port_frame_bytelen[NUM_PORTS-1:0];
	wire					port_mem_valid[NUM_PORTS-1:0];
	wire[127:0]				port_mem_data[NUM_PORTS-1:0];
	vlan_t					port_mem_vlan[NUM_PORTS-1:0];
	wire					port_frame_done[NUM_PORTS-1:0];

	for(genvar g=0; g<NUM_PORTS; g=g+1) begin : cdcs
		IngressCDC cdc(
			.rx_clk(port_rx_clk[g]),
			.link_up(port_link_up[g]),
			.rx_bus(port_rx_bus[g]),

			.port_vlan(port_vlan[g]),
			.tagged_allowed(tagged_allowed[g]),
			.untagged_allowed(untagged_allowed[g]),

			.clk_mem(clk_ram_ctl),
			.mem_frame_ready(port_frame_ready[g]),
			.mem_frame_bytelen(port_frame_bytelen[g]),
			.mem_valid(port_mem_valid[g]),
			.mem_data(port_mem_data[g]),
			.mem_frame_done(port_frame_done[g]),
			.mem_frame_vlan(port_mem_vlan[g]),
			.mem_frame_start(port_frame_start[g])
		);
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Arbitration / muxing to single data stream

	//Figure out which port we want to pop from if we were to start a new frame right now
	logic[PORT_BITS-1:0]	rr_port	= 0;
	logic[PORT_BITS-1:0]	next_port;
	logic					next_port_valid;
	wire[NUM_PORTS-1:0]		metafifo_full;

	always_ff @(posedge clk_ram_ctl) begin

		next_port		= 0;
		next_port_valid	= 0;

		//If round robin port wants to send, let it
		if(port_frame_ready[rr_port]) begin
			next_port 		= rr_port;
			next_port_valid	= 1;
		end

		//Nope. Search ports from highest to lowest number
		//(by convention, 10G ports are highest numbered so they get max priority)
		//and pick the first one that has something for us
		else begin
			for(integer i=NUM_PORTS-1; i>=0; i=i-1) begin
				if(port_frame_ready[i] && !next_port_valid) begin
					next_port		= i;
					next_port_valid = 1;
				end
			end
		end

		//TODO: need to check if the dest port has filled up
		//Cannot send if there's not a frame worth of free space in the SRAM
		//(this might corrupt an existing frame etc)
		//TODO: also check if metadata FIFO is full

	end

	logic					fec_wr_en	= 0;
	logic[127:0]			fec_wr_data	= 0;
	logic[127:0]			fec_wr_data_fwd;

	logic					busy 			= 0;
	logic[PORT_BITS-1:0]	current_port	= 0;

	/*
		Fabric for LATENTPINK is exactly full bandwidth so we need to be able to pop frames
		back to back with no gaps.

		Do control logic combinatorially to avoid a cycle of round trip delay
	 */
	always_comb begin
		port_frame_start	= 0;

		fec_wr_data_fwd		= port_mem_data[current_port];

		//See if a new frame is ready to start
		if(next_port_valid) begin

			//If so, start if we're idle or finishing this clock
			if(!busy || port_frame_done[current_port]) begin
				port_frame_start[next_port]	= 1;
				fec_wr_data_fwd				= port_mem_data[next_port];
			end
		end

	end

	logic[PORT_BITS-1:0]	fec_wr_port		= 0;

	always_ff @(posedge clk_ram_ctl) begin

		//Finish the current frame
		if(port_frame_done[current_port])
			busy			<= 0;

		//Start a new frame
		if(port_frame_start) begin
			busy			<= 1;
			rr_port			<= rr_port + 1;

			//Port becomes current immediately, since we already have frame data ready to forward
			current_port	= next_port;
		end

		//Forward frame data
		fec_wr_en		<= port_mem_valid[current_port];
		fec_wr_data		<= fec_wr_data_fwd;
		fec_wr_port		<= current_port;

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// FEC encoding

	HammingEncoder #(
		.DATA_BITS(64)
	) ecc_hi (
		.clk(clk_ram_ctl),

		.valid_in(fec_wr_en),
		.data_in(fec_wr_data[127:64]),

		.valid_out(ram_wr_en),
		.data_out(ram_wr_data[143:72])
	);

	HammingEncoder #(
		.DATA_BITS(64)
	) ecc_lo (
		.clk(clk_ram_ctl),

		.valid_in(fec_wr_en),
		.data_in(fec_wr_data[63:0]),

		.valid_out(),	//redundant, ram_wr_en driven by high lane
		.data_out(ram_wr_data[71:0])
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SRAM write address generation

	logic[PTR_BITS-1:0] fifo_wr_ptr[NUM_PORTS-1:0];

	initial begin
		for(integer i=0; i<NUM_PORTS; i=i+1) begin
			fifo_wr_ptr[i] = 0;
		end
	end

	always_ff @(posedge clk_ram_ctl) begin

		//FEC has single cycle latency, so generate address any time data arrives at the FEC input
		if(fec_wr_en) begin
			ram_wr_addr[PTR_BITS +: PORT_BITS]	<= fec_wr_port;
			ram_wr_addr[0 +: PTR_BITS]			<= fifo_wr_ptr[fec_wr_port];

			fifo_wr_ptr[fec_wr_port]			<= fifo_wr_ptr[fec_wr_port] + 1'h1;
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Metadata FIFO

	//12 bit vlan + 11 bit length = 23 bits total content
	typedef struct packed
	{
		vlan_t		src_vlan;
		logic[10:0]	len;
	} packetmeta_t;

	wire[NUM_PORTS-1:0]			metafifo_empty;
	logic[NUM_PORTS-1:0]		metafifo_empty_ff = {NUM_PORTS{1'b1}};
	logic[NUM_PORTS-1:0]		metafifo_rd	= 0;
	packetmeta_t[NUM_PORTS-1:0]	metafifo_rdata;

	/*
		Three BRAMs, 4K x 9 = 27 bits wide x 4K deep

		Packet buffer is 16K x 128 so it maxes out at 16K min sized packets or 1365 max sized

		Three BRAMs is 4K packets, so we can max the data buffer with packets down to 512 byte size.
		If packets are smaller, we're metadata bound.

		Three BRAMs per port * 15 ports = 45 BRAMs.
		This is 1.5 clock regions worth of BRAM.
		Should fit comfortably around the SRAM controller area of the 7k160t since that doesn't use any BRAM
	 */
	for(genvar g=0; g<NUM_PORTS; g=g+1) begin : metafifo

		packetmeta_t wdata;
		assign wdata.src_vlan	= port_mem_vlan[g];
		assign wdata.len		= port_frame_bytelen[g];

		//Add extra cycle of pipeline latency here because metadata is used on timing critical control paths
		SingleClockFifo #(
			.WIDTH($bits(packetmeta_t)),
			.DEPTH(META_FIFO_SIZE),
			.USE_BLOCK(1),
			.OUT_REG(2)
		 ) fifo (
			.clk(clk_ram_ctl),
			.wr(port_frame_done[g]),
			.din(wdata),
			.rd(metafifo_rd[g]),
			.dout(metafifo_rdata[g]),
			.overflow(),
			.underflow(),
			.empty(metafifo_empty[g]),
			.full(metafifo_full[g]),
			.rsize(),
			.wsize(),
			.reset()
		 );

	end

	//Pipeline empty flag to improve timing performance
	//We check for empty in PORT_STATE_IDLE, then go through PREFETCH and PREFETCH_WAIT
	//before any chance of coming back to IDLE. So an extra cycle of latency is totally fine
	always_ff @(posedge clk_ram_ctl) begin
		metafifo_empty_ff	<= metafifo_empty;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// QDR read tracking

	wire[PORT_BITS-1:0]	ram_rd_port;

	SingleClockFifo #(
		.WIDTH(PORT_BITS),
		.DEPTH(32),
		.USE_BLOCK(0),
		.OUT_REG(0)
	) tagfifo (
		.clk(clk_ram_ctl),
		.wr(ram_rd_en),
		.din(ram_rd_addr[ADDR_BITS-1 : PTR_BITS]),
		.rd(ram_rd_valid),
		.dout(ram_rd_port),
		.overflow(),
		.underflow(),
		.empty(),
		.full(),
		.rsize(),
		.wsize(),
		.reset()
	);

	//Pipeline one cycle so we have the port ID aligned with ECC decoded data
	logic[PORT_BITS-1:0] fec_rd_port = 0;
	always_ff @(posedge clk_ram_ctl) begin
		fec_rd_port	<= ram_rd_port;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Prefetch buffer

	//Number of 128-bit words to prefetch from QDR before getting the "forward" signal for the frame
	//Must equal or exceed SRAM clock rate (187.5 MHz) * SRAM read latency (estimated ~80ns), so minimum of 16
	//We can fit up to 32 in a single BRAM without increasing area, but this will harm latency.
	//TODO: can we reduce SRAM read latency with a better CDC FIFO in the QDR?
	localparam PREFETCH_DEPTH		= 32;
	localparam PREFETCH_BITS		= $clog2(PREFETCH_DEPTH);
	localparam NUM_PORTS_ROUNDED	= 2 ** PORT_BITS;

	logic					prefetch_rd_en		= 0;
	logic[PORT_BITS-1:0]	prefetch_rd_channel	= 0;

	SingleClockMultiplexedFifo #(
		.WIDTH(128),
		.DEPTH(PREFETCH_DEPTH),
		.CHANNELS(NUM_PORTS_ROUNDED),
		.USE_BLOCK(1)
	) prefetch_fifo (
		.clk(clk_ram_ctl),

		//write anything coming out of the RAM to it for now
		.wr(fec_rd_valid),
		.wr_channel(fec_rd_port),
		.wr_data(fec_rd_data),

		.rd(prefetch_rd_en),
		.rd_channel(prefetch_rd_channel),
		.rd_data(frame_data),

		.overflow(),
		.underflow(),

		.empty(),
		.full(),

		.reset(1'b0)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Readout logic

	logic[PTR_BITS-1:0] 		fifo_rd_ptr[NUM_PORTS-1:0];
	logic[NUM_PORTS-1:0]		metafifo_rd_ff		= 0;
	logic[NUM_PORTS-1:0]		metafifo_rd_valid	= 0;

	initial begin
		for(integer i=0; i<NUM_PORTS; i=i+1) begin
			fifo_rd_ptr[i] = 0;
		end
	end

	typedef enum logic[3:0]
	{
		PORT_STATE_INIT,			//first clock out of reset
		PORT_STATE_IDLE,			//nothing going on
		PORT_STATE_PREFETCH,		//data words being prefetched
		PORT_STATE_PREFETCH_WAIT,	//wait for MAC address to be prefetched
		PORT_STATE_READY,			//ready to start forwarding
		PORT_STATE_FORWARD,			//forwarding now
		PORT_STATE_LAST				//forwarding last frame
	} portstate_t;

	portstate_t[NUM_PORTS-1:0]	portstates;
	logic[6:0]					prefetch_count[NUM_PORTS-1:0];		//number of words requested from QDR so far
	logic[6:0]					prefetch_rcount[NUM_PORTS-1:0];		//number of words received from QDR so far
	logic[6:0]					prefetch_wordlen[NUM_PORTS-1:0];	//total length of frame in words
	logic[PREFETCH_BITS-1:0]	prefetch_target[NUM_PORTS-1:0];		//number of words to prefetch
	logic[NUM_PORTS-1:0]		mac_pending	= 0;

	initial begin
		for(integer i=0; i<NUM_PORTS; i=i+1) begin
			portstates[i]		= PORT_STATE_INIT;
			prefetch_count[i]	= 0;
			prefetch_rcount[i]	= 0;
			prefetch_target[i]	= 0;
			prefetch_wordlen[i]	= 0;
		end
	end

	logic[6:0]					popcount	= 0;

	always_ff @(posedge clk_ram_ctl) begin

		//Pipeline two cycle read latency for metadata FIFO to improve setup timing
		metafifo_rd			<= 0;
		metafifo_rd_ff		<= metafifo_rd;
		metafifo_rd_valid	<= metafifo_rd_ff;

		prefetch_rd_en		<= 0;

		ram_rd_en			= 0;
		ram_rd_addr			<= 0;
		frame_last			<= 0;

		//Output data is valid one cycle after we read from the prefetch buffer
		frame_valid			<= prefetch_rd_en;

		//Save frame dest MAC addresses
		if(fec_rd_valid && (mac_pending[fec_rd_port]) ) begin
			mac_pending[fec_rd_port]			<= 0;
			fabric_state[fec_rd_port].dst_mac	<= fec_rd_data[127:80];
			fabric_state[fec_rd_port].src_mac	<= fec_rd_data[79:32];
		end

		//Keep track of how much data came back from the QDR
		if(fec_rd_valid)
			prefetch_rcount[fec_rd_port]		<= prefetch_rcount[fec_rd_port] + 1'h1;

		if(prefetch_rd_en)
			popcount							<= popcount + 1;

		for(integer i=0; i<NUM_PORTS; i=i+1) begin

			//Process metadata FIFO content
			if(metafifo_rd_valid[i]) begin
				fabric_state[i].src_vlan		<= metafifo_rdata[i].src_vlan;
				fabric_state[i].bytelen			<= metafifo_rdata[i].len;

				//Calculate frame length in words (rounded up)
				prefetch_wordlen[i]				= metafifo_rdata[i].len[10:4];
				if(metafifo_rdata[i].len[3:0])
					prefetch_wordlen[i]			= prefetch_wordlen[i] + 1;

				//Clamp to max prefetch FIFO depth
				if(prefetch_wordlen[i] > PREFETCH_DEPTH)
					prefetch_target[i]			<= PREFETCH_DEPTH - 1;
				else
					prefetch_target[i]			<= prefetch_wordlen[i] - 1;


			end

			case(portstates[i])

				PORT_STATE_INIT: begin
					portstates[i]							<= PORT_STATE_IDLE;
				end	//PORT_STATE_INIT

				//Wait for a frame to show up and be written to RAM
				PORT_STATE_IDLE: begin

					if(!metafifo_empty_ff[i] && !ram_rd_en) begin

						//Read the metadata fifo
						metafifo_rd[i]						<= 1;

						//Read the first word of the external SRAM FIFO
						ram_rd_en							= 1;

						ram_rd_addr[PTR_BITS +: PORT_BITS]	<= i;
						ram_rd_addr[0 +: PTR_BITS]			<= fifo_rd_ptr[i];
						fifo_rd_ptr[i]						<= fifo_rd_ptr[i] + 1'h1;

						portstates[i]						<= PORT_STATE_PREFETCH;
						prefetch_count[i]					<= 1;
						prefetch_rcount[i]					<= 0;
						mac_pending[i]						<= 1;

					end

				end	//PORT_STATE_IDLE

				//Prefetch the first PREFETCH_DEPTH words
				PORT_STATE_PREFETCH: begin
					if(!ram_rd_en) begin

						ram_rd_en							= 1;

						ram_rd_addr[PTR_BITS +: PORT_BITS]	<= i;
						ram_rd_addr[0 +: PTR_BITS]			<= fifo_rd_ptr[i];
						fifo_rd_ptr[i]						<= fifo_rd_ptr[i] + 1'h1;

						prefetch_count[i]					<= prefetch_count[i] + 1'h1;

						//Stop if we've prefetched the entire frame, or PREFETCH_DEPTH words
						if(prefetch_count[i] == prefetch_target[i])
							portstates[i]				<= PORT_STATE_PREFETCH_WAIT;
					end
				end	//PORT_STATE_PREFETCH

				//Wait until all data we requested has been fully prefetched
				PORT_STATE_PREFETCH_WAIT: begin
					if(!mac_pending[i] && (prefetch_count[i] == prefetch_rcount[i])) begin
						fabric_state[i].ready		<= 1;
						portstates[i]				<= PORT_STATE_READY;
					end
				end	//PORT_STATE_MAC_WAIT

				//Wait for forwarding request
				PORT_STATE_READY: begin

					//Start forwarding frame data
					//This can only happen for a single port at a time, so we can use shared counters etc
					if(forward_en[i]) begin

						//TODO: Start prefetching more data so it'll be ready when we've emptied the prefetch buffer

						//Clear ready flag since forwarding has already started
						fabric_state[i].ready		<= 0;

						//Start popping the prefetch buffer
						prefetch_rd_en				<= 1;
						prefetch_rd_channel			<= i;

						//Now forwarding
						portstates[i]				<= PORT_STATE_FORWARD;
						popcount					<= 1;
					end

				end //PORT_STATE_READY

				//Forward the frame
				PORT_STATE_FORWARD: begin

					//TODO: continue prefetching more data if required

					//See if it's time to stop popping the FIFO
					if(popcount == (prefetch_wordlen[i] - 1))
						portstates[i]					<= PORT_STATE_LAST;

					//Continue forwarding prefetch data
					prefetch_rd_en					<= 1;

				end	//PORT_STATE_FORWARD

				PORT_STATE_LAST: begin
					frame_last							<= 1;
					portstates[i]						<= PORT_STATE_IDLE;
				end	//PORT_STATE_LAST

			endcase

		end	//port loop

	end


endmodule

