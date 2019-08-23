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

#ifndef LatentRedManagementBoard_h
#define LatentRedManagementBoard_h

/**
	@brief THe INTEGRALSTICK module for management (contains the management port only)
 */
class LatentRedManagementBoard : public Board
{
public:
	LatentRedManagementBoard();
	virtual ~LatentRedManagementBoard();

	virtual const char* GetDescription();

	virtual void PrintCPUInfo(UART* uart);
	virtual void PrintFPGAInfo(UART* uart);
	virtual void PrintSensorInfo(UART* uart);

	virtual uint32_t GetPortCount();
	virtual Port* GetPort(uint32_t i);

	//DEBUG
	UART* GetUART()
	{ return &m_uart; }

protected:

	enum
	{
		OP_NOP			= 0x0000,	//Do nothing, no reply
		OP_ECHO			= 0x0001,	//Do nothing, reply with 0x55

		OP_DEVICE_ID	= 0x0002,	//no arguments, FPGA responds with our 32-bit JTAG IDCODE
		OP_FPGA_SERIAL	= 0x0003,	//no arguments, FPGA responds with our DNA extended to 64 bits

		OP_DIE_TEMP		= 0x0004,	//no arguments, FPGA responds with die temperature in 8.8 fixed point degC
		OP_VOLT_CORE	= 0x0005,	//no arguments, FPGA responds with VCCINT value in 8.8 fixed point volts
		OP_VOLT_RAM		= 0x0006,	//no arguments, FPGA responds with VCCBRAM value in 8.8 fixed point volts
		OP_VOLT_AUX		= 0x0007,	//no arguments, FPGA responds with VCCAUX value in 8.8 fixed point volts
		OP_PSU_TEMP		= 0x0008,	//no arguments, FPGA responds with LTC3374 temperature as raw ADC voltage
									//(FFF = 1V)

		OP_COUNT					//number of legal opcodes, must be last

	} opcode_t;

	LatentRedManagementPort m_mgmtPort;
	UART m_uart;
};

#endif
