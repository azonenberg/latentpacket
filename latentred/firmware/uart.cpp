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

UART g_uart(&UART4, &USART2);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// UART driver class

/**
	@brief Initializes a UART.

	TODO: nicer constants here
 */
UART::UART(volatile usart_t* txlane, volatile usart_t* rxlane)
	: m_txlane(txlane)
	, m_rxlane(rxlane)
{
	//TODO: make this part generic

	//Enable GPIO port A
	RCC.AHB1ENR |= RCC_AHB1_GPIOA;

	//Configure UART4_TX as AF8 on PA0 (PMOD0_DQ5) and USART2_RX as AF7 on PA3
	GPIOA.MODER = (GPIOA.MODER & 0xffffff3c) | 0x82;
	GPIOA.AFRL = (GPIOA.AFRL & 0xffff0ff0) | 0x7008;

	//Enable the UARTs
	RCC.APB1ENR |= RCC_APB1_UART4 | RCC_APB1_USART2;

	//Configure TX lane
	m_txlane->BRR = 181;	//we calculate 217 for 115.2 Kbps but experimentally we need this, why??
						//This is suggestive of APB1 being 20.85 MHz instead of 25.
	m_txlane->CR3 = 0x0;
	m_txlane->CR2 = 0x0;
	m_txlane->CR1 = 0x9;

	//Configure RX lane, but only enable RX. Enable RXNE interrupt
	m_rxlane->BRR = 181;
	m_rxlane->CR3 = 0x0;
	m_rxlane->CR2 = 0x0;
	m_rxlane->CR1 = 0x25;

	//Enable IRQ38. This is bit 6 of NVIC_ISER1.
	//TODO: make this part generic
	volatile uint32_t* NVIC_ISER1 = (volatile uint32_t*)(0xe000e104);
	*NVIC_ISER1 = 0x40;
}

void UART::PrintBinary(char ch)
{
	m_txlane->TDR = ch;

	while(0 == (m_txlane->ISR & USART_ISR_TXE))
	{}
}

void UART::PrintText(char ch)
{
	if(ch == '\n')
		PrintBinary('\r');
	PrintBinary(ch);
}

char UART::BlockingRead()
{
	//block until at least one byte is ready
	while(m_rxFifo.IsEmpty())
	{}

	return m_rxFifo.Pop();
}

void UART::PrintString(const char* str)
{
	while(*str)
		PrintText(*(str++));
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Actual UART driver

extern "C" void __attribute__((isr)) USART2_Handler()
{
	//Check why we got the IRQ.
	//For now, ignore anything other than "data ready"
	if(0 == (USART2.ISR & USART_ISR_RXNE))
		return;

	//save the byte, no fifo yet
	g_uart.OnIRQRxData(USART2.RDR);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Output helpers

/**
	@brief Prints a byte as hex
 */
/*
void PrintHex(char ch)
{
	static const char hex[] = "0123456789abcdef";
	PrintChar(hex[ch >> 4]);
	PrintChar(hex[ch & 0xf]);
}*/

/**
	@brief Prints a 32-bit integer as hex
 */
/*void PrintHex32(uint32_t n)
{
	PrintHex((n >> 24) & 0xff);
	PrintHex((n >> 16) & 0xff);
	PrintHex((n >> 8) & 0xff);
	PrintHex(n & 0xff);
}*/
