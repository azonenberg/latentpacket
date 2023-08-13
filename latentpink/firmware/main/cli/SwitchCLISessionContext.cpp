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
	CMD_10,
	CMD_100,
	CMD_1000,
	CMD_ADDRESS,
	CMD_AUTO,
	CMD_AUTONEGOTIATION,
	CMD_ARP,
	CMD_CACHE,
	CMD_COMMIT,
	CMD_COUNTERS,
	CMD_CROSSOVER,
	CMD_DESCRIPTION,
	CMD_DETAIL,
	CMD_DISTORTION,
	CMD_END,
	CMD_EXIT,
	CMD_FINGERPRINT,
	CMD_FLASH,
	CMD_GATEWAY,
	CMD_HARDWARE,
	CMD_HOSTNAME,
	CMD_INTERFACE,
	CMD_IP,
	CMD_JITTER,
	CMD_MASTER,
	CMD_MDI,
	CMD_MLT3,
	CMD_MMD,
	CMD_MODE,
	CMD_NO,
	CMD_PREFER,
	CMD_PULSE4,
	CMD_PULSE64,
	CMD_RELOAD,
	CMD_REGISTER,
	CMD_ROLLBACK,
	CMD_ROUTE,
	CMD_SET,
	CMD_SHOW,
	CMD_SLAVE,
	CMD_SPEED,
	CMD_SSH,
	CMD_STRAIGHT,
	CMD_STATUS,
	CMD_TEMPERATURE,
	CMD_TEST,
	CMD_TESTPATTERN,
	CMD_VERSION,
	CMD_VLAN,
	CMD_WAVEFORM_TEST,
	CMD_ZEROIZE,

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
	CMD_XG0,
	CMD_MGMT0
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "description"

