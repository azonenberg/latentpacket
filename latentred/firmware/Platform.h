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

#ifndef Platform_h
#define Platform_h


/**
	@brief Generic hardware platform setup
 */
class Platform
{
public:
	Platform()
	{
		//For 200 MHz @ 3.3V we need 6 wait states on flash
		FLASH.ACR = FLASH_ACR_ARTEN | FLASH_ACR_PREFETCHEN | 6;

		/*
			configure main PLL (TODO: some kind of bitfield struct/union here)
				Input: HSI clock (16 MHz RC)
				M = 8, so PLL input = 2 MHz
				N = 200, so VCO = 400 MHz
				P = 2, so Fcpu = 200 MHz
				Q = 10, so Frng = 40 MHz
				R = 10, so Fdsi = 40 MHz (ignored, no DSI on this chip)
		 */
		RCC.PLLCFGR = (RCC.PLLCFGR & RCC_PLLCFGR_RESERVED_MASK) | 0xaa002808;

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
		RCC.CFGR = RCC_APB2_DIV4 | RCC_APB1_DIV8 | RCC_AHB_DIV1 | RCC_SYSCLK_PLL;
	}

	virtual ~Platform();
};

/**
	@brief Main application class

	Derived from Platform so that Platform::Platform() is called before any of our members are initialized
 */
class LatentRedPlatform : public Platform
{
public:
	LatentRedPlatform();
	virtual ~LatentRedPlatform();

	UART			m_cliUart;
	LatentRedSwitch m_switch;
	CLI 			m_cli;
};

extern LatentRedPlatform g_platform;

#endif
