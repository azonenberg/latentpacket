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

/**
	@brief Link to the UART on the management FPGA
 */
//UART g_managementFpgaUart(&UART5);

LatentRedSwitch::LatentRedSwitch()
{
	/*
	//TODO: make this part generic

	//Enable GPIO port B
	RCC.AHB1ENR |= RCC_AHB1_GPIOB;

	//Configure UART5_TX as AF7 on PB9 and USART5_RX as AF7 on PB8
	GPIOB.MODER = (GPIOB.MODER & 0xfff0ffff) | 0x000a0000;
	GPIOB.AFRL = (GPIOB.AFRH & 0xffffff00) | 0x0077;

	//Enable the UARTs
	RCC.APB1ENR |= RCC_APB1_UART5;

	//Enable IRQ53. This is bit 21 of NVIC_ISER1.
	volatile uint32_t* NVIC_ISER1 = (volatile uint32_t*)(0xe000e104);
	*NVIC_ISER1 = 0x200000;
	*/
}

LatentRedSwitch::~LatentRedSwitch()
{
}

const char* LatentRedSwitch::GetDescription()
{
	return "LATENTRED";
}

size_t LatentRedSwitch::GetBoardCount()
{
	return 2;
}

Board* LatentRedSwitch::GetBoard(size_t i)
{
	if(i == 0)
		return &m_switchEngineBoard;
	else if(i == 1)
		return &m_managementBoard;
	else
		return NULL;
}
