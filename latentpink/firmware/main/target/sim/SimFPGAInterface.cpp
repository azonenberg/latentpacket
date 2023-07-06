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
#include "SimFPGAInterface.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Construction / destruction

SimFPGAInterface::SimFPGAInterface()
{
	//TODO: ensure these exist and are fifo devices
	//Must open in this order

	g_log("Initializing interface to FPGA simulation\n");
	LogIndenter li(g_log);

	m_fpRead = fopen("/tmp/sim-write-pipe", "r");
	if(!m_fpRead)
	{
		perror("fail to open sim-write-pipe");
		exit(1);
	}

	m_fpWrite = fopen("/tmp/sim-read-pipe", "w");
	if(!m_fpWrite)
	{
		perror("fail to open sim-read-pipe");
		exit(1);
	}

	//Send a bunch of NOPs during init
	for(int i=0; i<10; i++)
		Nop();

	g_log("Simulation bridge is up\n");
}

SimFPGAInterface::~SimFPGAInterface()
{
	fclose(m_fpWrite);
	fclose(m_fpRead);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Data I/O

/**
	@brief Do nothing, but keep simulation time flowing
 */
void SimFPGAInterface::Nop()
{
	fprintf(m_fpWrite, "nop\n");
	fflush(m_fpWrite);
}

void SimFPGAInterface::BlockingRead(uint32_t insn, uint8_t* data, uint32_t len)
{
	//Write the "read data" request
	fprintf(m_fpWrite, "read\n%d %d\n", insn, len);
	fflush(m_fpWrite);

	//Get the reply back
	unsigned int tmp;
	for(uint32_t i=0; i<len; i++)
	{
		fscanf(m_fpRead, "%x", &tmp);
		data[i] = tmp;
	}
}
