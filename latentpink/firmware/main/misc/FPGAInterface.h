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

#ifndef fpgainterface_h
#define fpgainterface_h

class FPGAInterface
{
public:
	virtual ~FPGAInterface()
	{}

	virtual void Nop()
	{};

	#ifdef SIMULATION
	/**
		@brief Advance simulation time until the crypto engine has finished
	 */
	virtual void CryptoEngineBlock()
	{}
	#endif

	virtual void BlockingRead(uint32_t insn, uint8_t* data, uint32_t len) = 0;
	virtual void BlockingWrite(uint32_t insn, const uint8_t* data, uint32_t len) = 0;

	uint32_t BlockingRead32(uint32_t insn)
	{
		uint32_t data;
		BlockingRead(insn, reinterpret_cast<uint8_t*>(&data), sizeof(data));
		return data;
	}

	uint8_t BlockingRead8(uint32_t insn)
	{
		uint8_t data;
		BlockingRead(insn, reinterpret_cast<uint8_t*>(&data), sizeof(data));
		return data;
	}

	uint16_t BlockingRead16(uint32_t insn)
	{
		uint16_t data;
		BlockingRead(insn, reinterpret_cast<uint8_t*>(&data), sizeof(data));
		return data;
	}

	void BlockingWrite16(uint32_t insn, uint16_t data)
	{ BlockingWrite(insn, reinterpret_cast<uint8_t*>(&data), sizeof(data)); }

};

//must match regid_t in ManagementRegisterInterface.sv
enum regid_t
{
	REG_FPGA_IDCODE		= 0x0000,
	REG_FPGA_SERIAL		= 0x0004,
	REG_FAN0_RPM		= 0x0010,
	REG_FAN1_RPM		= 0x0012,
	REG_DIE_TEMP		= 0x0014,
	REG_VOLT_CORE		= 0x0016,
	REG_VOLT_RAM		= 0x0018,
	REG_VOLT_AUX		= 0x001a,

	REG_CRYPT_BASE		= 0x3800,
	REG_INTERFACE_BASE	= 0x4000
};

enum regconsts
{
	INTERFACE_STRIDE	= 0x0400
};

enum ifregid_t
{
	REG_VLAN_NUM		= 0x0000,
	REG_TAG_MODE		= 0x0002
};

enum cryptreg_t
{
	REG_WORK			= 0x0000,
	REG_E				= 0x0020,
	REG_CRYPT_STATUS	= 0x0040,
	REG_WORK_OUT		= 0x0060
};

#endif
