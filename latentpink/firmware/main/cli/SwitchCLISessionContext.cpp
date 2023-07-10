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
#include <ctype.h>

static const char* hostname_objid = "hostname";

//List of all valid commands
enum cmdid_t
{
	CMD_ADDRESS,
	CMD_COMMIT,
	CMD_DETAIL,
	CMD_END,
	CMD_EXIT,
	CMD_FLASH,
	CMD_INTERFACE,
	CMD_IP,
	CMD_HOSTNAME,
	CMD_ROLLBACK,
	CMD_SHOW,
	CMD_STATUS,
	CMD_VERSION,
	CMD_VLAN,

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

static const clikeyword_t g_showFlashDetailCommands[] =
{
	{"<objname>",	FREEFORM_TOKEN,		nullptr,	"Name of the flash object to display"},
	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

static const clikeyword_t g_showFlashCommands[] =
{
	{"<cr>",		OPTIONAL_TOKEN,		nullptr,					""},
	{"detail",		CMD_DETAIL,			g_showFlashDetailCommands,	"Show detailed flash object contents"},
	{nullptr,		INVALID_COMMAND,	nullptr,					nullptr}
};

static const clikeyword_t g_showCommands[] =
{
	{"flash",		CMD_FLASH,			g_showFlashCommands,		"Display flash usage and log data"},
	{"interface",	CMD_INTERFACE,		g_showInterfaceCommands,	"Display interface properties and stats"},
	{"version",		CMD_VERSION,		nullptr,					"Show firmware / FPGA version"},
	{nullptr,		INVALID_COMMAND,	nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "vlan"

static const clikeyword_t g_vlanCommands[] =
{
	{"<1-4095>",	FREEFORM_TOKEN,		nullptr,	"VLAN number to assign"},
	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Top level command lists

//Top level commands in root mode
static const clikeyword_t g_rootCommands[] =
{
	{"commit",		CMD_COMMIT,			nullptr,				"Commit volatile config changes to flash memory"},
	{"exit",		CMD_EXIT,			nullptr,				"Log out"},
	{"hostname",	CMD_HOSTNAME,		g_hostnameCommands,		"Change the host name"},
	{"interface",	CMD_INTERFACE,		g_interfaceCommands,	"Configure interface properties"},
	{"ip",			CMD_IP,				g_ipCommands,			"Configure IP addresses"},
	{"rollback",	CMD_ROLLBACK,		nullptr,				"Revert all changes made since last commit"},
	{"show",		CMD_SHOW,			g_showCommands,			"Print information"},

	{nullptr,		INVALID_COMMAND,	nullptr,				nullptr}
};

//Top level commands in interface mode
static const clikeyword_t g_interfaceRootCommands[] =
{
	{"end",			CMD_END,			nullptr,				"Return to normal mode"},
	{"exit",		CMD_EXIT,			nullptr,				"Return to normal mode"},
	{"interface",	CMD_INTERFACE,		g_interfaceCommands,	"Configure another interface"},
	{"vlan",		CMD_VLAN,			g_vlanCommands,			"Configure interface VLAN"},
	{nullptr,		INVALID_COMMAND,	nullptr,				nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Main CLI code

SwitchCLISessionContext::SwitchCLISessionContext()
	: CLISessionContext(g_rootCommands)
	, m_activeInterface(0)
{
	LoadHostname();
}

void SwitchCLISessionContext::PrintPrompt()
{
	if(m_rootCommands == g_interfaceRootCommands)
		m_stream->Printf("%s@%s(int-%s)# ", m_username, m_hostname, g_interfaceNames[m_activeInterface]);
	else //if(m_rootCommands == g_rootCommands)
		m_stream->Printf("%s@%s# ", m_username, m_hostname);
	m_stream->Flush();
}

void SwitchCLISessionContext::LoadHostname()
{
	memset(m_hostname, 0, sizeof(m_hostname));

	//Read hostname, set to default value if not found
	auto hlog = g_kvs->FindObject(hostname_objid);
	if(hlog)
		strncpy(m_hostname, (const char*)g_kvs->MapObject(hlog), std::min((size_t)hlog->m_len, sizeof(m_hostname)-1));
	else
		strncpy(m_hostname, "switch", sizeof(m_hostname)-1);
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

		case CMD_VLAN:
			OnVlan();
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
		case CMD_COMMIT:
			OnCommit();
			break;

		case CMD_EXIT:
			m_stream->Flush();

			//SSH session? Close the socket
			if(m_stream == &m_sshstream)
				m_sshstream.GetServer()->GracefulDisconnect(m_sshstream.GetSessionID(), m_sshstream.GetSocket());

			//Local console? Nothing needed on real hardware
			//but in simulation, we need to terminate
			else
			{
				#ifdef SIMULATION
					OnShutdown();
					exit(0);
				#endif
			}
			break;

		case CMD_HOSTNAME:
			strncpy(m_hostname, m_command[1].m_text, sizeof(m_hostname)-1);
			break;

		case CMD_INTERFACE:
			OnInterfaceCommand();
			break;

		/*
		case CMD_IP:
			m_stream.Printf("set ip\n");
			break;
		*/

		case CMD_ROLLBACK:
			OnRollback();
			break;

		case CMD_SHOW:
			OnShowCommand();
			break;

		default:
			m_stream->Printf("Unrecognized command\n");
			break;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "commit"

void SwitchCLISessionContext::OnCommit()
{
	//Save interface configuration
	for(int i=0; i<NUM_PORTS; i=i+1)
	{
		//VLAN number for everything but management
		if(i != MGMT_PORT)
		{
			if(!g_kvs->StoreObjectIfNecessary<uint16_t>(g_portVlans[i], 1, "%s.vlan", g_interfaceNames[i]))
				m_stream->Printf("KVS write error\n");
		}
	}

	//Check if we already have the same hostname stored
	auto hlog = g_kvs->FindObject(hostname_objid);
	bool needToStoreHostname = true;
	if(hlog)
	{
		auto oldhost = (const char*)g_kvs->MapObject(hlog);
		if( (strlen(m_hostname) == hlog->m_len) && (!strncmp(m_hostname, oldhost, hlog->m_len)) )
			needToStoreHostname = false;

	}

	//if not found, store it
	if(needToStoreHostname)
	{
		if(!g_kvs->StoreObject(hostname_objid, (uint8_t*)m_hostname, strlen(m_hostname)))
			m_stream->Printf("KVS write error\n");
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
// "rollback"

void SwitchCLISessionContext::OnRollback()
{
	//Load and apply interface configuration
	ConfigureInterfaces();

	//Load our hostname
	LoadHostname();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "show"

void SwitchCLISessionContext::OnShowCommand()
{
	switch(m_command[1].m_commandID)
	{
		case CMD_FLASH:
			OnShowFlash();
			break;

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

void SwitchCLISessionContext::OnShowFlash()
{
	//No details requested? Show root dir listing
	if(m_command[2].m_commandID == OPTIONAL_TOKEN)
	{
		//Print info about the flash memory in general
		m_stream->Printf("Flash configuration storage is 2 banks of %d kB\n", g_kvs->GetBlockSize() / 1024);
		if(g_kvs->IsLeftBankActive())
			m_stream->Printf("    Active bank: Left\n");
		else
			m_stream->Printf("    Active bank: Right\n");
		m_stream->Printf("    Log area:    %6d / %6d entries free (%d %%)\n",
			g_kvs->GetFreeLogEntries(),
			g_kvs->GetLogCapacity(),
			g_kvs->GetFreeLogEntries()*100 / g_kvs->GetLogCapacity());
		m_stream->Printf("    Data area:   %6d / %6d kB free      (%d %%)\n",
			g_kvs->GetFreeDataSpace() / 1024,
			g_kvs->GetDataCapacity() / 1024,
			g_kvs->GetFreeDataSpace() * 100 / g_kvs->GetDataCapacity());

		//Dump directory listing
		const uint32_t nmax = 256;
		KVSListEntry list[nmax];
		uint32_t nfound = g_kvs->EnumObjects(list, nmax);
		m_stream->Printf("    Objects:\n");
		m_stream->Printf("        Key               Size  Revisions\n");
		int size = 0;
		for(uint32_t i=0; i<nfound; i++)
		{
			m_stream->Printf("        %-16s %5d  %d\n", list[i].key, list[i].size, list[i].revs);
			size += list[i].size;
		}
		m_stream->Printf("    %d objects total (%d.%02d kB)\n",
			nfound,
			size/1024, (size % 1024) * 100 / 1024);
	}

	//Showing details of a single object
	else
	{
		auto hlog = g_kvs->FindObject(m_command[3].m_text);
		if(!hlog)
		{
			m_stream->Printf("Object not found\n");
			return;
		}

		//TODO: show previous versions too?
		m_stream->Printf("Object \"%s\":\n", m_command[3].m_text);
		{
			m_stream->Printf("    Start:  0x%08x\n", hlog->m_start);
			m_stream->Printf("    Length: 0x%08x\n", hlog->m_len);
			m_stream->Printf("    CRC32:  0x%08x\n", hlog->m_crc);
		}

		auto pdata = g_kvs->MapObject(hlog);

		//TODO: make this a dedicated hexdump routine
		const int linelen = 16;
		for(int i=0; i<hlog->m_len; i += linelen)
		{
			m_stream->Printf("%04x   ", i);

			//Print hex
			for(int j=0; j<linelen; j++)
			{
				//Pad with spaces so we get good alignment on the end of the block
				if(i+j >= hlog->m_len)
					m_stream->Printf("   ");

				else
					m_stream->Printf("%02x ", pdata[i+j]);
			}

			m_stream->Printf("  ");

			//Print ASCII
			for(int j=0; j<linelen; j++)
			{
				//No padding needed here
				if(i+j >= hlog->m_len)
					break;

				else if(isprint(pdata[i+j]))
					m_stream->Printf("%c", pdata[i+j]);
				else
					m_stream->Printf(".");
			}

			m_stream->Printf("\n");
		}
	}
}

void SwitchCLISessionContext::OnShowInterfaceStatus()
{
	m_stream->Printf("---------------------------------------------------------------------------------------------------------\n");
	m_stream->Printf("Port     Name                             Status            Vlan     Duplex    Speed                 Type\n");
	m_stream->Printf("---------------------------------------------------------------------------------------------------------\n");

	//TODO: refresh interface status from hardware or something
	for(int i=0; i<NUM_PORTS; i++)
	{
		const char* portType = "10/100/1000baseT";
		if(i == UPLINK_PORT)
			portType = "10Gbase-SR";

		if(i == MGMT_PORT)
		{
			m_stream->Printf("%-5s    %-32s %-15s %6s %10s  %7s %20s\n",
				g_interfaceNames[i],
				g_interfaceDescriptions[i],
				g_linkStateNames[g_linkState[i]],
				"(none)",
				"full",
				g_linkSpeedNames[g_linkSpeed[i]],
				portType);
		}
		else
		{
			m_stream->Printf("%-5s    %-32s %-15s %6d %10s  %7s %20s\n",
				g_interfaceNames[i],
				g_interfaceDescriptions[i],
				g_linkStateNames[g_linkState[i]],
				g_portVlans[i],
				"full",
				g_linkSpeedNames[g_linkSpeed[i]],
				portType);
		}
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "vlan"

void SwitchCLISessionContext::OnVlan()
{
	//Validate
	uint16_t vlanNum = atoi(m_command[1].m_text);
	if( (vlanNum < 1) || (vlanNum > 4095) )
	{
		m_stream->Printf("Invalid VLAN number\n");
		return;
	}

	//Update our local config and push to hardware
	g_portVlans[m_activeInterface] = vlanNum;
	g_fpga->BlockingWrite16(GetInterfaceBase() + REG_VLAN_NUM, vlanNum);
}
