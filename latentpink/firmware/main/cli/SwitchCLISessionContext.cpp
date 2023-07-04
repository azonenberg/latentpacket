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
#include <algorithm>
#include "SwitchCLISessionContext.h"

static const char* hostname_objid = "hostname";

//List of all valid commands
enum cmdid_t
{
	CMD_EXIT,
	CMD_HOSTNAME,
	CMD_SHOW,
	CMD_IP,
	CMD_ADDRESS,
	CMD_FOO,
	CMD_BAR,
	CMD_BAZ
};

static const clikeyword_t g_hostnameCommands[] =
{
	{"<string>",	FREEFORM_TOKEN,		nullptr,	"New host name"},
	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

static const clikeyword_t g_ipCommands[] =
{
	{"address",		CMD_ADDRESS,		nullptr,	"ip help"},

	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

static const clikeyword_t g_showCommands[] =
{
	{"foo",			CMD_FOO,			nullptr,	"Look at foo"},
	{"bar",			CMD_BAR,			nullptr,	"Look at bar"},
	{"baz",			CMD_BAZ,			nullptr,	"Look at baz"},

	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};


//The top level command list
static const clikeyword_t g_rootCommands[] =
{
	{"exit",		CMD_EXIT,			nullptr,				"Log out"},
	{"hostname",	CMD_HOSTNAME,		g_hostnameCommands,		"Change the host name"},
	{"ip",			CMD_IP,				g_ipCommands,			"Configure IP addresses"},
	{"show",		CMD_SHOW,			g_showCommands,			"Print information"},

	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

SwitchCLISessionContext::SwitchCLISessionContext()
	: CLISessionContext(g_rootCommands)
{
	//Read hostname, set to default value if not found
	auto hlog = g_kvs->FindObject(hostname_objid);
	if(hlog)
		strncpy(m_hostname, (const char*)g_kvs->MapObject(hlog), std::min((size_t)hlog->m_len, sizeof(m_hostname)-1));
	else
		strncpy(m_hostname, "switch", sizeof(m_hostname)-1);
}

void SwitchCLISessionContext::PrintPrompt()
{
	m_stream->Printf("%s@%s$ ", m_username, m_hostname);
	m_stream->Flush();
}

void SwitchCLISessionContext::OnExecute()
{
	switch(m_command[0].m_commandID)
	{
		case CMD_EXIT:
			m_stream->Flush();
			//m_stream.GetServer()->GracefulDisconnect(m_stream.GetSessionID(), m_stream.GetSocket());
			#ifdef SIMULATION
				exit(0);
			#endif
			break;

		case CMD_HOSTNAME:
			strncpy(m_hostname, m_command[1].m_text, sizeof(m_hostname)-1);

			if(!g_kvs->StoreObject(hostname_objid, (uint8_t*)m_hostname, strlen(m_hostname)))
				m_stream->Printf("KVS write error\n");
			break;

		/*
		case CMD_IP:
			m_stream.Printf("set ip\n");
			break;

		case CMD_SHOW:
			switch(m_command[1].m_commandID)
			{
				case CMD_FOO:
					m_stream.Printf("showing foo\n");
					break;

				case CMD_BAR:
					m_stream.Printf("showing bar\n");
					break;

				case CMD_BAZ:
					m_stream.Printf("showing baz\n");
					break;
			}
			break;
		*/

		default:
			m_stream->Printf("Unrecognized command\n");
			break;
	}

	m_stream->Flush();
}
