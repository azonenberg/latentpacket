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

#include "latentpink.h"

/**
	@brief Read a temperature sensor at the given I2C address and return the temperature (in 8.8 fixed point format)
 */
uint16_t ReadThermalSensor(uint8_t addr)
{
	if(!g_tempI2C->BlockingWrite8(addr, 0x00))
		return 0xff;
	uint16_t reply;
	if(!g_tempI2C->BlockingRead16(addr, reply))
		return 0xff;

	/*
	int degInt = (reply >> 8);
	int degFrac = ((reply & 0xff) / 256.0) * 100;
	g_log("Temp sensor 0x%02x: %04x (%d.%02d C)\n", addr, reply, degInt, degFrac);
	*/
	return reply;
}

/**
	@brief Reads the RPM of the requested fan
 */
uint16_t GetFanRPM(uint8_t channel)
{
	switch(channel)
	{
		case 0:
			return g_fpga->BlockingRead16(REG_FAN0_RPM);

		case 1:
			return g_fpga->BlockingRead16(REG_FAN1_RPM);

		default:
			return 0;
	}
}

/**
	@brief Gets the temperature of the FPGA (in 8.8 fixed point format)
 */
uint16_t GetFPGATemperature()
{
	return g_fpga->BlockingRead16(REG_DIE_TEMP);
}

/**
	@brief Gets the VCCINT voltage of the FPGA (in 8.8 fixed point format)
 */
uint16_t GetFPGAVCCINT()
{
	return g_fpga->BlockingRead16(REG_VOLT_CORE);
}

/**
	@brief Gets the VCCBRAM voltage of the FPGA (in 8.8 fixed point format)
 */
uint16_t GetFPGAVCCBRAM()
{
	return g_fpga->BlockingRead16(REG_VOLT_RAM);
}

/**
	@brief Gets the VCCAUX voltage of the FPGA (in 8.8 fixed point format)
 */
uint16_t GetFPGAVCCAUX()
{
	return g_fpga->BlockingRead16(REG_VOLT_AUX);
}
