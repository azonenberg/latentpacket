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

#include "latentred.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Construction / destruction

LatentRedManagementBoard::LatentRedManagementBoard()
{
}

LatentRedManagementBoard::~LatentRedManagementBoard()
{
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Accessors

const char* LatentRedManagementBoard::GetDescription()
{
	return "INTEGRALSTICK SoM v0.1";
}

void LatentRedManagementBoard::PrintCPUInfo()
{
	//see STM32 programming manual section 45.1
	volatile const uint32_t* serial = (volatile const uint32_t*)0x1ff0f420;
	uint16_t waferX = serial[0] >> 16;
	uint16_t waferY = serial[0] & 0xffff;
	uint8_t waferNum = serial[1] & 0xff;
	char waferLot[8] =
	{
		static_cast<char>((serial[1] >> 24) & 0xff),
		static_cast<char>((serial[1] >> 16) & 0xff),
		static_cast<char>((serial[1] >> 8) & 0xff),
		static_cast<char>((serial[2] >> 24) & 0xff),
		static_cast<char>((serial[2] >> 16) & 0xff),
		static_cast<char>((serial[2] >> 8) & 0xff),
		static_cast<char>((serial[2] >> 0) & 0xff),
		'\0'
	};
	const uint32_t flash_kb = (*(volatile uint32_t*)0x1ff0f440) >> 16;
	const uint16_t package = ( (*(volatile uint16_t*)0x1fff7bf0) >> 8) & 0x7;

	//see STM32 programming manual section 44.6.1
	const uint32_t devid = *(volatile uint32_t*)0xe0042000;

	g_uart.Printf("        CPU:\n");
	if( (devid & 0xfff) == 0x451)
	{
		g_uart.Printf("            ST STM32F777NI stepping %d\n", (devid >> 16) & 0xfff);
		g_uart.Printf("            ARM Cortex-M7 with FPU\n");
		g_uart.Printf("            %d KB Flash\n", flash_kb);
		g_uart.Printf("            512 KB SRAM\n");
	}
	else
		g_uart.Printf("            Unknown CPU\n");
	if(package == 0x7)
		g_uart.Printf("            TFBGA216 package\n");
	else
		g_uart.Printf("            Unknown package\n");
	g_uart.Printf("            Die (%d, %d), wafer %d, lot %s\n", waferX, waferY, waferNum, waferLot);

	/*
	g_uart.Printf("    Management engine FPGA:\n");
	g_uart.Printf("        Xilinx [details unimplemented]\n");
	g_uart.Printf("        Serial number 0x[details unimplemented]\n");
	g_uart.Printf("        Bitstream version [details unimplemented]\n");

	g_uart.Printf("    Switch fabric FPGA:\n");
	g_uart.Printf("        Xilinx [details unimplemented]\n");
	g_uart.Printf("        Serial number 0x[details unimplemented]\n");
	g_uart.Printf("        Bitstream version [details unimplemented]\n");

	g_uart.Printf("    Line cards:\n");
	g_uart.Printf("        0: LATENTRED switch fabric board rev [details unimplemented]\n");
	g_uart.Printf("            [details unimplemented] 10Gbase-R SFP+ interfaces\n");
	g_uart.Printf("        1: Pluggable line cards [details unimplemented]\n");
	g_uart.Printf("            [details unimplemented] 10/100/1000base-TX RJ45 interfaces\n");
	*/
	g_uart.Printf("\n");
}

void LatentRedManagementBoard::PrintFPGAInfo()
{
	g_uart.Printf("        FPGA:\n");
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Port access

uint32_t LatentRedManagementBoard::GetPortCount()
{
}

Port* LatentRedManagementBoard::GetPort(uint32_t i)
{
	
}
