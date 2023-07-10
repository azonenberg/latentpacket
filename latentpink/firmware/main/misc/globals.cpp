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

/**
	@brief Global Ethernet interface
 */
EthernetInterface* g_ethIface = nullptr;

/**
	@brief Global key-value store for persistent configuration
 */
KVS* g_kvs = nullptr;

/**
	@brief Logger for output stuff
 */
Logger g_log;

/**
	@brief Timer used by logger
 */
Timer* g_logTimer = nullptr;

/**
	@brief Interface to the FPGA
 */
FPGAInterface* g_fpga = nullptr;

/**
	@brief State of each port
 */
linkstate_t g_linkState[NUM_PORTS];

/**
	@brief Speed of each port
 */
linkspeed_t g_linkSpeed[NUM_PORTS];

/**
	@brief Mapping of link state IDs to printable names
 */
const char* g_linkStateNames[] =
{
	"notconnect",
	"connected",
	"admindown",
	"errdisable",
	"testpattern"
};

/**
	@brief Hardware names for each port
 */
const char* g_interfaceNames[NUM_PORTS] =
{
	"g0",
	"g1",
	"g2",
	"g3",
	"g4",
	"g5",
	"g6",
	"g7",
	"g8",
	"g9",
	"g10",
	"g11",
	"g12",
	"g13",
	"xg0",
	"mgmt0"
};

/**
	@brief Pretty-printed names for each port
 */
const char g_interfaceDescriptions[NUM_PORTS][64] =
{
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (VSC8512)",
	"Edge port (DP83867CS)",
	"Edge port (DP83867CS)",
	"SFP+ uplink",
	"Management (KSZ9031RNX)"
};

/**
	@brief Mapping of link speed IDs to printable names
 */
const char* g_linkSpeedNames[] =
{
	"10",
	"100",
	"1000",
	"10G"
};

/**
	@brief VLAN ID for each port
 */
uint16_t g_portVlans[NUM_PORTS] = {0};

/**
	@brief Our MAC address
 */
MACAddress g_macAddress;

/**
	@brief Our IPv4 address
 */
IPv4Config g_ipConfig;
