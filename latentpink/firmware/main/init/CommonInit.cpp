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
	@brief	Common initialization used by both simulation and real hardware
 */

#include "latentpink.h"
#include "net/ManagementTCPProtocol.h"

/**
	@brief Initialize the logging library
 */
void InitLog(CharacterDevice* logdev, Timer* timer)
{
	g_logTimer = timer;

	g_log.Initialize(logdev, timer);
	g_log("Logging ready\n");
	g_log("LATENTPINK MCU firmware v0.1 by Andrew D. Zonenberg\n");
	{
		LogIndenter li(g_log);
		g_log("This system is open hardware! Board design files and firmware/gateware source code are at:\n");
		g_log("https://github.com/azonenberg/latentpacket\n");
	}
	g_log("Firmware compiled at %s on %s\n", __TIME__, __DATE__);
}

/**
	@brief Set up the microkvs key-value store for persisting our configuration
 */
void InitKVS(StorageBank* left, StorageBank* right, uint32_t logsize)
{
	g_log("Initializing microkvs key-value store\n");
	static KVS kvs(left, right, logsize);
	g_kvs = &kvs;

	LogIndenter li(g_log);
	g_log("Block size:  %d bytes\n", kvs.GetBlockSize());
	g_log("Log:         %d / %d slots free\n", (int)kvs.GetFreeLogEntries(), (int)kvs.GetLogCapacity());
	g_log("Data:        %d / %d bytes free\n", (int)kvs.GetFreeDataSpace(), (int)kvs.GetDataCapacity());
	g_log("Active bank: %s\n", kvs.IsLeftBankActive() ? "left" : "right");
}

/**
	@brief Bring up the control interface to the FPGA
 */
void InitFPGA()
{
	g_log("Initializing FPGA\n");
	LogIndenter li(g_log);

	//Wait 500ms to make sure the FPGA is booted
	//TODO: more formal handshake
	g_log("Waiting for boot\n");
	g_logTimer->Sleep(5000);

	//Read the FPGA IDCODE and serial number
	uint8_t buf[8];
	g_fpga->BlockingRead(REG_FPGA_IDCODE, buf, 4);
	uint32_t idcode = (buf[0] << 24) | (buf[1] << 16) | (buf[2] << 8) | buf[3];
	g_fpga->BlockingRead(REG_FPGA_SERIAL, buf, 8);

	//Print status
	switch(idcode & 0x0fffffff)
	{
		case 0x364c093:
			g_log("IDCODE: %08x (XC7K160T rev %d)\n", idcode, idcode >> 28);
			break;

		default:
			g_log("IDCODE: %08x (unknown device, rev %d)\n", idcode, idcode >> 28);
			break;
	}
	g_log("Serial: %02x%02x%02x%02x%02x%02x%02x%02x\n", buf[0], buf[1], buf[2], buf[3], buf[4], buf[5], buf[6], buf[7]);
}

/**
	@brief Initialize all of our network interfaces

	This includes boot-time init plus loading configuration
 */
void InitInterfaces()
{
	for(uint32_t i=0; i<NUM_PORTS; i++)
	{
		//Mark each interface as down
		g_linkState[i] = LINK_STATE_DOWN;

		//Set default speed
		if(i == UPLINK_PORT)
			g_linkSpeed[i] = LINK_SPEED_10G;
		else
			g_linkSpeed[i] = LINK_SPEED_1G;
	}

	ConfigureInterfaces();
}

/**
	@brief Loads interface configuration from the KVS and applies it
 */
void ConfigureInterfaces()
{
	for(uint32_t i=0; i<NUM_PORTS; i++)
	{
		//Base address of the interface
		uint32_t ifbase = REG_INTERFACE_BASE + i*INTERFACE_STRIDE;

		//VLAN configuration (on everything but management interface)
		if(i != MGMT_PORT)
		{
			g_portVlans[i] = g_kvs->ReadObject<uint16_t>(1, "%s.vlan", g_interfaceNames[i]);
			g_fpga->BlockingWrite16(ifbase + REG_VLAN_NUM, g_portVlans[i]);
		}
		else
			g_portVlans[i] = 0;
	}
}

/**
	@brief Set our IP address and initialize the IP stack
 */
void InitIP()
{
	g_log("Initializing management IPv4 interface\n");
	LogIndenter li(g_log);

	ConfigureIP();

	//ARP cache (shared by all interfaces)
	static ARPCache cache;

	//Per-interface protocol stacks
	static EthernetProtocol eth(*g_ethIface, g_macAddress);
	g_ethProtocol = &eth;
	static ARPProtocol arp(eth, g_ipConfig.m_address, cache);

	//Global protocol stacks
	static IPv4Protocol ipv4(eth, g_ipConfig, cache);
	static ICMPv4Protocol icmpv4(ipv4);
	static ManagementTCPProtocol tcp(&ipv4);

	//Register protocol handlers with the lower layer
	eth.UseARP(&arp);
	eth.UseIPv4(&ipv4);
	ipv4.UseICMPv4(&icmpv4);
	ipv4.UseTCP(&tcp);
}

/**
	@brief Load our IP configuration from the KVS
 */
void ConfigureIP()
{
	IPv4Address defaultIP			= { .m_octets{192, 168,   1,   2} };
	IPv4Address defaultNetmask		= { .m_octets{255, 255, 255,   0} };
	IPv4Address defaultBroadcast	= { .m_octets{192, 168,   1, 255} };
	IPv4Address defaultGateway		= { .m_octets{192, 168,   1,   1} };

	g_ipConfig.m_address = g_kvs->ReadObject<IPv4Address>(defaultIP, "ip.address");
	g_ipConfig.m_netmask = g_kvs->ReadObject<IPv4Address>(defaultNetmask, "ip.netmask");
	g_ipConfig.m_broadcast = g_kvs->ReadObject<IPv4Address>(defaultIP, "ip.broadcast");
	g_ipConfig.m_gateway = g_kvs->ReadObject<IPv4Address>(defaultIP, "ip.gateway");
}
