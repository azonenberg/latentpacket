/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2019 Andrew D. Zonenberg                                                                               *
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
	@brief Top level module for the INTEGRALSTICK FPGA.

	Protocol description:
 */
module top(
	input wire			clk_25mhz,

	input wire			uart_rxd,	//DCMI_D7
	output wire			uart_txd,	//DCMI_D6

	output logic[3:0]	led	= 0
	);

	wire[7:0]	rx_data;
	wire		rx_en;

	logic[7:0]	tx_data		= 0;
	logic		tx_en		= 0;

	UART uart(
		.clk(clk_25mhz),
		.clkdiv(16'd217),

		.rx(uart_rxd),
		.rxactive(),
		.rx_data(rx_data),
		.rx_en(rx_en),

		.tx(uart_txd),
		.tx_data(tx_data),
		.tx_en(tx_en),
		.txactive()
	);

	//blinky
	logic[15:0] count = 0;
	always_ff @(posedge clk_25mhz) begin
		count <= count + 1;
		if(count == 0)
			led <= led + 1;
	end

	//If we get 0xAA, send 0x69
	//If we get anything else, send 0x41
	always_ff @(posedge clk_25mhz) begin
		tx_data	<= 0;
		tx_en	<= 0;

		if(rx_en) begin
			if(rx_data == 8'haa)
				tx_data	<= 8'h69;
			else
				tx_data	<= 8'h41;

			tx_en	<= 1;
		end
	end

endmodule
