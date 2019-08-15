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

#include "stm32f777.h"
#include "uart.h"
#include "cli.h"

void PlatformInit();

int main()
{
	PlatformInit();
	UartInit();

	while(1)
	{
		RunPrompt("switch# ");
	}

	return 0;
}

void PlatformInit()
{
	//Configure wait states for flash. For 200 MHz @ 3.3V we need 6 wait states
	FLASH.ACR = 0x00000306;

	/*
		configure main PLL
			Input: HSI clock (16 MHz RC)
			M = 8, so PLL input = 2 MHz
			N = 200, so VCO = 400 MHz
			P = 2, so Fcpu = 200 MHz
			Q = 10, so Frng = 40 MHz
			R = 10, so Fdsi = 40 MHz (ignored, no DSI on this chip)
	 */
	RCC.PLLCFGR = (RCC.PLLCFGR & 0x80BC8000) | 0xaa002808;

	//Start the PLL, then wait for it to lock
	RCC.CR |= RCC_PLL_ENABLE;
	while(0 == (RCC.CR & RCC_PLL_READY))
	{}

	/*
		Configure main system clocks
		APB2 must be <= 90 MHz, /4 = 50 MHz
		APB1 must be <= 45 MHz, /8 = 25 MHz
		AHB must be >25 MHz, no division needed
		Use PLL
	 */
	//keep bits 9:8
	RCC.CFGR = 0xb802;
}
