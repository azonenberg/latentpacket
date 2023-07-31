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

/**
	@file
	@author	Andrew D. Zonenberg
	@brief	PHY control code
 */

#include "latentpink.h"

/**
	@brief Reads a register from the management PHY
 */
uint16_t ManagementPHYRead(uint8_t regid)
{
	//Request the read
	g_fpga->BlockingWrite32(REG_MGMT0_MDIO, (regid << 16) | 0x20000000);

	//Poll until busy flag is cleared
	while(true)
	{
		auto reply = g_fpga->BlockingRead32(REG_MGMT0_MDIO);
		if( (reply & 0x80000000) == 0)
			return reply & 0xffff;
	}
}

void ManagementPHYWrite(uint8_t regid, uint16_t regval)
{
	//Request the write
	g_fpga->BlockingWrite32(REG_MGMT0_MDIO, (regid << 16) | 0x40000000 | regval );

	//Poll until busy flag is cleared
	while(true)
	{
		auto reply = g_fpga->BlockingRead32(REG_MGMT0_MDIO);
		if( (reply & 0x80000000) == 0)
			return;
	}
}

/**
	@brief Reads an extended register from the management PHY
 */
uint16_t ManagementPHYExtendedRead(uint8_t mmd, uint8_t regid)
{
	ManagementPHYWrite(REG_PHY_REGCR, mmd);			//set address
	ManagementPHYWrite(REG_PHY_ADDAR, regid);
	ManagementPHYWrite(REG_PHY_REGCR, 0x4000 | mmd);	//data, no post inc
	return ManagementPHYRead(REG_PHY_ADDAR);
}

/**
	@brief Writes an extended register to the management PHY
 */
void ManagementPHYExtendedWrite(uint8_t mmd, uint8_t regid, uint16_t regval)
{
	ManagementPHYWrite(REG_PHY_REGCR, mmd);				//set address
	ManagementPHYWrite(REG_PHY_ADDAR, regid);
	ManagementPHYWrite(REG_PHY_REGCR, 0x4000 | mmd);	//data, no post inc
	ManagementPHYWrite(REG_PHY_ADDAR, regval);
}

/**
	@brief Reads a register from a DP83867
 */
uint16_t SGMIIPHYRead(uint8_t phyid, uint8_t regid)
{
	//Request the read
	g_fpga->BlockingWrite32(REG_DP_MDIO, (phyid << 21) | (regid << 16) | 0x20000000);

	//Poll until busy flag is cleared
	while(true)
	{
		auto reply = g_fpga->BlockingRead32(REG_DP_MDIO);
		if( (reply & 0x80000000) == 0)
			return reply & 0xffff;
	}
}

/**
	@brief Writes a register to a DP83867
 */
void SGMIIPHYWrite(uint8_t phyid, uint8_t regid, uint16_t regval)
{
	//Request the write
	g_fpga->BlockingWrite32(REG_DP_MDIO, (phyid << 21) | (regid << 16) | 0x40000000 | regval );

	//Poll until busy flag is cleared
	while(true)
	{
		auto reply = g_fpga->BlockingRead32(REG_DP_MDIO);
		if( (reply & 0x80000000) == 0)
			return;
	}
}

/**
	@brief Reads an extended register from a DP83867
 */
uint16_t SGMIIPHYExtendedRead(uint8_t phyid, uint8_t mmd, uint8_t regid)
{
	SGMIIPHYWrite(phyid, REG_PHY_REGCR, mmd);			//set address
	SGMIIPHYWrite(phyid, REG_PHY_ADDAR, regid);
	SGMIIPHYWrite(phyid, REG_PHY_REGCR, 0x4000 | mmd);	//data, no post inc
	return SGMIIPHYRead(phyid, REG_PHY_ADDAR);
}

/**
	@brief Writes an extended register to a DP83867
 */
void SGMIIPHYExtendedWrite(uint8_t phyid, uint16_t regid, uint16_t regval)
{
	SGMIIPHYWrite(phyid, REG_PHY_REGCR, 0x1f);		//set address, DEVAD = 5'b11111
	SGMIIPHYWrite(phyid, REG_PHY_ADDAR, regid);
	SGMIIPHYWrite(phyid, REG_PHY_REGCR, 0x401f);	//data, no post inc, DEVAD = 5'b11111
	SGMIIPHYWrite(phyid, REG_PHY_ADDAR, regval);
}

