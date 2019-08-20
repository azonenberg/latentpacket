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

LatentRedPlatform g_platform;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Initialization

Platform::~Platform()
{

}

LatentRedPlatform::~LatentRedPlatform()
{
}

LatentRedPlatform::LatentRedPlatform()
	: m_cliUart(&UART4, &USART2)
	, m_cli(&m_switch, &m_cliUart)
{
	EnableInterrupts();
}

int main()
{
	g_platform.m_cliUart.Printf("start of main\n");

	//Wait for events, then process them
	while(true)
		g_platform.m_cli.Iteration();

	//should never get here
	return 0;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Exception vectors

extern "C" void NMI_Handler()
{
	g_platform.m_cliUart.PrintString("NMI\n");
	while(1)
	{}
}

extern "C" void HardFault_Handler()
{
	uint32_t* msp;
	asm volatile("mrs %[result], MSP" : [result]"=r"(msp));

	g_platform.m_cliUart.Printf("Hard fault\n");
	g_platform.m_cliUart.Printf("    HFSR  = %08x\n", *(volatile uint32_t*)(0xe000ed2C));
	g_platform.m_cliUart.Printf("    MMFAR = %08x\n", *(volatile uint32_t*)(0xe000ed34));
	g_platform.m_cliUart.Printf("    BFAR  = %08x\n", *(volatile uint32_t*)(0xe000ed38));
	g_platform.m_cliUart.Printf("    CFSR  = %08x\n", *(volatile uint32_t*)(0xe000ed28));
	g_platform.m_cliUart.Printf("    UFSR  = %08x\n", *(volatile uint16_t*)(0xe000ed2a));
	g_platform.m_cliUart.Printf("    DFSR  = %08x\n", *(volatile uint32_t*)(0xe000ed30));
	g_platform.m_cliUart.Printf("    MSP   = %08x\n", msp);
	g_platform.m_cliUart.Printf("    Stack:\n");
	for(int i=0; i<16; i++)
		g_platform.m_cliUart.Printf("        %08x\n", msp[i]);

	while(1)
	{}
}

extern "C" void BusFault_Handler()
{
	g_platform.m_cliUart.PrintString("Bus fault\n");
	while(1)
	{}
}

extern "C" void UsageFault_Handler()
{
	g_platform.m_cliUart.PrintString("Usage fault\n");
	while(1)
	{}
}

extern "C" void MMUFault_Handler()
{
	g_platform.m_cliUart.PrintString("MMU fault\n");
	while(1)
	{}
}
