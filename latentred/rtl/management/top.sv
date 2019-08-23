`timescale 1ns/1ps
`default_nettype none
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
	@brief Top level module for the INTEGRALSTICK FPGA on the LATENTRED management board.
 */
module top(
	input wire			clk_25mhz,

	input wire			uart_rxd,
	output wire			uart_txd,

	input wire			ltc_vtemp,

	output logic[3:0]	led	= 0
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The UART to the STM32

	wire[7:0]	rx_data;
	wire		rx_en;

	wire[7:0]	tx_data;
	wire		tx_en;
	wire		tx_done;

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
		.txactive(),
		.tx_done(tx_done)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// On-die sensor packages

	wire[15:0] die_temp;
	wire[15:0] volt_core;
	wire[15:0] volt_ram;
	wire[15:0] volt_aux;
	wire[191:0]	ext_in;

	OnDieSensors_7series #(
		.EXT_IN_ENABLE(16'h0001)
	) sensors(
		.clk(clk_25mhz),
		.vin_p({15'hz, ltc_vtemp}),
		.vin_n(16'hz),
		.die_temp(die_temp),
		.volt_core(volt_core),
		.volt_ram(volt_ram),
		.volt_aux(volt_aux),
		.ext_in(ext_in)
	);

	wire[63:0]	die_serial;
	wire[31:0]	idcode;

	DeviceInfo_7series info(
		.clk(clk_25mhz),
		.die_serial(die_serial),
		.idcode(idcode)
		);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// TODO: MDIO/reset/sensor logic

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Control stuff for the management engine

	ManagementController ctrl(
		.clk(clk_25mhz),

		.uart_rx_data(rx_data),
		.uart_rx_en(rx_en),
		.uart_tx_data(tx_data),
		.uart_tx_en(tx_en),
		.uart_tx_done(tx_done),

		.die_temp(die_temp),
		.volt_core(volt_core),
		.volt_ram(volt_ram),
		.volt_aux(volt_aux),
		.die_serial(die_serial),
		.idcode(idcode),
		.psu_temp(ext_in[11:0])
	);

endmodule
