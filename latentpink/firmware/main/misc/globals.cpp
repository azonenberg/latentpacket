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
	@brief Character device for logging
 */
LogSink<MAX_LOG_SINKS>* g_logSink = nullptr;

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
char g_interfaceDescriptions[NUM_PORTS][DESCRIPTION_LEN] =
{
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
};

/**
	@brief Default names for each port
 */
const char* g_defaultInterfaceDescriptions[NUM_PORTS] =
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
	@brief Mapping of link speed IDs to printable names
 */
const char* g_linkSpeedNamesLong[] =
{
	"10 Mbps",
	"100 Mbps",
	"1000 Mbps",
	"10 Gbps"
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

/**
	@brief Ethernet protocol stack
 */
EthernetProtocol* g_ethProtocol = nullptr;

#ifndef SIMULATION

/**
	@brief QSPI interface to FPGA
 */
OctoSPI* g_qspi = nullptr;

/**
	@brief UART console
 */
UART* g_cliUART = nullptr;

/**
	@brief I2C bus to MAC address EEPROM
 */
I2C* g_macI2C = nullptr;

/**
	@brief I2C bus to thermal sensors
 */
I2C* g_tempI2C = nullptr;

/**
	@brief I2C bus to SFP+
 */
I2C* g_sfpI2C = nullptr;

/**
	@brief Names for each temp sensors
 */
uint8_t g_tempSensorAddrs[4] =
{
	0x90,
	0x92,
	0x94,
	0x96
};

/**
	@brief Names for each temp sensor
 */
const char* g_tempSensorNames[4] =
{
	"MCU, 3V3 regulator",
	"RGMII PHY, 1V2 regulator",
	"SGMII PHYs",
	"QDR-II+, SFP+"
};

/**
	@brief SFP+ MOD_ABS pin
 */
GPIOPin* g_sfpModAbsPin = nullptr;

/**
	@brief SFP+ TX_DISABLE pin
 */
GPIOPin* g_sfpTxDisablePin = nullptr;

/**
	@brief SFP+ TX_FAULT pin
 */
GPIOPin* g_sfpTxFaultPin = nullptr;

/**
	@brief Flag indicating if the SFP+ optic in xg0 is present
 */
bool g_sfpPresent = false;

/**
	@brief Flag indicating if the SFP+ optic in xg0 has a laser fault
 */
bool g_sfpFaulted = false;

/**
	@brief Digital temperature sensor
 */
DigitalTempSensor* g_dts = nullptr;

#endif	//ifndef SIMULATION