/**
	@brief Reads a register from the VSC8512
 */
uint16_t QSGMIIPHYRead(uint8_t phyid, uint8_t regid)
{
	//Request the read
	g_fpga->BlockingWrite32(REG_VSC_MDIO, (phyid << 21) | (regid << 16) | 0x20000000);

	//Poll until busy flag is cleared
	while(true)
	{
		auto reply = g_fpga->BlockingRead32(REG_VSC_MDIO);
		if( (reply & 0x80000000) == 0)
			return reply & 0xffff;
	}
}

void QSGMIIPHYWrite(uint8_t phyid, uint8_t regid, uint16_t regval)
{
	//Request the write
	g_fpga->BlockingWrite32(REG_VSC_MDIO, (phyid << 21) | (regid << 16) | 0x40000000 | regval );

	//Poll until busy flag is cleared
	while(true)
	{
		auto reply = g_fpga->BlockingRead32(REG_VSC_MDIO);
		if( (reply & 0x80000000) == 0)
			return;
	}
}

/**
	@brief Reads an extended register from the VSC8512
 */
uint16_t QSGMIIPHYExtendedRead(uint8_t phyid, uint8_t mmd, uint8_t regid)
{
	QSGMIIPHYWrite(phyid, REG_PHY_REGCR, mmd);			//set address
	QSGMIIPHYWrite(phyid, REG_PHY_ADDAR, regid);
	QSGMIIPHYWrite(phyid, REG_PHY_REGCR, 0x4000 | mmd);	//data, no post inc
	return QSGMIIPHYRead(phyid, REG_PHY_ADDAR);
}

/**
	@brief Writes an extended register to the VSC8512
 */
void QSGMIIPHYExtendedWrite(uint8_t phyid, uint8_t mmd, uint8_t regid, uint16_t regval)
{
	QSGMIIPHYWrite(phyid, REG_PHY_REGCR, mmd);			//set address
	QSGMIIPHYWrite(phyid, REG_PHY_ADDAR, regid);
	QSGMIIPHYWrite(phyid, REG_PHY_REGCR, 0x4000 | mmd);	//data, no post inc
	QSGMIIPHYWrite(phyid, REG_PHY_ADDAR, regval);
}

/**
	@brief Read-modify-write transaction to update bitfields within a register
 */
void QSGMIIPHYWriteMasked(uint8_t phyid, uint8_t regid, uint16_t regval, uint16_t mask)
{
	uint16_t val = QSGMIIPHYRead(phyid, regid);
	QSGMIIPHYWrite(phyid, regid, (val & ~mask) | (regval & mask) );
}

/**
	@brief Wrapper to call the right MDIO read for the given interface
 */
uint16_t InterfacePHYRead(uint8_t portnum, uint8_t regid)
{
	if( (portnum == UPLINK_PORT) || (portnum >= NUM_PORTS))
	{
		g_log(Logger::ERROR, "InterfacePHYRead called with invalid port number %d\n", portnum);
		return 0;
	}

	switch(portnum)
	{
		case MGMT_PORT:
			return ManagementPHYRead(regid);

		case 13:
			return SGMIIPHYRead(1, regid);

		case 12:
			return SGMIIPHYRead(0, regid);

		default:
			return QSGMIIPHYRead(portnum, regid);
	}
}

/**
	@brief Wrapper to call the right extended read command for the given interface
 */
uint16_t InterfacePHYExtendedRead(uint8_t portnum, uint8_t mmd, uint8_t regid)
{
	if( (portnum == UPLINK_PORT) || (portnum >= NUM_PORTS))
	{
		g_log(Logger::ERROR, "InterfacePHYExtendedRead called with invalid port number %d\n", portnum);
		return 0;
	}

	switch(portnum)
	{
		case MGMT_PORT:
			return ManagementPHYExtendedRead(mmd, regid);

		case 13:
			return SGMIIPHYExtendedRead(1, mmd, regid);

		case 12:
			return SGMIIPHYExtendedRead(0, mmd, regid);

		default:
			return QSGMIIPHYExtendedRead(portnum, mmd, regid);
	}
}