static const clikeyword_t g_descriptionCommands[] =
{
	{"<string>",	TEXT_TOKEN,			nullptr,	"New description for the port"},
	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
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

static const clikeyword_t g_ipAddressCommands[] =
{
	{"<address>",	FREEFORM_TOKEN,		nullptr,				"New IPv4 address and subnet mask in x.x.x.x/yy format"},
	{nullptr,		INVALID_COMMAND,	nullptr,				nullptr}
};

static const clikeyword_t g_ipGatewayCommands[] =
{
	{"<address>",	FREEFORM_TOKEN,		nullptr,				"New IPv4 default gateway"},
	{nullptr,		INVALID_COMMAND,	nullptr,				nullptr}
};

static const clikeyword_t g_ipCommands[] =
{
	{"address",		CMD_ADDRESS,		g_ipAddressCommands,	"Set the IPv4 address of the device"},
	{"gateway",		CMD_GATEWAY,		g_ipGatewayCommands,	"Set the IPv4 default gateway of the device"},

	{nullptr,		INVALID_COMMAND,	nullptr,				nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "mdi"

static const clikeyword_t g_mdiCommands[] =
{
	{"auto",			CMD_AUTO,				nullptr,					"Auto MDI-X"},
	{"crossover",		CMD_CROSSOVER,			nullptr,					"MDI-X mode"},
	{"straight",		CMD_STRAIGHT,			nullptr,					"MDI mode"},
	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "mode"

static const clikeyword_t g_modeCommands[] =
{
	{"master",			CMD_MASTER,				nullptr,					"Master mode"},
	{"slave",			CMD_SLAVE,				nullptr,					"Slave mode"},
	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_preferModeCommands[] =
{
	{"prefer",			CMD_PREFER,				g_modeCommands,				"Specify preference"},
	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_allModeCommands[] =
{
	{"auto",			CMD_AUTO,				g_preferModeCommands,		"Negotiate master or slave mode"},
	{"master",			CMD_MASTER,				nullptr,					"Master mode"},
	{"slave",			CMD_SLAVE,				nullptr,					"Slave mode"},
	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "speed"

static const clikeyword_t g_interfaceSpeedCommands[] =
{
	{"10",				CMD_10,					nullptr,					"10baseT"},
	{"100",				CMD_100,				nullptr,					"100baseTX"},
	{"1000",			CMD_1000,				nullptr,					"1000baseT"},
	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "no" (interface mode)

static const clikeyword_t g_interfaceNoCommands[] =
{
	{"autonegotiation",	CMD_AUTONEGOTIATION,	nullptr,					"Disable autonegotiation"},
	{"speed",			CMD_SPEED,				g_interfaceSpeedCommands,	"Turn off advertisement of a specific speed"},
	{"testpattern",		CMD_TESTPATTERN,		nullptr,					"Stop sending test patterns"},

	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "set"

static const clikeyword_t g_setRegisterValues[] =
{
	{"<value>",			FREEFORM_TOKEN,			nullptr,					"Hexadecimal register value"},

	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_setRegisterCommands[] =
{
	{"<regid>",			FREEFORM_TOKEN,			g_setRegisterValues,		"Hexadecimal register address"},

	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_setMmdRegisterCommands[] =
{
	{"register",		CMD_REGISTER,			g_setRegisterCommands,		"Register within the MMD"},

	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_setMmdCommands[] =
{
	{"<mmdid>",			FREEFORM_TOKEN,			g_setMmdRegisterCommands,	"Hexadecimal MMD index"},

	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_interfaceSetCommands[] =
{
	{"mmd",				CMD_MMD,				g_setMmdCommands,			"Set MMD registers"},
	{"register",		CMD_REGISTER,			g_setRegisterCommands,		"Set PHY registers"},

	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "show"

static const clikeyword_t g_showArpCommands[] =
{
	{"cache",			CMD_CACHE,				nullptr,				"Show contents of the ARP cache"},
	{nullptr,			INVALID_COMMAND,		nullptr,				nullptr}
};

static const clikeyword_t g_showIpCommands[] =
{
	{"address",			CMD_ADDRESS,			nullptr,				"Show the IPv4 address and subnet mask"},
	{"route",			CMD_ROUTE,				nullptr,				"Show the IPv4 routing table"},
	{nullptr,			INVALID_COMMAND,		nullptr,				nullptr}
};

static const clikeyword_t g_showSshCommands[] =
{
	{"fingerprint",		CMD_FINGERPRINT,		nullptr,				"Show the SSH host key fingerprint (in OpenSSH base64 SHA256 format)"},
	{nullptr,			INVALID_COMMAND,		nullptr,				nullptr}
};

static const clikeyword_t g_showIntSuffixCommands[] =
{
	//{"<cr>",			OPTIONAL_TOKEN,		nullptr,	""},
	{"counters",		CMD_COUNTERS,		nullptr,	"Show interface performance counters"},
	{nullptr,			INVALID_COMMAND,	nullptr,	nullptr}
};

static const clikeyword_t g_showInterfaceCommands[] =
{
	{"g0",				CMD_G0,				g_showIntSuffixCommands,	"Gigabit0"},
	{"g1",				CMD_G1,				g_showIntSuffixCommands,	"Gigabit1"},
	{"g2",				CMD_G2,				g_showIntSuffixCommands,	"Gigabit2"},
	{"g3",				CMD_G3,				g_showIntSuffixCommands,	"Gigabit3"},
	{"g4",				CMD_G4,				g_showIntSuffixCommands,	"Gigabit4"},
	{"g5",				CMD_G5,				g_showIntSuffixCommands,	"Gigabit5"},
	{"g6",				CMD_G6,				g_showIntSuffixCommands,	"Gigabit6"},
	{"g7",				CMD_G7,				g_showIntSuffixCommands,	"Gigabit7"},
	{"g8",				CMD_G8,				g_showIntSuffixCommands,	"Gigabit8"},
	{"g9",				CMD_G9,				g_showIntSuffixCommands,	"Gigabit9"},
	{"g10",				CMD_G10,			g_showIntSuffixCommands,	"Gigabit10"},
	{"g11",				CMD_G11,			g_showIntSuffixCommands,	"Gigabit11"},
	{"g12",				CMD_G12,			g_showIntSuffixCommands,	"Gigabit12"},
	{"g13",				CMD_G13,			g_showIntSuffixCommands,	"Gigabit13"},
	{"mgmt0",			CMD_MGMT0,			g_showIntSuffixCommands,	"Management0"},
	{"xg0",				CMD_XG0,			g_showIntSuffixCommands,	"10Gigabit0"},

	{"status",			CMD_STATUS,			nullptr,					"Display summary of all network interfaces"},
	{nullptr,			INVALID_COMMAND,	nullptr,					nullptr}
};

static const clikeyword_t g_showFlashDetailCommands[] =
{
	{"<objname>",		FREEFORM_TOKEN,		nullptr,					"Name of the flash object to display"},
	{nullptr,			INVALID_COMMAND,	nullptr,					nullptr}
};

static const clikeyword_t g_showFlashCommands[] =
{
	{"<cr>",			OPTIONAL_TOKEN,		nullptr,					""},
	{"detail",			CMD_DETAIL,			g_showFlashDetailCommands,	"Show detailed flash object contents"},
	{nullptr,			INVALID_COMMAND,	nullptr,					nullptr}
};

static const clikeyword_t g_showCommands[] =
{
	{"arp",				CMD_ARP,			g_showArpCommands,			"Print ARP information"},
	{"flash",			CMD_FLASH,			g_showFlashCommands,		"Display flash usage and log data"},
	{"hardware",		CMD_HARDWARE,		nullptr,					"Print hardware information"},
	{"interface",		CMD_INTERFACE,		g_showInterfaceCommands,	"Display interface properties and stats"},
	{"ip",				CMD_IP,				g_showIpCommands,			"Print IPv4 information"},
	{"ssh",				CMD_SSH,			g_showSshCommands,			"Print SSH information"},
	{"temperature",		CMD_TEMPERATURE,	nullptr,					"Display temperature sensor values"},
	{"version",			CMD_VERSION,		nullptr,					"Show firmware / FPGA version"},
	{nullptr,			INVALID_COMMAND,	nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "show" (interface mode)

static const clikeyword_t g_showRegisterCommands[] =
{
	{"<regid>",			FREEFORM_TOKEN,			nullptr,					"Hexadecimal register address"},

	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_showMmdRegisterCommands[] =
{
	{"register",		CMD_REGISTER,			g_showRegisterCommands,		"Register within the MMD"},

	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_showMmdCommands[] =
{
	{"<mmdid>",			FREEFORM_TOKEN,			g_showMmdRegisterCommands,	"Hexadecimal MMD index"},

	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_interfaceShowCommands[] =
{
	{"arp",				CMD_ARP,			g_showArpCommands,			"Print ARP information"},
	{"flash",			CMD_FLASH,			g_showFlashCommands,		"Display flash usage and log data"},
	{"hardware",		CMD_HARDWARE,		nullptr,					"Print hardware information"},
	{"interface",		CMD_INTERFACE,		g_showInterfaceCommands,	"Display interface properties and stats"},
	{"ip",				CMD_IP,				g_showIpCommands,			"Print IPv4 information"},
	{"mmd",				CMD_MMD,			g_showMmdCommands,			"Read MMD registers"},
	{"register",		CMD_REGISTER,		g_showRegisterCommands,		"Read PHY registers"},
	{"ssh",				CMD_SSH,			g_showSshCommands,			"Print SSH information"},
	{"version",			CMD_VERSION,		nullptr,					"Show firmware / FPGA version"},
	{nullptr,			INVALID_COMMAND,	nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "testpattern"

static const clikeyword_t g_testpatternCommands[] =
{
	{"distortion",		CMD_DISTORTION,			nullptr,					"Distortion test (mode 4)"},
	{"jitter",			CMD_JITTER,				g_modeCommands,				"Jitter test (modes 2/3)"},
	{"mlt3",			CMD_MLT3,				nullptr,					"MLT-3 idles (DP83867 only)"},
	{"pulse4",			CMD_PULSE4,				nullptr,					"Pulse, 3 zeroes (DP83867 only)"},
	{"pulse64",			CMD_PULSE64,			nullptr,					"Pulse, 63 zeroes (DP83867 only)"},
	{"waveform",		CMD_WAVEFORM_TEST,		nullptr,					"Waveform test (mode 1)"},
	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "vlan"

static const clikeyword_t g_vlanCommands[] =
{
	{"<1-4095>",	FREEFORM_TOKEN,		nullptr,	"VLAN number to assign"},
	{nullptr,		INVALID_COMMAND,	nullptr,	nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// zeroize

static const clikeyword_t g_zeroizeCommands[] =
{
	{"all",				FREEFORM_TOKEN,			NULL,				"Confirm erasing all flash data and return to default state"},
	{NULL,				INVALID_COMMAND,		NULL,				NULL}
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
	{"reload",		CMD_RELOAD,			nullptr,				"Restart the system"},
	{"rollback",	CMD_ROLLBACK,		nullptr,				"Revert all changes made since last commit"},
	{"show",		CMD_SHOW,			g_showCommands,			"Print information"},
	{"test",		CMD_TEST,			g_interfaceCommands,	"Run a cable test"},
	{"zeroize",		CMD_ZEROIZE,		g_zeroizeCommands,		"Erase all configuration data and reload"},

	{nullptr,		INVALID_COMMAND,	nullptr,				nullptr}
};

//Top level commands in interface mode
static const clikeyword_t g_copperInterfaceRootCommands[] =
{
	{"autonegotiation",	CMD_AUTONEGOTIATION,	nullptr,					"Enable autonegotiation"},
	{"description",		CMD_DESCRIPTION,		g_descriptionCommands,		"Set interface description"},
	{"end",				CMD_END,				nullptr,					"Return to normal mode"},
	{"exit",			CMD_EXIT,				nullptr,					"Return to normal mode"},
	{"interface",		CMD_INTERFACE,			g_interfaceCommands,		"Configure another interface"},
	{"mdi",				CMD_MDI,				g_mdiCommands,				"Specify auto or manual MDI/MDI-X mode"},
	{"mode",			CMD_MODE,				g_allModeCommands,			"Specify 1000base-T master/slave mode"},
	{"no",				CMD_NO,					g_interfaceNoCommands,		"Turn settings off"},
	{"set",				CMD_SET,				g_interfaceSetCommands,		"Set raw hardware registers"},
	{"show",			CMD_SHOW,				g_interfaceShowCommands,	"Print information"},
	{"speed",			CMD_SPEED,				g_interfaceSpeedCommands,	"Set port operating speed"},
	{"testpattern",		CMD_TESTPATTERN,		g_testpatternCommands,		"Send a test pattern"},
	{"vlan",			CMD_VLAN,				g_vlanCommands,				"Configure interface VLAN"},
	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

static const clikeyword_t g_fiberInterfaceRootCommands[] =
{
	{"description",		CMD_DESCRIPTION,		g_descriptionCommands,		"Set interface description"},
	{"end",				CMD_END,				nullptr,					"Return to normal mode"},
	{"exit",			CMD_EXIT,				nullptr,					"Return to normal mode"},
	{"interface",		CMD_INTERFACE,			g_interfaceCommands,		"Configure another interface"},
	{"no",				CMD_NO,					g_interfaceNoCommands,		"Turn settings off"},
	{"set",				CMD_SET,				g_interfaceSetCommands,		"Set raw hardware registers"},
	{"show",			CMD_SHOW,				g_interfaceShowCommands,	"Print information"},
	{"vlan",			CMD_VLAN,				g_vlanCommands,				"Configure interface VLAN"},
	{nullptr,			INVALID_COMMAND,		nullptr,					nullptr}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Main CLI code

SwitchCLISessionContext::SwitchCLISessionContext()
	: CLISessionContext(g_rootCommands)
	, m_activeInterface(0)
{
	LoadHostname();

	//get reasonable defaults
	m_testModeSavedRegisters[0] = 0x1140;
	m_testModeSavedRegisters[1] = 0;
	m_testModeSavedRegisters[2] = 0x0200;
}

void SwitchCLISessionContext::PrintPrompt()
{
	if(m_rootCommands == g_rootCommands)
		m_stream->Printf("%s@%s# ", m_username, m_hostname);
	else
		m_stream->Printf("%s@%s(int-%s)# ", m_username, m_hostname, g_interfaceNames[m_activeInterface]);
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
	if(m_rootCommands == g_rootCommands)
		OnExecuteRoot();
	else
		OnExecuteInterface();

	m_stream->Flush();
}

/**
	@brief Execute a command in config-interface mode
 */
void SwitchCLISessionContext::OnExecuteInterface()
{
	switch(m_command[0].m_commandID)
	{
		case CMD_AUTONEGOTIATION:
			OnAutonegotiation();
			break;

		case CMD_DESCRIPTION:
			OnDescription();
			break;

		//Return to top level config mode
		case CMD_END:
		case CMD_EXIT:
			m_rootCommands = g_rootCommands;
			break;

		//Can always change interface even if in interface mode already
		case CMD_INTERFACE:
			OnInterfaceCommand();
			break;

		case CMD_MDI:
			OnMdiCommand();
			break;

		case CMD_MODE:
			OnModeCommand();
			break;

		case CMD_NO:
			OnNoCommand();
			break;

		case CMD_SET:
			OnSetCommand();
			break;

		case CMD_SPEED:
			OnSpeed();
			break;

		//All show commands are valid here
		//TODO: some special ones too?
		case CMD_SHOW:
			OnShowCommand();
			break;

		case CMD_TEST:
			OnTest();
			break;

		case CMD_TESTPATTERN:
			OnTestPattern();
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

		case CMD_IP:
			OnIPCommand();
			break;

		case CMD_RELOAD:
			OnReload();
			break;

		case CMD_ROLLBACK:
			OnRollback();
			break;

		case CMD_SHOW:
			OnShowCommand();
			break;

		case CMD_ZEROIZE:
			if(!strcmp(m_command[1].m_text, "all"))
				OnZeroize();
			break;

		default:
			m_stream->Printf("Unrecognized command\n");
			break;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "autonegotiation"

void SwitchCLISessionContext::OnAutonegotiation()
{
	g_log("\"autonegotiation\" not implemented\n");

	/*
	auto basic = PhyRegisterRead(m_activeInterface, PHY_REG_BASIC_CONTROL);
	PhyRegisterWrite(m_activeInterface, PHY_REG_BASIC_CONTROL, basic | 0x1000);

	RestartNegotiation(m_activeInterface);
	*/
}

void SwitchCLISessionContext::OnNoAutonegotiation()
{
	g_log("\"no autonegotiation\" not implemented\n");

	/*
	auto basic = PhyRegisterRead(m_activeInterface, PHY_REG_BASIC_CONTROL);
	auto gig = PhyRegisterRead(m_activeInterface, PHY_REG_GIG_CONTROL);
	auto adv = PhyRegisterRead(m_activeInterface, PHY_REG_AN_ADVERT);

	//Turn off AN flag
	basic &= ~0x1000;

	//Force speed to highest currently advertised speed
	basic &= 0xdfbf;
	if(gig & 0x200)
		basic |= 0x0040;
	else if(adv & 0x100)
		basic |= 0x2000;

	PhyRegisterWrite(m_activeInterface, PHY_REG_BASIC_CONTROL, basic);

	RestartNegotiation(m_activeInterface);
	*/
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

		//Description
		//TODO: make string wrapper for StoreObjectIfNecessary
		if(strcmp(g_defaultInterfaceDescriptions[i], g_interfaceDescriptions[i]) != 0)
		{
			bool nameChanged = true;

			//See if the previously stored name is the same and only store if different
			auto plog = g_kvs->FindObjectF("%s.desc", g_interfaceNames[i]);
			if(plog)
			{
				auto olddesc = (const char*)g_kvs->MapObject(plog);

				char tmp[DESCRIPTION_LEN] = {0};
				auto len = plog->m_len;
				if(len >= DESCRIPTION_LEN)
					len = DESCRIPTION_LEN - 1;
				memcpy(tmp, olddesc, len);

				if(strcmp(tmp, g_interfaceDescriptions[i]) == 0)
					nameChanged = false;
			}

			if(nameChanged)
			{
				if(!g_kvs->StoreObject(
					(uint8_t*)g_interfaceDescriptions[i],
					strlen(g_interfaceDescriptions[i]),
					"%s.desc",
					g_interfaceNames[i]))
				{
					m_stream->Printf("KVS write error\n");
				}
			}
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

	//Save IP configuration
	if(!g_kvs->StoreObjectIfNecessary<IPv4Address>(g_ipConfig.m_address, g_defaultIP, "ip.address"))
		m_stream->Printf("KVS write error\n");
	if(!g_kvs->StoreObjectIfNecessary<IPv4Address>(g_ipConfig.m_netmask, g_defaultNetmask, "ip.netmask"))
		m_stream->Printf("KVS write error\n");
	if(!g_kvs->StoreObjectIfNecessary<IPv4Address>(g_ipConfig.m_broadcast, g_defaultBroadcast, "ip.broadcast"))
		m_stream->Printf("KVS write error\n");
	if(!g_kvs->StoreObjectIfNecessary<IPv4Address>(g_ipConfig.m_gateway, g_defaultGateway, "ip.gateway"))
		m_stream->Printf("KVS write error\n");
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "description"

void SwitchCLISessionContext::OnDescription()
{
	strncpy(g_interfaceDescriptions[m_activeInterface], m_command[1].m_text, DESCRIPTION_LEN-1);
	g_interfaceDescriptions[m_activeInterface][DESCRIPTION_LEN-1] = '\0';
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "interface"

void SwitchCLISessionContext::OnInterfaceCommand()
{
	m_activeInterface = (m_command[1].m_commandID - CMD_G0);

	if(m_activeInterface >= NUM_PORTS)
		m_activeInterface = NUM_PORTS-1;

	if(m_activeInterface == UPLINK_PORT)
		m_rootCommands = g_fiberInterfaceRootCommands;
	else
		m_rootCommands = g_copperInterfaceRootCommands;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "ip"

bool SwitchCLISessionContext::ParseIPAddress(const char* addr, IPv4Address& ip)
{
	int len = strlen(addr);

	int nfield = 0;
	unsigned int fields[4] = {0};

	//Parse
	for(int i=0; i<len; i++)
	{
		//Dot = move to next field
		if( (addr[i] == '.') && (nfield < 3) )
			nfield ++;

		//Digit = update current field
		else if(isdigit(addr[i]))
			fields[nfield] = (fields[nfield] * 10) + (addr[i] - '0');

		else
			return false;
	}

	//Validate
	if(nfield != 3)
		return false;
	for(int i=0; i<4; i++)
	{
		if(fields[i] > 255)
			return false;
	}

	//Set the IP
	for(int i=0; i<4; i++)
		ip.m_octets[i] = fields[i];
	return true;
}

bool SwitchCLISessionContext::ParseIPAddressWithSubnet(const char* addr, IPv4Address& ip, uint32_t& mask)
{
	int len = strlen(addr);

	int nfield = 0;	//0-3 = IP, 4 = netmask
	unsigned int fields[5] = {0};

	//Parse
	for(int i=0; i<len; i++)
	{
		//Dot = move to next field
		if( (addr[i] == '.') && (nfield < 3) )
			nfield ++;

		//Slash = move to netmask
		else if( (addr[i] == '/') && (nfield == 3) )
			nfield ++;

		//Digit = update current field
		else if(isdigit(addr[i]))
			fields[nfield] = (fields[nfield] * 10) + (addr[i] - '0');

		else
			return false;
	}

	//Validate
	if(nfield != 4)
		return false;
	for(int i=0; i<4; i++)
	{
		if(fields[i] > 255)
			return false;
	}
	if( (fields[4] > 32) || (fields[4] == 0) )
		return false;

	//Set the IP
	for(int i=0; i<4; i++)
		ip.m_octets[i] = fields[i];

	mask = 0xffffffff << (32 - fields[4]);
	return true;
}

void SwitchCLISessionContext::OnIPAddress(const char* addr)
{
	//Parse the base IP address
	uint32_t mask = 0;
	if(!ParseIPAddressWithSubnet(addr, g_ipConfig.m_address, mask))
	{
		m_stream->Printf("Usage: ip address x.x.x.x/yy\n");
		return;
	}

	//Calculate the netmask
	g_ipConfig.m_netmask.m_octets[0] = (mask >> 24) & 0xff;
	g_ipConfig.m_netmask.m_octets[1] = (mask >> 16) & 0xff;
	g_ipConfig.m_netmask.m_octets[2] = (mask >> 8) & 0xff;
	g_ipConfig.m_netmask.m_octets[3] = (mask >> 0) & 0xff;

	//Calculate the broadcast address
	for(int i=0; i<4; i++)
		g_ipConfig.m_broadcast.m_octets[i] = g_ipConfig.m_address.m_octets[i] | ~g_ipConfig.m_netmask.m_octets[i];
}

void SwitchCLISessionContext::OnIPGateway(const char* gw)
{
	if(!ParseIPAddress(gw, g_ipConfig.m_gateway))
		m_stream->Printf("Usage: ip default-gateway x.x.x.x\n");
}

void SwitchCLISessionContext::OnIPCommand()
{
	switch(m_command[1].m_commandID)
	{
		case CMD_ADDRESS:
			OnIPAddress(m_command[2].m_text);
			break;

		case CMD_GATEWAY:
			OnIPGateway(m_command[2].m_text);
			break;

		default:
			m_stream->Printf("Unrecognized command\n");
			break;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "mode"

void SwitchCLISessionContext::OnModeCommand()
{
	g_log("\"mode\" not implemented\n");

	/*
	auto gig = PhyRegisterRead(m_activeInterface, PHY_REG_GIG_CONTROL) & ~0x1c00;

	switch(m_command[1].m_commandID)
	{
		case CMD_MASTER:
			PhyRegisterWrite(m_activeInterface, PHY_REG_GIG_CONTROL, gig | 0x1800);
			break;

		case CMD_SLAVE:
			PhyRegisterWrite(m_activeInterface, PHY_REG_GIG_CONTROL, gig | 0x1000);
			break;

		case CMD_AUTO:
			switch(m_command[3].m_commandID)
			{
				case CMD_MASTER:
					PhyRegisterWrite(m_activeInterface, PHY_REG_GIG_CONTROL, gig | 0x400);
					break;

				case CMD_SLAVE:
					PhyRegisterWrite(m_activeInterface, PHY_REG_GIG_CONTROL, gig);
					break;
			}
			break;
	}

	RestartNegotiation(m_activeInterface);
	*/
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "mdi"

void SwitchCLISessionContext::OnMdiCommand()
{
	g_log("\"mdi\" not implemented\n");
	/*
	auto mdi = PhyRegisterRead(m_activeInterface, PHY_REG_MDIX) & 0xff3f;

	switch(m_command[1].m_commandID)
	{
		//default, no action needed
		case CMD_AUTO:
			break;

		case CMD_STRAIGHT:
			mdi |= 0x40;
			mdi |= 0x80;
			break;

		case CMD_CROSSOVER:
			mdi |= 0x40;
			break;
	}

	PhyRegisterWrite(m_activeInterface, PHY_REG_MDIX, mdi);
	*/
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "no"

void SwitchCLISessionContext::OnNoCommand()
{
	switch(m_command[1].m_commandID)
	{
		case CMD_AUTONEGOTIATION:
			OnNoAutonegotiation();
			break;

		case CMD_SPEED:
			OnNoSpeed();
			break;

		case CMD_TESTPATTERN:
			OnNoTestPattern();
			break;

		default:
			break;
	}
}

void SwitchCLISessionContext::OnNoSpeed()
{
	/*
	//10/100 speeds are in the AN base page advertisement register
	if( (m_command[2].m_commandID == CMD_10) || (m_command[2].m_commandID == CMD_100) )
	{
		auto adv = PhyRegisterRead(m_activeInterface, PHY_REG_AN_ADVERT);
		if(m_command[2].m_commandID == CMD_100)
			adv &= ~0x100;
		else
			adv &= ~0x40;
		PhyRegisterWrite(m_activeInterface, PHY_REG_AN_ADVERT, adv);
	}

	//Gigabit speeds are in the 1000baseT control register
	else
	{
		auto mode = PhyRegisterRead(m_activeInterface, PHY_REG_GIG_CONTROL);
		mode &= ~0x200;
		PhyRegisterWrite(m_activeInterface, PHY_REG_GIG_CONTROL, mode);
	}

	//Restart negotiation
	RestartNegotiation(m_activeInterface);
	*/

	g_log("\"no speed\" not implemented yet\n");
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "reload"

void SwitchCLISessionContext::OnReload()
{
	g_log("Reload requested\n");
	SCB.AIRCR = 0x05fa0004;
	while(1)
	{}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "rollback"

/**
	@brief Load all of our configuration from the KVS, discarding any recent changes made in the CLI
 */
void SwitchCLISessionContext::OnRollback()
{
	ConfigureInterfaces();
	ConfigureIP();
	LoadHostname();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "set"

void SwitchCLISessionContext::OnSetCommand()
{
	switch(m_command[1].m_commandID)
	{
		case CMD_MMD:
			OnSetMmdRegister();
			break;

		case CMD_REGISTER:
			OnSetRegister();
			break;
	}
}

void SwitchCLISessionContext::OnSetRegister()
{
	int regid = strtol(m_command[2].m_text, nullptr, 16);
	int value = strtol(m_command[3].m_text, nullptr, 16);
	InterfacePHYWrite(m_activeInterface, regid, value);
	m_stream->Printf("Set register 0x%02x to 0x%04x\n", regid, value);
}

void SwitchCLISessionContext::OnSetMmdRegister()
{
	int mmd = strtol(m_command[2].m_text, nullptr, 16);
	int regid = strtol(m_command[4].m_text, nullptr, 16);
	auto value = strtol(m_command[5].m_text, nullptr, 16);
	InterfacePHYExtendedWrite(m_activeInterface, mmd, regid, value);
	m_stream->Printf("Set MMD %02x register 0x%04x to 0x%04x\n", mmd, regid, value);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "show"

void SwitchCLISessionContext::OnShowCommand()
{
	switch(m_command[1].m_commandID)
	{
		case CMD_ARP:
			switch(m_command[2].m_commandID)
			{
				case CMD_CACHE:
					OnShowARPCache();
					break;

				default:
					break;
			}
			break;

		case CMD_FLASH:
			OnShowFlash();
			break;

		case CMD_INTERFACE:
			OnShowInterfaceCommand();
			break;

		case CMD_IP:
			switch(m_command[2].m_commandID)
			{
				case CMD_ADDRESS:
					OnShowIPAddress();
					break;

				case CMD_ROUTE:
					OnShowIPRoute();
					break;

				default:
					break;
			}
			break;

		case CMD_MMD:
			OnShowMMDRegister();
			break;

		case CMD_REGISTER:
			OnShowRegister();
			break;

		case CMD_SSH:
			switch(m_command[2].m_commandID)
			{
				case CMD_FINGERPRINT:
					OnShowSSHFingerprint();
					break;

				default:
					break;
			}
			break;

		case CMD_TEMPERATURE:
			OnShowTemperature();
			break;

		case CMD_VERSION:
			OnShowVersion();
			break;

		default:
			m_stream->Printf("Unrecognized command\n");
			break;
	}
}

void SwitchCLISessionContext::OnShowARPCache()
{
	auto cache = g_ethProtocol->GetARP()->GetCache();

	uint32_t ways = cache->GetWays();
	uint32_t lines = cache->GetLines();
	m_stream->Printf("ARP cache is %d ways of %d lines, %d spaces total\n", ways, lines, ways*lines);

	m_stream->Printf("Expiration  HWaddress           Address\n");

	for(uint32_t i=0; i<ways; i++)
	{
		auto way = cache->GetWay(i);
		for(uint32_t j=0; j<lines; j++)
		{
			auto& line = way->m_lines[j];
			if(line.m_valid)
			{
				m_stream->Printf("%10d  %02x:%02x:%02x:%02x:%02x:%02x   %d.%d.%d.%d\n",
					line.m_lifetime,
					line.m_mac[0], line.m_mac[1], line.m_mac[2], line.m_mac[3], line.m_mac[4], line.m_mac[5],
					line.m_ip.m_octets[0], line.m_ip.m_octets[1], line.m_ip.m_octets[2], line.m_ip.m_octets[3]
				);
			}
		}
	}
}

/*

void TapCLISessionContext::OnShowDetail()
{
	auto base = PhyRegisterRead(m_activeInterface, PHY_REG_BASIC_CONTROL);
	auto status = PhyRegisterRead(m_activeInterface, PHY_REG_BASIC_STATUS);
	bool aneg = (base & 0x1000) == 0x1000;

	//RGMII in-band status
	int rgmiiState = g_linkState >> (m_activeInterface*4);
	bool rgmiiUp = (rgmiiState & 0x8) == 0x8;
	int rgmiiSpeed = rgmiiState & 3;

	m_stream->Printf("RGMII In-Band Status\n");
	if(rgmiiUp)
		m_stream->Printf("    Link up\n");
	else
		m_stream->Printf("    Link down\n");
	switch(rgmiiSpeed)
	{
		case 0:
			m_stream->Printf("    10baseT\n");
			break;
		case 1:
			m_stream->Printf("    100baseTX\n");
			break;
		case 2:
			m_stream->Printf("    1000baseT\n");
			break;
		default:
			m_stream->Printf("    Invalid (reserved) speed\n");
			break;
	}

	//Basic control register
	m_stream->Printf("Basic Control = 0x%04x\n", base);
	if(base & 0x4000)
		m_stream->Printf("    Loopback enabled\n");
	else
		m_stream->Printf("    Loopback disabled\n");

	if(base & 0x1000)
		m_stream->Printf("    Autonegotiation enabled\n");
	else
		m_stream->Printf("    Autonegotiation disabled\n");

	if(base & 0x0800)
		m_stream->Printf("    Powered down\n");
	else
		m_stream->Printf("    Powered up\n");

	if(base & 0x0400)
		m_stream->Printf("    RGMII isolation\n");
	else
		m_stream->Printf("    RGMII operating normally\n");

	if(base & 0x0100)
		m_stream->Printf("    Full duplex\n");
	else
		m_stream->Printf("    Half duplex (not tested or supported in FPGA firmware, may cause problems)\n");

	auto speed = base & 0x2040;
	if(speed == 0)
		m_stream->Printf("    Speed select: 10baseT\n");
	else if(speed == 0x2000)
		m_stream->Printf("    Speed select: 100baseTX\n");
	else if(speed == 0x0040)
		m_stream->Printf("    Speed select: 1000baseT\n");
	else
		m_stream->Printf("    Invalid speed\n");

	//Basic status register
	m_stream->Printf("Basic Status = 0x%04x\n", status);
	if(status & 0x0020)
		m_stream->Printf("    Autonegotiation completed\n");
	else
		m_stream->Printf("    Autonegotiation not completed\n");
	if(status & 0x0010)
		m_stream->Printf("    Remote fault\n");
	else
		m_stream->Printf("    No remote fault detected\n");
	if(status & 0x4)
		m_stream->Printf("    Link up\n");
	else
		m_stream->Printf("    Link down\n");
	if(status & 0x2)
		m_stream->Printf("    Jabber detected\n");
	else
		m_stream->Printf("    No jabber detected\n");

	//Autonegotiation advertisement
	auto ad = PhyRegisterRead(m_activeInterface, PHY_REG_AN_ADVERT);
	m_stream->Printf("Autonegotiation Advertisement = 0x%04x\n", ad);
	if(ad & 0x8000)
		m_stream->Printf("    Next page\n");
	else
		m_stream->Printf("    No next page\n");
	if(ad & 0x2000)
		m_stream->Printf("    Remote fault\n");
	else
		m_stream->Printf("    No remote fault\n");
	switch( (ad >> 10) & 3)
	{
		case 0:
			m_stream->Printf("    No pause\n");
			break;

		case 1:
			m_stream->Printf("    Asymmetric pause\n");
			break;

		case 2:
			m_stream->Printf("    Symmetric pause\n");
			break;

		case 3:
			m_stream->Printf("    Symmetric or asymmetric pause\n");
			break;
	}
	if(ad & 0x100)
		m_stream->Printf("    100baseTX full duplex capable\n");
	else
		m_stream->Printf("    Not 100baseTX full duplex capable\n");
	if(ad & 0x80)
		m_stream->Printf("    100baseTX half duplex capable\n");
	else
		m_stream->Printf("    Not 100baseTX half duplex capable\n");
	if(ad & 0x40)
		m_stream->Printf("    10baseT full duplex capable\n");
	else
		m_stream->Printf("    Not 10baseT full duplex capable\n");
	if(ad & 0x20)
		m_stream->Printf("    10baseT half duplex capable\n");
	else
		m_stream->Printf("    Not 10baseT half duplex capable\n");
	auto sel = (ad & 0x1f);
	if(sel == 0x1)
		m_stream->Printf("    Selector: 0x01 (Ethernet)\n");
	else
		m_stream->Printf("    Selector: 0x%02x (invalid)\n", sel);

	//Autonegotiation advertisement
	ad = PhyRegisterRead(m_activeInterface, PHY_REG_AN_PARTNER);
	m_stream->Printf("Autonegotiation Link Partner Ability = 0x%04x\n", ad);
	if(ad & 0x8000)
		m_stream->Printf("    Next page\n");
	else
		m_stream->Printf("    No next page\n");
	if(ad & 0x4000)
		m_stream->Printf("    ACK\n");
	else
		m_stream->Printf("    No ACK\n");
	if(ad & 0x2000)
		m_stream->Printf("    Remote fault\n");
	else
		m_stream->Printf("    No remote fault\n");
	switch( (ad >> 10) & 3)
	{
		case 0:
			m_stream->Printf("    No pause\n");
			break;

		case 1:
			m_stream->Printf("    Asymmetric pause\n");
			break;

		case 2:
			m_stream->Printf("    Symmetric pause\n");
			break;

		case 3:
			m_stream->Printf("    Symmetric or asymmetric pause\n");
			break;
	}
	if(ad & 0x200)
		m_stream->Printf("    100baseT4x capable\n");
	else
		m_stream->Printf("    Not 100baseT4 capable\n");
	if(ad & 0x100)
		m_stream->Printf("    100baseTX full duplex capable\n");
	else
		m_stream->Printf("    Not 100baseTX full duplex capable\n");
	if(ad & 0x80)
		m_stream->Printf("    100baseTX half duplex capable\n");
	else
		m_stream->Printf("    Not 100baseTX half duplex capable\n");
	if(ad & 0x40)
		m_stream->Printf("    10baseT full duplex capable\n");
	else
		m_stream->Printf("    Not 10baseT full duplex capable\n");
	if(ad & 0x20)
		m_stream->Printf("    10baseT half duplex capable\n");
	else
		m_stream->Printf("    Not 10baseT half duplex capable\n");
	sel = (ad & 0x1f);
	if(sel == 0x1)
		m_stream->Printf("    Selector: 0x01 (Ethernet)\n");
	else
		m_stream->Printf("    Selector: 0x%02x (invalid)\n", sel);

	//Block to avoid spamming the screen with more content than can fit
	More();

	//AN expansion
	auto exp = PhyRegisterRead(m_activeInterface, PHY_REG_AN_EXPANSION);
	m_stream->Printf("Autonegotiation Expansion = 0x%04x\n", exp);
	if(exp & 0x10)
		m_stream->Printf("    Parallel detection: fault\n");
	else
		m_stream->Printf("    Parallel detection: no fault\n");
	if(exp & 0x8)
		m_stream->Printf("    Link partner has next page capability\n");
	else
		m_stream->Printf("    Link partner lacks next page capability\n");
	if(exp & 0x1)
		m_stream->Printf("    Link partner has autonegotiation capability\n");
	else
		m_stream->Printf("    Link partner lacks autonegotiation capability\n");

	//Don't dump AN_NEXT_PAGE as that's outbound only

	//Link partner next page
	auto pnp = PhyRegisterRead(m_activeInterface, PHY_REG_AN_PARTNER_NEXT_PAGE);
	m_stream->Printf("Link Partner Next Page = 0x%04x\n", pnp);
	if(pnp & 0x8000)
		m_stream->Printf("    Additional pages to follow\n");
	else
		m_stream->Printf("    Last page\n");
	if(pnp & 0x4000)
		m_stream->Printf("    ACK\n");
	else
		m_stream->Printf("    NAK\n");
	if(pnp & 0x2000)
		m_stream->Printf("    Message page\n");
	else
		m_stream->Printf("    Unformatted page\n");
	if(pnp & 0x1000)
		m_stream->Printf("    ACK2\n");
	else
		m_stream->Printf("    NAK2\n");
	m_stream->Printf("    Toggle = %d\n", (pnp >> 11) & 1);
	m_stream->Printf("    Message = 0x%03x\n", pnp & 0x3ff);

	//1000base-T Control
	auto gig = PhyRegisterRead(m_activeInterface, PHY_REG_GIG_CONTROL);
	m_stream->Printf("1000Base-T Control = 0x%04x\n", gig);
	int test = (gig >> 13) & 7;
	switch(test)
	{
		case 0:
			m_stream->Printf("    Normal operation\n");
			break;
		case 1:
			m_stream->Printf("    Waveform test\n");
			break;
		case 2:
			m_stream->Printf("    Jitter test (master mode)\n");
			break;
		case 3:
			m_stream->Printf("    Jitter test (slave mode)\n");
			break;
		case 4:
			m_stream->Printf("    Distortion test\n");
			break;

		default:
			m_stream->Printf("    Test mode %d (reserved)\n", test);
			break;
	}

	if(gig & 0x1000)
	{
		if(gig & 0x0800)
			m_stream->Printf("    Master mode only\n");
		else
			m_stream->Printf("    Slave mode only\n");
	}
	else
	{
		if(gig & 0x0400)
			m_stream->Printf("    Negotiate mode, prefer master\n");
		else
			m_stream->Printf("    Negotiate mode, prefer slave\n");
	}

	if(gig & 0x0200)
		m_stream->Printf("    Advertise 1000baseT full duplex\n");
	else
		m_stream->Printf("    Do not advertise 1000baseT full duplex\n");

	if(gig & 0x0100)
		m_stream->Printf("    Advertise 1000baseT half duplex\n");
	else
		m_stream->Printf("    Do not advertise 1000baseT half duplex\n");

	//1000base-T Status
	auto gstat = PhyRegisterRead(m_activeInterface, PHY_REG_GIG_STATUS);
	m_stream->Printf("1000Base-T Status = 0x%04x\n", gstat);
	if(gstat & 0x8000)
		m_stream->Printf("    Master-slave configuration fault\n");
	else
		m_stream->Printf("    No configuration fault\n");
	if(gstat & 0x4000)
		m_stream->Printf("    Operating in master mode\n");
	else
		m_stream->Printf("    Operating in slave mode\n");
	if(gstat & 0x2000)
		m_stream->Printf("    Local receiver OK\n");
	else
		m_stream->Printf("    Local receiver not OK\n");
	if(gstat & 0x1000)
		m_stream->Printf("    Remote receiver OK\n");
	else
		m_stream->Printf("    Remote receiver not OK\n");
	if(gstat & 0x0800)
		m_stream->Printf("    Link partner capable of 1000baseT full duplex\n");
	else
		m_stream->Printf("    Link partner not capable of 1000baseT full duplex\n");
	if(gstat & 0x0400)
		m_stream->Printf("    Link partner capable of 1000baseT half duplex\n");
	else
		m_stream->Printf("    Link partner not capable of 1000baseT half duplex\n");
	m_stream->Printf("    Idle error count: %d\n", gstat & 0xff);

	m_stream->Printf("-- Vendor specific registers after this point --\n");

	//no register at 0x0b, 0x0c

	//registers 0x0d, 0x0e used for MMD access

	//register 0x0f is just capabilities, nothing interesting / changeable there

	//no register at 0x10

	//Remote Loopback
	auto rloop = PhyRegisterRead(m_activeInterface, PHY_REG_REMOTE_LOOPBACK);
	m_stream->Printf("Remote Loopback = 0x%04x\n", rloop);
	if(rloop & 0x100)
		m_stream->Printf("    Remote loopback enabled\n");
	else
		m_stream->Printf("    Remote loopback disabled\n");

	//ignore linkmd, we have separate commands for that

	auto pcspma = PhyRegisterRead(m_activeInterface, PHY_REG_DIGITAL_PCS_PMA);
	m_stream->Printf("Digital PCS / PMA Status = 0x%04x\n", pcspma);
	if(pcspma & 0x4)
		m_stream->Printf("    1000baseT link OK\n");
	else
		m_stream->Printf("    1000baseT link not OK\n");

	if(pcspma & 0x2)
		m_stream->Printf("    100baseTX link OK\n");
	else
		m_stream->Printf("    100baseTX link not OK\n");

	//no register at 0x14

	auto rxer = PhyRegisterRead(m_activeInterface, PHY_REG_RX_ER);
	m_stream->Printf("RX Error Count = %d\n", rxer);

	//No registers at 0x16 - 0x1a

	//Register 0x1B is interrupt enables, ignore: interrupt pin isn't even connected

	auto mdix = PhyRegisterRead(m_activeInterface, PHY_REG_MDIX);
	m_stream->Printf("Auto MDI-X Control = 0x%04x\n", mdix);
	if(mdix & 0x40)
	{
		if(mdix & 0x80)
			m_stream->Printf("    MDI mode only\n");
		else
			m_stream->Printf("    MDI-X mode only\n");
	}
	else
		m_stream->Printf("    Auto MDI-X\n");

	//No register at 0x1d - 0x1e

	More();

	//PHY Control
	auto ctrl = PhyRegisterRead(m_activeInterface, PHY_REG_CTRL);
	m_stream->Printf("PHY Control = 0x%04x\n", ctrl);
	if(ctrl & 0x200)
		m_stream->Printf("    Jabber counter enabled\n");
	else
		m_stream->Printf("    Jabber counter disabled\n");
	if(ctrl & 0x40)
		m_stream->Printf("    Resolved speed to 1000base-T\n");
	if(ctrl & 0x20)
		m_stream->Printf("    Resolved speed to 100base-TX\n");
	if(ctrl & 0x10)
		m_stream->Printf("    Resolved speed to 10base-T\n");
	if(ctrl & 0x8)
		m_stream->Printf("    Full duplex mode\n");
	else
		m_stream->Printf("    Half duplex mode\n");
	if(ctrl & 0x4)
		m_stream->Printf("    1000base-T master mode\n");
	else
		m_stream->Printf("    1000base-T slave mode\n");
	if(ctrl & 0x1)
		m_stream->Printf("    Link failed\n");
	else
		m_stream->Printf("    Link not failed\n");

	//TODO: AN FLP interval? Not something we ever tweak
	//TODO: link up time setting?

	//Ignore strap overrides

	//Ignore pad skew control

	//Ignore WoL config

	//Ignore analog control for 10baseTe mode

	//Ignore EDPD mode
}
*/

/**
	@brief Block until the user pushes a button, but still update I/O
 */
/*
void TapCLISessionContext::More()
{
	m_stream->Printf("---- More ----\n");
	m_stream->Flush();
	while(!g_cliUART->HasInput())
		PollIO();
	g_cliUART->BlockingRead();
}
*/

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
		const uint32_t linelen = 16;
		for(uint32_t i=0; i<hlog->m_len; i += linelen)
		{
			m_stream->Printf("%04x   ", i);

			//Print hex
			for(uint32_t j=0; j<linelen; j++)
			{
				//Pad with spaces so we get good alignment on the end of the block
				if(i+j >= hlog->m_len)
					m_stream->Printf("   ");

				else
					m_stream->Printf("%02x ", pdata[i+j]);
			}

			m_stream->Printf("  ");

			//Print ASCII
			for(uint32_t j=0; j<linelen; j++)
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

void SwitchCLISessionContext::OnShowHardware()
{
	/*
		uint16_t rev = DBGMCU.IDCODE >> 16;
	uint16_t device = DBGMCU.IDCODE & 0xfff;

	m_stream->Printf("MCU:\n");
	if(device == 0x451)
	{
		//Look up the stepping number
		const char* srev = NULL;
		switch(rev)
		{
			case 0x1000:
				srev = "A";
				break;

			case 0x1001:
				srev = "Z";
				break;

			default:
				srev = "(unknown)";
		}

		uint8_t pkg = (PKG_ID >> 8) & 0x7;
		switch(pkg)
		{
			case 7:
				m_stream->Printf("    STM32F767 / 777 LQFP208/TFBGA216 rev %s (0x%04x)\n", srev, rev);
				break;
			case 6:
				m_stream->Printf("    STM32F769 / 779 LQFP208/TFBGA216 rev %s (0x%04x)\n", srev, rev);
				break;
			case 5:
				m_stream->Printf("    STM32F767 / 777 LQFP176 rev %s (0x%04x)\n", srev, rev);
				break;
			case 4:
				m_stream->Printf("    STM32F769 / 779 LQFP176 rev %s (0x%04x)\n", srev, rev);
				break;
			case 3:
				m_stream->Printf("    STM32F778 / 779 WLCSP180 rev %s (0x%04x)\n", srev, rev);
				break;
			case 2:
				m_stream->Printf("    STM32F767 / 777 LQFP144 rev %s (0x%04x)\n", srev, rev);
				break;
			case 1:
				m_stream->Printf("    STM32F767 / 777 LQFP100 rev %s (0x%04x)\n", srev, rev);
				break;
			default:
				m_stream->Printf("    Unknown/reserved STM32F76x/F77x rev %s (0x%04x)\n", srev, rev);
				break;
		}
		m_stream->Printf("    512 kB total SRAM, 128 kB DTCM, 16 kB ITCM, 4 kB backup SRAM\n");
		m_stream->Printf("    %d kB Flash\n", F_ID);

		//U_ID fields documented in 45.1 of STM32 programming manual
		uint16_t waferX = U_ID[0] >> 16;
		uint16_t waferY = U_ID[0] & 0xffff;
		uint8_t waferNum = U_ID[1] & 0xff;
		char waferLot[8] =
		{
			static_cast<char>((U_ID[1] >> 24) & 0xff),
			static_cast<char>((U_ID[1] >> 16) & 0xff),
			static_cast<char>((U_ID[1] >> 8) & 0xff),
			static_cast<char>((U_ID[2] >> 24) & 0xff),
			static_cast<char>((U_ID[2] >> 16) & 0xff),
			static_cast<char>((U_ID[2] >> 8) & 0xff),
			static_cast<char>((U_ID[2] >> 0) & 0xff),
			'\0'
		};
		m_stream->Printf("    Lot %s, wafer %d, die (%d, %d)\n", waferLot, waferNum, waferX, waferY);

		if(g_hasRmiiErrata)
			m_stream->Printf("    RMII RXD0 errata present\n");
	}
	else
		m_stream->Printf("Unknown device (0x%06x)\n", device);

	//Print CPU info
	if( (SCB.CPUID & 0xff00fff0) == 0x4100c270 )
	{
		m_stream->Printf("ARM Cortex-M7 r%dp%d\n", (SCB.CPUID >> 20) & 0xf, (SCB.CPUID & 0xf));
		if(CPUID.CLIDR & 2)
		{
			m_stream->Printf("    L1 data cache present\n");
			CPUID.CCSELR = 0;

			int sets = ((CPUID.CCSIDR >> 13) & 0x7fff) + 1;
			int ways = ((CPUID.CCSIDR >> 3) & 0x3ff) + 1;
			int words = 1 << ((CPUID.CCSIDR & 3) + 2);
			int total = (sets * ways * words * 4) / 1024;
			m_stream->Printf("        %d sets, %d ways, %d words per line, %d kB total\n",
				sets, ways, words, total);
		}
		if(CPUID.CLIDR & 1)
		{
			m_stream->Printf("    L1 instruction cache present\n");
			CPUID.CCSELR = 1;

			int sets = ((CPUID.CCSIDR >> 13) & 0x7fff) + 1;
			int ways = ((CPUID.CCSIDR >> 3) & 0x3ff) + 1;
			int words = 1 << ((CPUID.CCSIDR & 3) + 2);
			int total = (sets * ways * words * 4) / 1024;
			m_stream->Printf("        %d sets, %d ways, %d words per line, %d kB total\n",
				sets, ways, words, total);
		}
	}
	else
		m_stream->Printf("Unknown CPU (0x%08x)\n", SCB.CPUID);

	m_stream->Printf("Ethernet MAC address is %02x:%02x:%02x:%02x:%02x:%02x\n",
		g_macAddress[0], g_macAddress[1], g_macAddress[2], g_macAddress[3], g_macAddress[4], g_macAddress[5]);
	*/
}

void SwitchCLISessionContext::OnShowInterfaceCommand()
{
	//Interface number?
	if(m_command[2].m_commandID >= CMD_G0)
	{
		//Look at the next argument
		//Generally something like "show int g3 count"
		switch(m_command[3].m_commandID)
		{
			case CMD_COUNTERS:
				OnShowInterfaceCounters(m_command[2].m_commandID - CMD_G0);
				break;

			default:
				m_stream->Printf("Unrecognized command\n");
				break;
		}

		return;
	}

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

/**
	@brief Read a performance counter from an interface
 */
uint64_t SwitchCLISessionContext::ReadPerformanceCounter(uint8_t port, uint16_t reg)
{
	g_fpga->BlockingWrite8(REG_PERF_PORT, port);
	g_fpga->BlockingWrite16(REG_PERF_ADDR, reg);

	uint64_t ret = 0;
	g_fpga->BlockingRead(REG_PERF_DATA, (uint8_t*)&ret, sizeof(ret));

	return ret;
}

/**
	@brief Show performance counters for a single interface
 */
void SwitchCLISessionContext::OnShowInterfaceCounters(uint8_t interface)
{
	m_stream->Printf("MAC IN\n");

	//TODO: support int64 printing in our printf function?
	//for now cast to int32
	uint32_t ret = ReadPerformanceCounter(interface, REG_RX_FRAMES);
	m_stream->Printf("    Valid frames:      %d\n", ret);
	ret = ReadPerformanceCounter(interface, REG_RX_CRC_ERRS);
	m_stream->Printf("    Invalid frames:    %d\n", ret);
	ret = ReadPerformanceCounter(interface, REG_RX_BYTES);
	m_stream->Printf("    Total bytes:       %d\n", ret);


	m_stream->Printf("MAC OUT\n");

	ret = ReadPerformanceCounter(interface, REG_TX_FRAMES);
	m_stream->Printf("    Frames:            %d\n", ret);
	ret = ReadPerformanceCounter(interface, REG_TX_BYTES);
	m_stream->Printf("    Bytes:             %d\n", ret);
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

void SwitchCLISessionContext::OnShowIPAddress()
{
	m_stream->Printf("IPv4 address: %d.%d.%d.%d\n",
		g_ipConfig.m_address.m_octets[0],
		g_ipConfig.m_address.m_octets[1],
		g_ipConfig.m_address.m_octets[2],
		g_ipConfig.m_address.m_octets[3]
	);

	m_stream->Printf("Subnet mask:  %d.%d.%d.%d\n",
		g_ipConfig.m_netmask.m_octets[0],
		g_ipConfig.m_netmask.m_octets[1],
		g_ipConfig.m_netmask.m_octets[2],
		g_ipConfig.m_netmask.m_octets[3]
	);

	m_stream->Printf("Broadcast:    %d.%d.%d.%d\n",
		g_ipConfig.m_broadcast.m_octets[0],
		g_ipConfig.m_broadcast.m_octets[1],
		g_ipConfig.m_broadcast.m_octets[2],
		g_ipConfig.m_broadcast.m_octets[3]
	);
}

void SwitchCLISessionContext::OnShowIPRoute()
{
	m_stream->Printf("IPv4 routing table\n");
	m_stream->Printf("Destination     Gateway\n");
	m_stream->Printf("0.0.0.0         %d.%d.%d.%d\n",
		g_ipConfig.m_gateway.m_octets[0],
		g_ipConfig.m_gateway.m_octets[1],
		g_ipConfig.m_gateway.m_octets[2],
		g_ipConfig.m_gateway.m_octets[3]);
}

void SwitchCLISessionContext::OnShowMMDRegister()
{
	int mmd = strtol(m_command[2].m_text, nullptr, 16);
	int regid = strtol(m_command[4].m_text, nullptr, 16);
	auto value = InterfacePHYExtendedRead(m_activeInterface, mmd, regid);

	m_stream->Printf("MMD %02x register 0x%04x = 0x%04x\n", mmd, regid, value);
}

void SwitchCLISessionContext::OnShowRegister()
{
	int regid = strtol(m_command[2].m_text, nullptr, 16);
	auto value = InterfacePHYRead(m_activeInterface, regid);

	m_stream->Printf("Register 0x%02x = 0x%04x\n", regid, value);
}

/*
void TapCLISessionContext::OnShowSpeed()
{
	auto bc = PhyRegisterRead(m_activeInterface, PHY_REG_BASIC_CONTROL);
	if(bc & 0x1000)
	{
		m_stream->Printf("Autonegotiation enabled\n");
		m_stream->Printf("Advertising:\n");

		auto gig = PhyRegisterRead(m_activeInterface, PHY_REG_GIG_CONTROL);
		if(gig & 0x0200)
			m_stream->Printf("    1000baseT full duplex\n");

		auto ad = PhyRegisterRead(m_activeInterface, PHY_REG_AN_ADVERT);
		if(ad & 0x100)
			m_stream->Printf("    100baseTX full duplex\n");
		if(ad & 0x40)
			m_stream->Printf("    10baseT full duplex\n");
	}
	else
	{
		m_stream->Printf("Autonegotiation disabled\n");

		auto speed = bc & 0x2040;
		if(speed == 0)
			m_stream->Printf("Speed forced to 10baseT\n");
		else if(speed == 0x2000)
			m_stream->Printf("Speed forced to 100baseTX\n");
		else if(speed == 0x0040)
			m_stream->Printf("Speed forced to 1000baseT\n");
		else
			m_stream->Printf("Invalid speed\n");
	}
}
*/

void SwitchCLISessionContext::OnShowSSHFingerprint()
{
	char buf[64] = {0};
	STM32CryptoEngine tmp;
	tmp.GetHostKeyFingerprint(buf, sizeof(buf));
	m_stream->Printf("ED25519 key fingerprint is SHA256:%s.\n", buf);
}

void SwitchCLISessionContext::OnShowTemperature()
{
	//Read fans
	for(uint8_t i=0; i<2; i++)
	{
		auto rpm = GetFanRPM(i);
		if(rpm == 0)
			m_stream->Printf("Fan %d:                                 STOPPED\n", i, rpm);
		else
			m_stream->Printf("Fan %d:                                 %d RPM\n", i, rpm);
	}

	//Read I2C temp sensors
	for(uint8_t i=0; i<4; i++)
	{
		auto addr = g_tempSensorAddrs[i];
		auto temp = ReadThermalSensor(addr);
		m_stream->Printf("Temp 0x%02x (%25s): %d.%02d C\n",
			addr,
			g_tempSensorNames[i],
			(temp >> 8),
			static_cast<int>(((temp & 0xff) / 256.0) * 100));
	}

	//Read SFP+ temp sensor (TODO: only if optic is inserted)
	auto temp = GetSFPTemperature();
	m_stream->Printf("SFP+ optic:                            %2d.%02d C\n",
		(temp >> 8), static_cast<int>(((temp & 0xff) / 256.0) * 100));

	//Read VSC8512 PHY temperature
	temp = GetVSC8512Temperature();
	m_stream->Printf("VSC8512:                               %2d.%02d C\n",
		(temp >> 8), static_cast<int>(((temp & 0xff) / 256.0) * 100));

	//Read FPGA XADC temperature
	temp = GetFPGATemperature();
	m_stream->Printf("FPGA:                                  %2d.%02d C\n",
		(temp >> 8), static_cast<int>(((temp & 0xff) / 256.0) * 100));

	//Read MCU DTS temperature
	temp = g_dts->GetTemperature();
	m_stream->Printf("MCU:                                   %2d.%02d C\n",
		(temp >> 8), static_cast<int>(((temp & 0xff) / 256.0) * 100));
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
// "speed"

void SwitchCLISessionContext::OnSpeed()
{
	g_log("\"speed\" not implemented\n");

	/*
	//Negotiation on, add this speed to the list of advertised speeds and restart
	auto basic = PhyRegisterRead(m_activeInterface, PHY_REG_BASIC_CONTROL);
	if( (basic & 0x1000) == 0x1000)
	{
		//10/100 speeds are in the AN base page advertisement register
		if( (m_command[1].m_commandID == CMD_10) || (m_command[1].m_commandID == CMD_100) )
		{
			auto adv = PhyRegisterRead(m_activeInterface, PHY_REG_AN_ADVERT);
			if(m_command[2].m_commandID == CMD_100)
				adv |= 0x100;
			else
				adv |= 0x40;
			PhyRegisterWrite(m_activeInterface, PHY_REG_AN_ADVERT, adv);
		}

		//Gigabit speeds are in the 1000baseT control register
		else
		{
			auto mode = PhyRegisterRead(m_activeInterface, PHY_REG_GIG_CONTROL);
			mode |= 0x200;
			PhyRegisterWrite(m_activeInterface, PHY_REG_GIG_CONTROL, mode);
		}

		//Restart negotiation
		RestartNegotiation(m_activeInterface);
	}

	//Negotiation off, force to exactly this speed
	else
	{
		//Mask off speed select
		basic &= 0xdfbf;

		switch(m_command[1].m_commandID)
		{
			case CMD_10:
				//nothing to do, code 0 is 10M
				break;

			case CMD_100:
				basic |= 0x2000;
				break;

			case CMD_1000:
				basic |= 0x0040;
				break;
		}

		PhyRegisterWrite(m_activeInterface, PHY_REG_BASIC_CONTROL, basic);
	}
	*/
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "test"

void SwitchCLISessionContext::OnTest()
{
	g_log("\"test\" not implemented\n");

	/*
	//Figure out what interface we're testing
	int iface = 0;
	switch(m_command[1].m_commandID)
	{
		case CMD_PORTA:
			iface = 0;
			break;

		case CMD_PORTB:
			iface = 1;
			break;

		case CMD_MONA:
			iface = 2;
			break;

		case CMD_MONB:
			iface = 3;
			break;

		default:
			break;
	}

	m_stream->Printf("Running TDR cable test on interface %s\n", g_portDescriptions[iface]);

	//Save the old values for a few registers and configure for testing
	//Need to have speed forced to 1000baseT, no negotiation, slave mode, no auto mdix
	//Reference: https://microchipsupport.force.com/s/article/How-to-test-the-4-differential-pairs-between-KSZ9031-Gigabit-Ethernet-PHY-and-RJ-45-connector-for-opens-and-shorts
	auto oldBase = PhyRegisterRead(iface, PHY_REG_BASIC_CONTROL);
	auto oldMdix = PhyRegisterRead(iface, PHY_REG_MDIX);
	auto oldCtrl = PhyRegisterRead(iface, PHY_REG_GIG_CONTROL);
	PhyRegisterWrite(iface, PHY_REG_BASIC_CONTROL, 0x0140);
	PhyRegisterWrite(iface, PHY_REG_MDIX, 0x0040);
	PhyRegisterWrite(iface, PHY_REG_GIG_CONTROL, 0x1000);

	m_stream->Printf("Uncertainty: +/- 4ns or 0.85m\n");
	m_stream->Printf("Local pair     Status      Length (ns)        Length (m)\n");
	for(int pair = 0; pair < 4; pair ++)
	{
		//Run ten tests and average.
		//Report fault if any of them are failures
		int faulttype = 0;
		int faultdist = 0;
		int navg = 10;
		for(int j=0; j<navg; j ++)
		{
			//Request a test of this pair
			PhyRegisterWrite(iface, PHY_REG_LINKMD, 0x8000 | (pair << 12) );

			//Poll until test completes. Time out if no reply after 50 ms
			uint16_t result = 0;
			for(int i=0; i<50; i++)
			{
				result = PhyRegisterRead(iface, PHY_REG_LINKMD);
				g_logTimer->Sleep(10);

				if( (result & 0x8000) == 0)
					break;
			}

			int faultcode = (result >> 8) & 3;
			int rawDistance = (result & 0xff) - 13;
			if(rawDistance < 0)
				rawDistance = 0;

			faultdist += rawDistance;

			if(faultcode != 0)
				faulttype = faultcode;
		}

		if(faulttype == 0)
			m_stream->Printf("%c              Normal              N/A               N/A\n", 'A' + pair);
		else
		{
			int oneWayNs = (faultdist * 4 / navg);
			int cableCm = 21 * oneWayNs;

			m_stream->Printf("%c              %-5s               %3d            %3d.%02d\n",
				'A' + pair,
				(faulttype == 1) ? "Open" : "Short",
				oneWayNs,
				cableCm / 100,
				cableCm % 100
				);
		}
	}

	//Restore original mode register values
	PhyRegisterWrite(iface, PHY_REG_BASIC_CONTROL, oldBase);
	PhyRegisterWrite(iface, PHY_REG_MDIX, oldMdix);
	PhyRegisterWrite(iface, PHY_REG_GIG_CONTROL, oldCtrl);
	*/
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "testpattern"

void SwitchCLISessionContext::OnTestPattern()
{
	int mode = 0;
	switch(m_command[1].m_commandID)
	{
		case CMD_WAVEFORM_TEST:
			mode = 1;
			break;

		case CMD_JITTER:
			if(m_command[2].m_commandID == CMD_MASTER)
				mode = 2;
			else
				mode = 3;
			break;

		case CMD_DISTORTION:
			mode = 4;
			break;

		case CMD_PULSE4:
			if(IsActiveInterfaceDP83867())
				mode = 6;
			break;

		case CMD_PULSE64:
			if(IsActiveInterfaceDP83867())
				mode = 7;
			break;

		case CMD_MLT3:
			if(IsActiveInterfaceDP83867())
				mode = 5;
			break;
	}

	//Save previous state if we're not already in test mode
	auto oldGig = InterfacePHYRead(m_activeInterface, REG_GIG_CONTROL);
	if( (oldGig & 0xe000) == 0)
	{
		m_testModeSavedRegisters[0] = InterfacePHYRead(m_activeInterface, REG_BASIC_CONTROL);

		//KSZ9031 also needs preserving the MDIX register
		if(IsActiveInterfaceKSZ9031())
			m_testModeSavedRegisters[1] = InterfacePHYRead(m_activeInterface, REG_KSZ9031_MDIX);

		m_testModeSavedRegisters[2] = oldGig;
	}

	//Force link up, no negotiation, 1000baseT, and enable the test mode on all pairs
	InterfacePHYWrite(m_activeInterface, REG_BASIC_CONTROL, 0x0140);
	if(IsActiveInterfaceKSZ9031())
		InterfacePHYWrite(m_activeInterface, REG_KSZ9031_MDIX, 0x0040);
	if(IsActiveInterfaceDP83867())
		InterfacePHYExtendedWrite(m_activeInterface, 0x1f, REG_DP83867_TMCH_CTRL, 0x0480);
	InterfacePHYWrite(m_activeInterface, REG_GIG_CONTROL, 0x1000 | (mode << 13));

	//Update link state
	g_log("Interface %s (%s): link is sending test pattern\n",
		g_interfaceNames[m_activeInterface], g_interfaceDescriptions[m_activeInterface]);
	g_linkState[m_activeInterface] = LINK_STATE_TESTPATTERN;
}

void SwitchCLISessionContext::OnNoTestPattern()
{
	//Restore old register values in reverse order
	InterfacePHYWrite(m_activeInterface, REG_GIG_CONTROL, m_testModeSavedRegisters[2]);
	if(IsActiveInterfaceKSZ9031())
		InterfacePHYWrite(m_activeInterface, REG_KSZ9031_MDIX, m_testModeSavedRegisters[1]);
	InterfacePHYWrite(m_activeInterface, REG_BASIC_CONTROL, m_testModeSavedRegisters[0]);

	//Restart negotiation so the link comes back up
	RestartNegotiation(m_activeInterface);

	g_log("Interface %s (%s): link is down\n",
		g_interfaceNames[m_activeInterface], g_interfaceDescriptions[m_activeInterface]);
	g_linkState[m_activeInterface] = LINK_STATE_DOWN;
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "zeroize"

void SwitchCLISessionContext::OnZeroize()
{
	g_kvs->WipeAll();
	OnReload();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Miscellaneous helpers

void SwitchCLISessionContext::RestartNegotiation(int nport)
{
	auto base = InterfacePHYRead(nport, REG_BASIC_CONTROL);
	InterfacePHYWrite(nport, REG_BASIC_CONTROL, base | 0x0200);
}
