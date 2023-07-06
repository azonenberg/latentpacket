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
	CMD_ADDRESS,
	CMD_END,
	CMD_EXIT,
	CMD_INTERFACE,
	CMD_IP,
	CMD_HOSTNAME,
	CMD_SHOW,
	CMD_STATUS,
	CMD_VERSION,

	//must be in order separately outside the alphabetical block
	//so we can just add/subtract CMD_G0 to get an interface number
	CMD_G0,
	CMD_G1,
	CMD_G2,
	CMD_G3,
	CMD_G4,
	CMD_G5,
	CMD_G6,
	CMD_G7,
	CMD_G8,
	CMD_G9,
	CMD_G10,
	CMD_G11,
	CMD_G12,
	CMD_G13,
	CMD_MGMT0,
	CMD_XG0
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "hostname"

static const clikeyword_t g_hostnameCommands[] =
{
	{"<string>",	FREEFORM_TOKEN,		nullptr,	"New host name"},
	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "interface"

static const clikeyword_t g_interfaceCommands[] =
{
	{"g0",			CMD_G0,				nullptr,	"Gigabit0"},
	{"g1",			CMD_G1,				nullptr,	"Gigabit1"},
	{"g2",			CMD_G2,				nullptr,	"Gigabit2"},
	{"g3",			CMD_G3,				nullptr,	"Gigabit3"},
	{"g4",			CMD_G4,				nullptr,	"Gigabit4"},
	{"g5",			CMD_G5,				nullptr,	"Gigabit5"},
	{"g6",			CMD_G6,				nullptr,	"Gigabit6"},
	{"g7",			CMD_G7,				nullptr,	"Gigabit7"},
	{"g8",			CMD_G8,				nullptr,	"Gigabit8"},
	{"g9",			CMD_G9,				nullptr,	"Gigabit9"},
	{"g10",			CMD_G10,			nullptr,	"Gigabit10"},
	{"g11",			CMD_G11,			nullptr,	"Gigabit11"},
	{"g12",			CMD_G12,			nullptr,	"Gigabit12"},
	{"g13",			CMD_G13,			nullptr,	"Gigabit13"},
	{"mgmt0",		CMD_MGMT0,			nullptr,	"Management0"},
	{"xg0",			CMD_XG0,			nullptr,	"10Gigabit0"},

	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "ip"

static const clikeyword_t g_ipCommands[] =
{
	{"address",		CMD_ADDRESS,		nullptr,	"TODO implement this"},

	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "show"

static const clikeyword_t g_showInterfaceCommands[] =
{
	{"status",		CMD_STATUS,			nullptr,	"Display summary of all network interfaces"},
	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

static const clikeyword_t g_showCommands[] =
{
	{"interface",	CMD_INTERFACE,		g_showInterfaceCommands,	"Display interface properties and stats"},
	{"version",		CMD_VERSION,		nullptr,					"Show firmware / FPGA version"},
	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Top level command lists

//Top level commands in root mode
static const clikeyword_t g_rootCommands[] =
{
	{"exit",		CMD_EXIT,			nullptr,				"Log out"},
	{"hostname",	CMD_HOSTNAME,		g_hostnameCommands,		"Change the host name"},
	{"interface",	CMD_INTERFACE,		g_interfaceCommands,	"Configure interface properties"},
	{"ip",			CMD_IP,				g_ipCommands,			"Configure IP addresses"},
	{"show",		CMD_SHOW,			g_showCommands,			"Print information"},

	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

//Top level commands in interface mode
static const clikeyword_t g_interfaceRootCommands[] =
{
	{"end",			CMD_END,			nullptr,				"Return to normal mode"},
	{"exit",		CMD_EXIT,			nullptr,				"Return to normal mode"},
	{"interface",	CMD_INTERFACE,		g_interfaceCommands,	"Configure interface properties"},
	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Main CLI code

SwitchCLISessionContext::SwitchCLISessionContext()
	: CLISessionContext(g_rootCommands)
	, m_activeInterface(0)
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
	if(m_rootCommands == g_interfaceRootCommands)
		m_stream->Printf("%s@%s(int-%s)# ", m_username, m_hostname, g_interfaceNames[m_activeInterface]);
	else //if(m_rootCommands == g_rootCommands)
		m_stream->Printf("%s@%s# ", m_username, m_hostname);
	m_stream->Flush();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Top level command dispatcher

void SwitchCLISessionContext::OnExecute()
{
	if(m_rootCommands == g_interfaceRootCommands)
		OnExecuteInterface();

	else //if(m_rootCommands == g_rootCommands)
		OnExecuteRoot();

	m_stream->Flush();
}

/**
	@brief Execute a command in config-interface mode
 */
void SwitchCLISessionContext::OnExecuteInterface()
{
	switch(m_command[0].m_commandID)
	{
		//Return to top level config mode
		case CMD_END:
		case CMD_EXIT:
			m_rootCommands = g_rootCommands;
			break;

		//Can always change interface even if in interface mode already
		case CMD_INTERFACE:
			OnInterfaceCommand();
			break;

		//All show commands are valid here
		//TODO: some special ones too?
		case CMD_SHOW:
			OnShowCommand();
			break;

		default:
			m_stream->Printf("Unrecognized command\n");
			break;
	}
}

/**
	@brief Execute a command in config mode
 */
void SwitchCLISessionContext::OnExecuteRoot()
{
	switch(m_command[0].m_commandID)
	{
		case CMD_EXIT:
			m_stream->Flush();
			//m_stream.GetServer()->GracefulDisconnect(m_stream.GetSessionID(), m_stream.GetSocket());
			#ifdef SIMULATION
				OnShutdown();
				exit(0);
			#endif
			break;

		case CMD_HOSTNAME:
			strncpy(m_hostname, m_command[1].m_text, sizeof(m_hostname)-1);

			if(!g_kvs->StoreObject(hostname_objid, (uint8_t*)m_hostname, strlen(m_hostname)))
				m_stream->Printf("KVS write error\n");
			break;

		case CMD_INTERFACE:
			OnInterfaceCommand();
			break;

		/*
		case CMD_IP:
			m_stream.Printf("set ip\n");
			break;
		*/
		case CMD_SHOW:
			OnShowCommand();
			break;

		default:
			m_stream->Printf("Unrecognized command\n");
			break;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "interface"

void SwitchCLISessionContext::OnInterfaceCommand()
{
	m_activeInterface = (m_command[1].m_commandID - CMD_G0);

	if(m_activeInterface >= NUM_PORTS)
		m_activeInterface = NUM_PORTS-1;

	m_rootCommands = g_interfaceRootCommands;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "show"

void SwitchCLISessionContext::OnShowCommand()
{
	switch(m_command[1].m_commandID)
	{
		case CMD_INTERFACE:
			OnShowInterfaceCommand();
			break;

		case CMD_VERSION:
			OnShowVersion();
			break;

		default:
			m_stream->Printf("Unrecognized command\n");
			break;
	}
}

void SwitchCLISessionContext::OnShowInterfaceCommand()
{
	switch(m_command[2].m_commandID)
	{
		case CMD_STATUS:
			OnShowInterfaceStatus();
			break;

		default:
			m_stream->Printf("Unrecognized command\n");
			break;
	}
}

void SwitchCLISessionContext::OnShowInterfaceStatus()
{
	m_stream->Printf("-------------------------------------------------------------------------------------------------\n");
	m_stream->Printf("Port     Name                             Status          Duplex    Speed                    Type\n");
	m_stream->Printf("-------------------------------------------------------------------------------------------------\n");

	//TODO: refresh interface status from hardware or something
	for(int i=0; i<NUM_PORTS; i++)
	{
		const char* portType = "10/100/1000baseT";
		if(i == NUM_PORTS-1)
			portType = "10Gbase-SR";

		m_stream->Printf("%-5s    %-32s %-15s %-10s %4s    %20s\n",
			g_interfaceNames[i],
			g_interfaceDescriptions[i],
			g_linkStateNames[g_linkState[i]],
			"full",
			g_linkSpeedNames[g_linkSpeed[i]],
			portType);
	}
}

void SwitchCLISessionContext::OnShowVersion()
{
	m_stream->Printf("LATENTPINK Ethernet switch v0.1\n");
	m_stream->Printf("by Andrew D. Zonenberg\n");
	m_stream->Printf("\n");
	m_stream->Printf("This system is open hardware! Board design files and firmware/gateware source code are at:\n");
	m_stream->Printf("https://github.com/azonenberg/latentpacket\n");
	m_stream->Printf("\n");
	m_stream->Printf("Firmware compiled at %s on %s\n", __TIME__, __DATE__);
	#ifdef __GNUC__
	m_stream->Printf("Compiler: g++ %s\n", __VERSION__);
	m_stream->Printf("CLI source code last modified: %s\n", __TIMESTAMP__);
	#endif
}