/**
	@brief Wrapper to call the right MDIO write for the given interface
 */
void InterfacePHYWrite(uint8_t portnum, uint8_t regid, uint16_t regval)
{
	if( (portnum == UPLINK_PORT) || (portnum >= NUM_PORTS))
	{
		g_log(Logger::ERROR, "InterfacePHYWrite called with invalid port number %d\n", portnum);
		return;
	}

	switch(portnum)
	{
		case MGMT_PORT:
			ManagementPHYWrite(regid, regval);
			break;

		case 13:
			SGMIIPHYWrite(1, regid, regval);
			break;

		case 12:
			SGMIIPHYWrite(0, regid, regval);
			break;

		default:
			QSGMIIPHYWrite(portnum, regid, regval);
			break;
	}
}

/**
	@brief Wrapper to call the right extended write command for the given interface
 */
void InterfacePHYExtendedWrite(uint8_t portnum, uint8_t mmd, uint8_t regid, uint16_t regval)
{
	if( (portnum == UPLINK_PORT) || (portnum >= NUM_PORTS))
	{
		g_log(Logger::ERROR, "InterfacePHYExtendedWrite called with invalid port number %d\n", portnum);
		return;
	}

	switch(portnum)
	{
		case MGMT_PORT:
			ManagementPHYExtendedWrite(mmd, regid, regval);
			break;

		case 13:
			SGMIIPHYExtendedWrite(1, regid, regval);
			break;

		case 12:
			SGMIIPHYExtendedWrite(0, regid, regval);
			break;

		default:
			QSGMIIPHYExtendedWrite(portnum, mmd, regid, regval);
			break;
	}
}

/**
	@brief Poll the PHYs for link state changes

	TODO: use IRQ pin to trigger this vs doing it nonstop?
 */
void PollPHYs()
{
	for(int i=0; i<NUM_PORTS; i++)
	{
		//DEBUG: upper QSGMII PHYs not working yet
		if( (i >= 8) && (i <= 11) )
			continue;

		if(i == UPLINK_PORT)
		{
			//TODO: get 10G SFP+ link status
		}

		else
		{
			uint16_t bctl = InterfacePHYRead(i, REG_BASIC_CONTROL);
			uint16_t bstat = InterfacePHYRead(i, REG_BASIC_STATUS);
			UpdateLinkState(i, bctl, bstat);
		}
	}
}

/**
	@brief Update the state of a link given PHY basic control / status registers
 */
void UpdateLinkState(uint8_t port, uint16_t bctl, uint16_t bstat)
{
	//if port is not up or down, ignore updates
	if( (g_linkState[port] != LINK_STATE_UP) && (g_linkState[port] != LINK_STATE_DOWN) )
		return;

	//Get current state
	linkspeed_t speed = LINK_SPEED_10M;
	switch(bctl & BCTL_SPEED_MASK)
	{
		case BCTL_SPEED_1G:
			speed = LINK_SPEED_1G;
			break;

		case BCTL_SPEED_100M:
			speed = LINK_SPEED_100M;
			break;

		case BCTL_SPEED_10M:
		default:
			speed = LINK_SPEED_10M;
			break;
	}

	linkstate_t newState = (bstat & BSTAT_LINK_STATE_UP) ? LINK_STATE_UP : LINK_STATE_DOWN;

	//See if it's changed
	if( (newState != g_linkState[port]) ||
		( (speed != g_linkSpeed[port]) && (g_linkState[port] == LINK_STATE_UP) ) )
	{
		g_linkState[port] = newState;
		g_linkSpeed[port] = speed;

		if(newState == LINK_STATE_DOWN)
			g_log("Interface %s (%s): link is down\n", g_interfaceNames[port], g_interfaceDescriptions[port]);
		else
		{
			g_log("Interface %s (%s): link is up at %s\n",
				g_interfaceNames[port],
				g_interfaceDescriptions[port],
				g_linkSpeedNamesLong[speed]);
		}
	}
}
