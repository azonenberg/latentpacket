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
#include "ManagementSSHTransportServer.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Construction / destruction

ManagementSSHTransportServer::ManagementSSHTransportServer(TCPProtocol& tcp)
	: SSHTransportServer(tcp)
{
	//Initialize crypto engines
	for(size_t i=0; i<SSH_TABLE_SIZE; i++)
	{
		#ifdef SIMULATION
			m_state[i].m_crypto = new SimCryptoEngine;
		#else
			#error STM32 crypto not yet implemented
		#endif
	}

	UsePasswordAuthenticator(&m_auth);
}

ManagementSSHTransportServer::~ManagementSSHTransportServer()
{
	//Clean up crypto state
	for(size_t i=0; i<SSH_TABLE_SIZE; i++)
	{
		delete m_state[i].m_crypto;
		m_state[i].m_crypto = NULL;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Run a trivial shell

void ManagementSSHTransportServer::InitializeShell(int id, TCPTableEntry* socket)
{
	m_context[id].Initialize(id, socket, this, m_state[id].m_username);
	m_context[id].PrintPrompt();
}

void ManagementSSHTransportServer::OnRxShellData(int id, TCPTableEntry* /*socket*/, char* data, uint16_t len)
{
	for(uint16_t i=0; i<len; i++)
		m_context[id].OnKeystroke(data[i]);
}
