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
	: m_mgmtPort(this)
	, m_uart(&UART5)
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

void LatentRedManagementBoard::PrintCPUInfo(UART* uart)
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

	uart->Printf("        CPU:\n");
	if( (devid & 0xfff) == 0x451)
	{
		uart->Printf("            ST STM32F777NI stepping %d\n", (devid >> 16) & 0xfff);
		uart->Printf("            ARM Cortex-M7 with FPU\n");
		uart->Printf("            %d KB Flash\n", flash_kb);
		uart->Printf("            512 KB SRAM\n");
	}
	else
		uart->Printf("            Unknown CPU\n");
	if(package == 0x7)
		uart->Printf("            TFBGA216 package\n");
	else
		uart->Printf("            Unknown package\n");
	uart->Printf("            Die (%d, %d), wafer %d, lot %s\n", waferX, waferY, waferNum, waferLot);

	/*
	g_uart.Printf("    Switch fabric FPGA:\n");
	g_uart.Printf("        Xilinx [details unimplemented]\n");
	g_uart.Printf("        Serial number 0x[details unimplemented]\n");
	g_uart.Printf("        Bitstream version [details unimplemented]\n");

	g_uart.Printf("    Line cards:\n");
	g_uart.Printf("        0: LATENTRED switch fabric board rev [details unimplemented]\n");
	g_uart.Printf("            [details unimplemented] 10Gbase-R SFP+ interfaces\n");
	g_uart.Printf("        1: Pluggable line cards [details unimplemented]\n");
	g_uart.Printf("            [details unimplemented] 10/100/1000base-TX RJ45 interfaces\n");

	g_uart.Printf("\n");
	*/
}

void LatentRedManagementBoard::PrintFPGAInfo(UART* uart)
{
	uart->Printf("        FPGA:\n");

	//Look up the IDCODE
	m_uart.Write16(OP_DEVICE_ID);
	uint32_t idcode = m_uart.BlockingRead32();
	idcode = 0x0362c093;	//temporary workaround

	if( (idcode & 0x0fffffff) == 0x0362c093)
		uart->Printf("            Xilinx XC7A50T stepping %d\n", idcode >> 28);
	else
		uart->Printf("            Xilinx [unknown, idcode = 0x%08x]\n", idcode);
		
	m_uart.Write16(OP_FPGA_SERIAL);
	uint32_t serial_hi = m_uart.BlockingRead32();
	uint32_t serial_lo = m_uart.BlockingRead32();

	uart->Printf("            Serial number 0x%08x%08x\n", serial_hi, serial_lo);
	
	uart->Printf("            Bitstream version [details unimplemented]\n");
}

void LatentRedManagementBoard::PrintSensorInfo(UART* uart)
{
	uart->Printf("        Sensors:\n");
	
	m_uart.Write16(OP_DIE_TEMP);
	uint16_t temp = m_uart.BlockingRead16();
	uart->Printf("            FPGA temp: %d.%d C\n",
		(temp >> 8),
		((temp & 0xff) * 100) / 256
		);
		
	m_uart.Write16(OP_PSU_TEMP);
	temp = m_uart.BlockingRead16();
	uart->Printf("            PSU temp : %d.%d C\n",
		(temp >> 8),
		((temp & 0xff) * 100) / 256
		);
		
	m_uart.Write16(OP_VOLT_CORE);
	uint16_t volt = m_uart.BlockingRead16();
	uart->Printf("            VCCINT   : %d.%d V\n",
		(volt >> 8),
		((volt & 0xff) * 100) / 256
		);
		
	m_uart.Write16(OP_VOLT_RAM);
	volt = m_uart.BlockingRead16();
	uart->Printf("            VCCBRAM  : %d.%d V\n",
		(volt >> 8),
		((volt & 0xff) * 100) / 256
		);
		
	m_uart.Write16(OP_VOLT_AUX);
	volt = m_uart.BlockingRead16();
	uart->Printf("            VCCAUX   : %d.%d V\n",
		(volt >> 8),
		((volt & 0xff) * 100) / 256
		);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Port access

uint32_t LatentRedManagementBoard::GetPortCount()
{
	return 1;
}

Port* LatentRedManagementBoard::GetPort(uint32_t i)
{
	if(i == 0)
		return &m_mgmtPort;
	else
		return NULL;
}
