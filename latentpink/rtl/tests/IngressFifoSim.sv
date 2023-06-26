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
	@brief Testbench for IngressFifo
 */
module IngressFifoSim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clock generation

	logic	rx_clk = 0;		//125 MHz
	logic	clk_mem = 0;	//187.5 MHz

	always begin
		#4;
		rx_clk = !rx_clk;
	end

	always begin
		#2.666;
		clk_mem = !clk_mem;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The DUT

	wire[14:0]			port_rx_clk;
	logic[14:0]			port_link_up	= 0;
	EthernetRxBus[14:0]	port_rx_bus		= 0;

	wire		ram_wr_en;
	wire[17:0]	ram_wr_addr;
	wire[143:0]	ram_wr_data;

	IngressFifo dut(
		.port_rx_clk(port_rx_clk),
		.port_link_up(port_link_up),
		.port_rx_bus(port_rx_bus),

		.clk_ram_ctl(clk_mem),
		.ram_wr_en(ram_wr_en),
		.ram_wr_addr(ram_wr_addr),
		.ram_wr_data(ram_wr_data)
	);

	for(genvar g=0; g<15; g=g+1) begin
		assign port_rx_clk[g] = rx_clk;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test logic

	logic[7:0] state = 0;
	logic[15:0] count = 0;

	always_ff @(posedge rx_clk) begin

		port_rx_bus	<= 0;

		case(state)

			//Bring up all links
			0: begin
				port_link_up	<= 15'h7fff;
				state			<= 1;
			end

			1: begin
				count	<= count + 1;
				if(count == 'h5)
					state <= 3;
			end

			//state 2 not used currently

			//Send a dummy frame to a random interface
			3: begin
				port_rx_bus[3].start	<= 1;
				state					<= 4;
			end

			4: begin
				port_rx_bus[3].data_valid	<= 1;
				port_rx_bus[3].bytes_valid	<= 4;
				port_rx_bus[3].data			<= 32'hfeedface;
				state						<= 5;

				//Start another frame on a different port
				port_rx_bus[2].start		<= 1;
			end

			5: begin
				port_rx_bus[3].data_valid	<= 1;
				port_rx_bus[3].bytes_valid	<= 4;
				port_rx_bus[3].data			<= 32'hdeadbeef;

				port_rx_bus[2].data_valid	<= 1;
				port_rx_bus[2].bytes_valid	<= 4;
				port_rx_bus[2].data			<= 32'h11111111;

				state						<= 6;
			end

			6: begin
				port_rx_bus[3].data_valid	<= 1;
				port_rx_bus[3].bytes_valid	<= 4;
				port_rx_bus[3].data			<= 32'hcafef00d;

				port_rx_bus[2].data_valid	<= 1;
				port_rx_bus[2].bytes_valid	<= 4;
				port_rx_bus[2].data			<= 32'h22222222;

				state						<= 7;
			end

			7: begin
				port_rx_bus[3].data_valid	<= 1;
				port_rx_bus[3].bytes_valid	<= 4;
				port_rx_bus[3].data			<= 32'hbaadc0de;

				port_rx_bus[2].data_valid	<= 1;
				port_rx_bus[2].bytes_valid	<= 4;
				port_rx_bus[2].data			<= 32'h33333333;

				state						<= 8;
			end

			8: begin
				port_rx_bus[3].data_valid	<= 1;
				port_rx_bus[3].bytes_valid	<= 3;
				port_rx_bus[3].data			<= 32'h41414100;

				port_rx_bus[2].data_valid	<= 1;
				port_rx_bus[2].bytes_valid	<= 4;
				port_rx_bus[2].data			<= 32'h44444444;

				state						<= 9;
			end

			9: begin
				port_rx_bus[3].commit		<= 1;

				port_rx_bus[2].data_valid	<= 1;
				port_rx_bus[2].bytes_valid	<= 4;
				port_rx_bus[2].data			<= 32'h55555555;

				state						<= 10;
			end

			10: begin
				port_rx_bus[2].data_valid	<= 1;
				port_rx_bus[2].bytes_valid	<= 4;
				port_rx_bus[2].data			<= 32'h66666666;
				state						<= 11;

			end

			11: begin
				port_rx_bus[2].data_valid	<= 1;
				port_rx_bus[2].bytes_valid	<= 4;
				port_rx_bus[2].data			<= 32'h77777777;

				state						<= 12;
			end

			12: begin
				port_rx_bus[2].data_valid	<= 1;
				port_rx_bus[2].bytes_valid	<= 4;
				port_rx_bus[2].data			<= 32'h88888888;

				state						<= 13;
			end

			13: begin
				port_rx_bus[2].commit		<= 1;
				state						<= 14;
			end

			14: begin
			end

		endcase

	end

endmodule
