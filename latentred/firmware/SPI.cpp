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

SPI::SPI(volatile spi_t* spi)
	: m_spi(spi)
{
	//TODO: make this cleaner, allow multiple AFs
	if(spi == &SPI5)
	{
		//Enable the SPI peripheral, plus GPIO F and H
		RCC.APB2ENR |= RCC_APB2_SPI5;
		RCC.AHB1ENR |= RCC_AHB1_GPIOF | RCC_AHB1_GPIOH;

		//Configure SPI5_MOSI as AF5 on PF11
		GPIOF.MODER = (GPIOF.MODER & 0xFF3FFFFF) | 0x800000;
		GPIOF.AFRH = (GPIOF.AFRH & 0xffff0fff) | 0x5000;

		//Configure SPI5_CS_N as AF5 on PH5
		//Configure SPI5_SCK as AF5 on PH6
		//Configure SPI5_MISO as AF5 on PH7
		GPIOH.MODER = (GPIOF.MODER & 0xFFFF03FF) | 0xA800;
		GPIOH.AFRL = (GPIOF.AFRL & 0x000fffff) | 0x55500000;
	}

	//8 bit mode, no interrupts enabled, single master mode, SS# output driven, no DMA
	m_spi->CR2 = 0x1704;

	//Default configuration: full duplex, master, enabled, MSB first, mode (0,0)
	//Clock = APB/2 (12.5 MHz nominal)
	//Software SS# management, SS# high
	m_spi->CR1 = 0x344;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Transmission

/**
	@brief Write to the CS# pin
 */
void SPI::SetCS(bool cs)
{
	if(cs)
		m_spi->CR1 |= 0x100;
	else
		m_spi->CR1 &= ~0x100;
}

/**
	@brief Writes a byte of data to the SPI interface and reads one back
 */
void SPI::PrintBinary(char ch)
{
	m_spi->DR = ch;

	while( (m_spi->SR & 0x600) == 0)
	{}

	OnIRQRxData(m_spi->DR);
}
