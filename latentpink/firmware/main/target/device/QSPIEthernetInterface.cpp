/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2023 Andrew D. Zonenberg and contributors                                                              *
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

#include "latentpink.h"
#include "QSPIEthernetInterface.h"
#include <peripheral/RCC.h>
#include <ctype.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Construction / destruction

QSPIEthernetInterface::QSPIEthernetInterface()
{
	for(int i=0; i<QSPI_TX_BUFCOUNT; i++)
		m_txFreeList.Push(&m_txBuffers[i]);
	for(int i=0; i<QSPI_RX_BUFCOUNT; i++)
		m_rxFreeList.Push(&m_rxBuffers[i]);

	//TODO: Reset FPGA side buffers etc?
}

QSPIEthernetInterface::~QSPIEthernetInterface()
{
	//nothing here
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Transmit path

EthernetFrame* QSPIEthernetInterface::GetTxFrame()
{
	g_log("Outbound frame requested\n");

	if(m_txFreeList.IsEmpty())
		return nullptr;

	else
		return m_txFreeList.Pop();
}

void QSPIEthernetInterface::SendTxFrame(EthernetFrame* frame)
{
	g_log("Send of %d byte frame requested\n", frame->Length());

	//TODO: actually send it

	//TODO: DMA optimizations

	//Done, put on free list
	m_txFreeList.Push(frame);
}

void QSPIEthernetInterface::CancelTxFrame(EthernetFrame* frame)
{
	//Return it to the free list
	m_txFreeList.Push(frame);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Receive path

EthernetFrame* QSPIEthernetInterface::GetRxFrame()
{
	//Read and sanity check length
	uint16_t len = g_fpga->BlockingRead16(REG_EMAC_RXLEN);
	if(len > 1500)
	{
		g_log(Logger::ERROR, "Got a %d byte long frame (max size 1500, FPGA should not have done this)\n", (int)len);
		return nullptr;
	}

	//Make sure we have somewhere to put the frame
	if(m_rxFreeList.IsEmpty())
	{
		g_log("Frame dropped due to lack of buffers\n");

		//Read and discard the frame
		static uint8_t rxbuf[1500] = {0};
		g_fpga->BlockingRead(REG_EMAC_BUFFER, rxbuf, len);
		return nullptr;
	}

	//Read it
	auto frame = m_rxFreeList.Pop();
	frame->SetLength(len);
	g_fpga->BlockingRead(REG_EMAC_BUFFER, frame->RawData(), len);

	g_log("Got %d byte frame\n", (int)len);
	return frame;
}

void QSPIEthernetInterface::ReleaseRxFrame(EthernetFrame* frame)
{
	m_rxFreeList.Push(frame);
}
