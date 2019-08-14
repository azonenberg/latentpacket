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

void PlatformInit();
void UartInit();

int main()
{
	PlatformInit();

	//enable gpio port a
	RCC.AHB1ENR |= RCC_AHB1_GPIOA;

	//set as low drive output
	GPIOA.OSPEEDR = 0x0c000000;
	GPIOA.MODER |= 0x40;

	UartInit();

	//toggle PA3 in a loop
	while(1)
	{
		//Transmit a byte of data
		GPIOA.ODR = 0x8;
		UART4.TDR = 'A';
		GPIOA.ODR = 0x0;

		//Poll until it's done
		while(0 == (UART4.ISR & 0x40))
		{}

		//DEBUG: Sleep a little longer
		for(int i=0; i<128; i++)
		{
			asm("nop");
		}
	}

	return 0;
}

void UartInit()
{
	//Configure UART4_TX as AF8 on PA0 (PMOD0_DQ5)
	GPIOA.MODER = (GPIOA.MODER & 0xfffffffc) | 0x2;
	GPIOA.AFRL = (GPIOA.AFRL & 0xfffffff0) | 0x8;

	//Configure UART4
	RCC.APB1ENR |= RCC_APB1_UART4;
	UART4.BRR = 181;	//we calculate 217 for 115.2 Kbps but experimentally we need this, why??
						//This is suggestive of APB1 being 20.85 MHz instead of 25.
	UART4.CR3 = 0x0;
	UART4.CR2 = 0x0;
	UART4.CR1 = 0x9;

	//TODO: USART2_RX as AF7 on PA3
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
