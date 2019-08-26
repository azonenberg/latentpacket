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

LatentRedManagementPort::LatentRedManagementPort(Board* board)
	: Port(board)
{
	strncpy(m_description, "SSH port", sizeof(m_description));
}

LatentRedManagementPort::~LatentRedManagementPort()
{
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Accessors

const char* LatentRedManagementPort::GetName()
{
	return "Mgmt0";
}

uint16_t LatentRedManagementPort::GetVlan()
{
	//ignored
	return 1;
}

Port::PortMode LatentRedManagementPort::GetMode()
{
	//Management port is not connected to the main switch fabric
	return Port::MODE_ISOLATED;
}

Port::LinkState LatentRedManagementPort::GetLinkState()
{
	//for now, no support for administratively disabling the management port

	//Need to query management FPGA (RMII link will always be up @ 100M)
	uint16_t stat = static_cast<LatentRedManagementBoard*>(m_board)->
		ReadReg16(LatentRedManagementBoard::OP_MGMT0_STAT);

	if(stat & 0x8)
		return LINK_UP;
	else
		return LINK_NOTCONNECT;
}

Port::LinkSpeed LatentRedManagementPort::GetCurrentLinkSpeed()
{
	//Need to query management FPGA (RMII link will always be up @ 100M)
	uint16_t stat = static_cast<LatentRedManagementBoard*>(m_board)->
		ReadReg16(LatentRedManagementBoard::OP_MGMT0_STAT);

	if(0 == (stat & 0x8) )
		return SPEED_DOWN;

	switch(stat & 3)
	{
		case 0:
			return SPEED_10M;
		case 1:
			return SPEED_100M;
		case 2:
			return SPEED_1G;
		default:
			return SPEED_DOWN;
	}
}

Port::PortType LatentRedManagementPort::GetPortType()
{
	//Management port is RGMII
	return TYPE_COPPER_RGMII;
}
