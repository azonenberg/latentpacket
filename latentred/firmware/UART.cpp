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
// Output formatting

void UART::WritePadded(const char* str, int minlen, char padding, int prepad)
{
	int len = strlen(str);
	int npads =	minlen - len;

	if(npads < 0)
		npads = 0;

	if(prepad)
		for(int i=0; i<npads; i++)
			PrintBinary(padding);

	PrintString(str);

	if(!prepad)
		for(int i=0; i<npads; i++)
			PrintBinary(padding);
}

/**
	@brief Stripped-down printf implementation adapted from my old PICNIX project.

	Much ligher than a full ANSI compatible version but good enough for typical embedded use.
 */
void UART::Printf(const char* format, ...)
{
	__builtin_va_list list;
	__builtin_va_start(list, format);

	//Parsing helpers
	const int buflen = 32;	//must be large enough for INT_MAX plus null
	char buf[buflen+1];
	const char* pch;
	int bufpos = 0;
	static const char hex[] = "0123456789abcdef";
	static const char Hex[] = "0123456789ABCDEF";
	unsigned int d;

	//Go through the format string and process it
	int len = strlen(format);
	for(int i=0; i<len; i++)
	{
		//Format character
		if(format[i] == '%')
		{
			char type;				//format code
			int length = 0;			//min length of field
			char padchar = ' ';		//padding character
			int prepad = 1;

			//Flush the buffer
			if(bufpos > 0)
			{
				buf[bufpos] = '\0';
				PrintString(buf);
				bufpos = 0;
			}

			//Read specifier
			type = format[++i];
			if(type == '-')
			{
				prepad = 0;
				type = format[++i];
			}
			while(isdigit(type))
			{
				if(type == '0' && length == 0)
					padchar = '0';
				else
					length = (length*10) + (type - '0');
				type = format[++i];
			}

			switch(type)
			{
			case '%':
				PrintBinary('%');
				break;

			case 'd':
				itoa(__builtin_va_arg(list, int), buf);
				WritePadded(buf, length, padchar, prepad);
				break;

			case 's':
				pch = __builtin_va_arg(list, const char*);
				WritePadded(pch, length, padchar, prepad);
				break;

			case 'x':
			case 'X':
				{
					d = __builtin_va_arg(list, unsigned int);
					int bFirst = 1;
					for(int j=0; j<8; j++)
					{
						//Grab the next 4 bits
						unsigned int x = d >> 28;

						//Print it
						char ch = hex[x];
						if(format[i] == 'X')					//capitalize
							ch = Hex[x];

						//Skip leading zeros unless we are padding
						//but print a single 0 if it's zero
						if( (ch == '0') && bFirst && (j != 7) )
						{
							if( (8 - j) <= length)
								PrintBinary(padchar);
						}
						else
						{
							PrintBinary(ch);
							bFirst = 0;
						}

						//Shift off what we just printed
						d <<= 4;
					}
				}
				break;

			default:
				PrintBinary('*');
				break;
			}
		}

		//Nope, print it directly, buffering for improved performance
		else
		{
			if(bufpos >= buflen)
			{
				buf[bufpos] = '\0';
				PrintString(buf);
				bufpos = 0;
			}

			buf[bufpos++] = format[i];
		}
	}

	//Flush the buffer
	if(bufpos > 0)
	{
		buf[bufpos] = '\0';
		PrintString(buf);
	}

	__builtin_va_end(list);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Interrupt handlers

extern "C" void __attribute__((isr)) USART2_Handler()
{
	//Check why we got the IRQ.
	//For now, ignore anything other than "data ready"
	if(0 == (USART2.ISR & USART_ISR_RXNE))
		return;

	//rx data? Shove it in the fifo
	g_platform.m_cliUart.OnIRQRxData(USART2.RDR);
}

extern "C" void __attribute__((isr)) UART5_Handler()
{
	/*
	//Check why we got the IRQ.
	//For now, ignore anything other than "data ready"
	if(0 == (UART5.ISR & USART_ISR_RXNE))
		return;

	//save the byte, no fifo yet
	g_managementFpgaUart.OnIRQRxData(UART5.RDR);
	*/
	(void)UART5.RDR;
}
