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

//ignored
void* __dso_handle;

typedef void(*fnptr)();

extern "C" uint8_t __bss_start;
extern "C" uint8_t __bss_end;

//symbols defined by linker
extern "C" const uint32_t __ctor_start;
extern "C" const uint32_t __ctor_end;

extern "C" const uint8_t __data_romstart;
extern "C" uint8_t __data_start;
extern "C" uint8_t __data_end;

//atexit stuff
volatile void* g_destructorArgs[1];
volatile fnptr g_destructorPtrs[1];
volatile void* g_dsos[1];

//entry point
extern "C" int main();

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// C++ memory allocation (not supported)

void* operator new(size_t n)
{
	//g_uart.PrintString("new called\n");
	while(1)
	{}
}

void operator delete(void* p)
{
	//g_uart.PrintString("delete(void*) called\n");
	while(1)
	{}
}

void operator delete(void* p, size_t size)
{
	//g_uart.PrintString("delete(void*, size_t) called\n");
	while(1)
	{}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Stub for unused interrupts

extern "C" void defaultISR()
{
	while(1)
	{}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Stub for pure virtual functions

extern "C" void __cxa_pure_virtual()
{
	//g_uart.PrintString("pure virtual function called\n");
	while(1)
	{}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// atexit calls (ignored, since main never returns)

extern "C" int __aeabi_atexit(void* arg, void(*func)(), void* dso)
{
	g_destructorArgs[0] = arg;
	g_destructorPtrs[0] = func;
	g_dsos[0] = dso;

	g_platform.m_cliUart.Printf("__aeabi_atexit called (arg=%x, func=%x, dso=%x)\n",
		arg, func, dso);
	return 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Entry point (doable in C++ as long as we don't rely on anything but the stack and ROM)

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

	//Call main() once everything is initialized
	main();

	//should never get here
	while(1)
	{}
}
