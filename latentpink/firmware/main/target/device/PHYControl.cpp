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
	@brief Reads a register from the management PHY
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
