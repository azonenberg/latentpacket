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
// Entry point (doable in C++ as long as we don't rely on anything but the stack and ROM)

//symbols defined by linker

extern "C" uint8_t __bss_start;
extern "C" uint8_t __bss_end;

extern "C" const uint32_t __ctor_start;
extern "C" const uint32_t __ctor_end;

extern "C" const uint8_t __data_romstart;
extern "C" uint8_t __data_start;
extern "C" uint8_t __data_end;


extern "C" void _start()
{
	//Zeroize .bss
	uint32_t len = &__bss_end - &__bss_start;
	memset(&__bss_start, 0, len);

	//Copy .data to RAM
	len = &__data_end - &__data_start;
	memcpy(&__data_start, &__data_romstart, len);

	//Call all of the global constructors
	for(uint32_t ctor = __ctor_start; ctor != __ctor_end; ctor ++)
		reinterpret_cast<fnptr>(ctor)();

	g_platform.m_cliUart.Printf("start of main\n");

	//Wait for events, then process them
	while(1)
		g_platform.m_cli.Iteration();
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
	msp += 12;	//locals/alignment
	uint32_t r0 = msp[0];
	uint32_t r1 = msp[1];
	uint32_t r2 = msp[2];
	uint32_t r3 = msp[3];
	uint32_t r12 = msp[4];
	uint32_t lr = msp[5];
	uint32_t pc = msp[6];
	uint32_t xpsr = msp[7];

	g_platform.m_cliUart.Printf("Hard fault\n");
	g_platform.m_cliUart.Printf("    HFSR  = %08x\n", *(volatile uint32_t*)(0xe000ed2C));
	g_platform.m_cliUart.Printf("    MMFAR = %08x\n", *(volatile uint32_t*)(0xe000ed34));
	g_platform.m_cliUart.Printf("    BFAR  = %08x\n", *(volatile uint32_t*)(0xe000ed38));
	g_platform.m_cliUart.Printf("    CFSR  = %08x\n", *(volatile uint32_t*)(0xe000ed28));
	g_platform.m_cliUart.Printf("    UFSR  = %08x\n", *(volatile uint16_t*)(0xe000ed2a));
	g_platform.m_cliUart.Printf("    DFSR  = %08x\n", *(volatile uint32_t*)(0xe000ed30));
	g_platform.m_cliUart.Printf("    MSP   = %08x\n", msp);
	g_platform.m_cliUart.Printf("    r0    = %08x\n", r0);
	g_platform.m_cliUart.Printf("    r1    = %08x\n", r1);
	g_platform.m_cliUart.Printf("    r2    = %08x\n", r2);
	g_platform.m_cliUart.Printf("    r3    = %08x\n", r3);
	g_platform.m_cliUart.Printf("    r12   = %08x\n", r12);
	g_platform.m_cliUart.Printf("    lr    = %08x\n", lr);
	g_platform.m_cliUart.Printf("    pc    = %08x\n", pc);
	g_platform.m_cliUart.Printf("    xpsr  = %08x\n", xpsr);

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
