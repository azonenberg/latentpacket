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

`include "GmiiBus.svh"

/**
	@brief Control logic for running the SPI interface

	The protocol is master-slave command based. All commands begin with an 16-bit opcode but have arbitrary content
	past the opcode.

	All multi-byte fields, including the opcode, are little endian on the wire for easy handling by the STM32.
 */
module ManagementController(

	//Main management engine clock
	input wire			clk,

	//Link to the STM32
	output logic		spi_tx_data_valid	= 0,
	output logic[7:0]	spi_tx_data 		= 8'h0,
	input wire			spi_rx_data_valid,
	input wire[7:0]		spi_rx_data,
	input wire			spi_cs_falling,
	input wire			spi_cs_n,	//debug only

	//Status from management Ethernet PHY
	input wire			mgmt_up,
	input wire lspeed_t	mgmt_speed,

	//Sensor info
	input wire[63:0]	die_serial,
	input wire[31:0]	idcode,
	input wire[15:0]	die_temp,
	input wire[15:0]	volt_core,
	input wire[15:0]	volt_ram,
	input wire[15:0]	volt_aux,
	input wire[11:0]	psu_temp,
	input wire[15:0]	flash_mbits
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Opcode table

	typedef enum logic[15:0]
	{
		OP_NOP			= 16'h0000,	//Do nothing, no reply
		OP_ECHO			= 16'h0001,	//Do nothing, reply with 0x55

		OP_DEVICE_ID	= 16'h0002,	//no arguments, we respond with our 32-bit JTAG IDCODE
		OP_FPGA_SERIAL	= 16'h0003,	//no arguments, we respond with our DNA extended to 64 bits

		OP_DIE_TEMP		= 16'h0004,	//no arguments, we respond with die temperature in 8.8 fixed point degC
		OP_VOLT_CORE	= 16'h0005,	//no arguments, we respond with VCCINT value in 8.8 fixed point volts
		OP_VOLT_RAM		= 16'h0006,	//no arguments, we respond with VCCBRAM value in 8.8 fixed point volts
		OP_VOLT_AUX		= 16'h0007,	//no arguments, we respond with VCCAUX value in 8.8 fixed point volts
		OP_PSU_TEMP		= 16'h0008,	//no arguments, we respond with LTC3374 temperature as raw voltage reading
									//(FFF = 1V)
		OP_MGMT0_STAT	= 16'h0009,	//Get management interface link state
									//Bit 3 = link state
									//Bits 1:0 = link speed (0 = 10M, 1 = 100M, 2 = gig)
		OP_FLASH_SIZE	= 16'h000a,	//Return size of the SPI flash, in Mbits

		OP_COUNT					//number of legal opcodes, must be last

	} opcode_t;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Protocol logic

	enum logic[7:0]
	{
		STATE_IDLE		= 8'h00,
		STATE_OPCODE	= 8'h01,
		STATE_DISPATCH	= 8'h02,
		STATE_TX		= 8'h03
	} state	= STATE_IDLE;

	logic[15:0] opcode	= 0;

	logic[7:0] count = 0;

	always_ff @(posedge clk) begin

		spi_tx_data_valid	<= 0;

		//Reset state machine when CS# toggles
		if(spi_cs_falling)
			state		<= STATE_IDLE;

		case(state)

			////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// Wait for stuff to happen, then read headers

			STATE_IDLE: begin
				spi_tx_data			<= 0;

				if(spi_rx_data_valid) begin
					opcode[7:0]		<= spi_rx_data;
					state			<= STATE_OPCODE;
				end

			end	//end STATE_IDLE

			STATE_OPCODE: begin

				if(spi_rx_data_valid) begin
					opcode[15:8]	<= spi_rx_data;
					count			<= 0;
					state			<= STATE_DISPATCH;
				end

			end	//end STATE_OPCODE

			////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// Dispatch the inbound request. For simple stuff, reply right here.

			STATE_DISPATCH: begin

				state				<= STATE_TX;
				spi_tx_data_valid	<= 1;

				case(opcode)

					OP_NOP:
						state				<= STATE_IDLE;

					OP_ECHO: begin
						spi_tx_data			<= 8'h55;
						state				<= STATE_IDLE;
					end

					OP_DEVICE_ID: begin
						case(count)
							0:	spi_tx_data		<= idcode[7:0];
							1:	spi_tx_data		<= idcode[15:8];
							2:	spi_tx_data		<= idcode[23:16];
							3: begin
								spi_tx_data		<= idcode[31:24];
								state			<= STATE_IDLE;
							end
						endcase
					end	//end OP_DEVICE_ID

					OP_FPGA_SERIAL: begin
						case(count)
							0:	spi_tx_data		<= die_serial[7:0];
							1:	spi_tx_data		<= die_serial[15:8];
							2:	spi_tx_data		<= die_serial[23:16];
							3:	spi_tx_data		<= die_serial[31:24];
							4:	spi_tx_data		<= die_serial[39:32];
							5:	spi_tx_data		<= die_serial[47:40];
							6:	spi_tx_data		<= die_serial[55:48];
							7: begin
								spi_tx_data		<= die_serial[63:56];
								state			<= STATE_IDLE;
							end
						endcase
					end	//end OP_FPGA_SERIAL

					OP_DIE_TEMP: begin
						case(count)
							0:	spi_tx_data		<= die_temp[7:0];
							1: begin
								spi_tx_data		<= die_temp[15:8];
								state			<= STATE_IDLE;
							end
						endcase
					end	//end OP_DIE_TEMP

					OP_VOLT_CORE: begin
						case(count)
							0:	spi_tx_data		<= volt_core[7:0];
							1: begin
								spi_tx_data		<= volt_core[15:8];
								state			<= STATE_IDLE;
							end
						endcase
					end	//end OP_VOLT_CORE

					OP_VOLT_RAM: begin
						case(count)
							0:	spi_tx_data		<= volt_ram[7:0];
							1: begin
								spi_tx_data		<= volt_ram[15:8];
								state			<= STATE_IDLE;
							end
						endcase
					end	//end OP_VOLT_RAM

					OP_VOLT_AUX: begin
						case(count)
							0:	spi_tx_data		<= volt_aux[7:0];
							1: begin
								spi_tx_data		<= volt_aux[15:8];
								state			<= STATE_IDLE;
							end
						endcase
					end	//end OP_VOLT_AUX

					OP_PSU_TEMP: begin
						case(count)
							0:	spi_tx_data		<= psu_temp[7:0];
							1: begin
								spi_tx_data		<= {4'h0, psu_temp[11:8]};
								state			<= STATE_IDLE;
							end
						endcase
					end	//end OP_PSU_TEMP

					OP_MGMT0_STAT: begin
						case(count)
							0:	spi_tx_data		<= { 12'h0, mgmt_up, 1'h0, mgmt_speed };
							1: begin
								spi_tx_data		<= 8'h0;
								state			<= STATE_IDLE;
							end
						endcase
					end	//end OP_MGMT0_STAT

					OP_FLASH_SIZE: begin
						case(count)
							0:	spi_tx_data		<= flash_mbits[7:0];
							1: begin
								spi_tx_data		<= flash_mbits[15:8];
								state			<= STATE_IDLE;
							end
						endcase
					end

					default:
						state			<= STATE_IDLE;
				endcase

			end	//end STATE_DISPATCH

			STATE_TX: begin
				if(spi_rx_data_valid) begin
					state	<= STATE_DISPATCH;
					count	<= count + 1'h1;
				end
			end	//end STATE_TX

		endcase

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Debug ILA
	/*
	wire	trig_out;

	ila_0 ila(
		.clk(clk),
		.trig_out(trig_out),
		.trig_out_ack(trig_out),
		.probe0(state),
		.probe1(spi_rx_data_valid),
		.probe2(spi_rx_data),
		.probe3(opcode),
		.probe4(count),
		.probe5(spi_tx_data_valid),
		.probe6(spi_tx_data),
		.probe7(idcode),
		.probe8(die_temp),
		.probe9(spi_cs_falling),
		.probe10(spi_cs_n),
		.probe11(die_serial)
	);
	*/

endmodule
