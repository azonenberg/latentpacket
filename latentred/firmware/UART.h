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

#ifndef uart_h
#define uart_h

/**
	@file
	@author Andrew D. Zonenberg
	@brief UART driver
 */

extern "C" void USART2_Handler();

/**
	@brief Driver for a UART
 */
class UART
{
public:

	UART(volatile usart_t* lane)
	 : UART(lane, lane)
	{}

	UART(volatile usart_t* txlane, volatile usart_t* rxlane);

	//TX side
	void PrintBinary(char ch);
	void PrintText(char ch);
	void PrintString(const char* str);
	void Printf(const char* format, ...);
	void WritePadded(const char* str, int minlen, char padding, int prepad);

	//RX side
	char BlockingRead();
	bool HasInput()
	{ return !m_rxFifo.IsEmpty(); }

	//Interrupt handlers
	void OnIRQRxData(char ch)
	{ m_rxFifo.Push(ch); }

protected:
	volatile usart_t* m_txlane;
	volatile usart_t* m_rxlane;

	FIFO<char, 32> m_rxFifo;
};

extern UART g_uart;
extern UART g_managementFpgaUart;

#endif
