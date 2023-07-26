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

#ifndef latentpink_h
#define latentpink_h

#ifdef SIMULATION
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#else
#include "stm32.h"
#include <peripheral/Flash.h>
#include <peripheral/GPIO.h>
#include <peripheral/I2C.h>
#include <peripheral/OctoSPI.h>
#include <peripheral/OctoSPIManager.h>
#include <peripheral/Power.h>
#include <peripheral/RCC.h>
#include <peripheral/SPI.h>
#include <peripheral/Timer.h>
#include <peripheral/UART.h>
#include <cli/UARTOutputStream.h>
#endif

#include "misc/LogSink.h"

#include <microkvs/kvs/KVS.h>
#ifdef SIMULATION
#include <microkvs/driver/TestStorageBank.h>
#endif

#include <util/Logger.h>
#include <util/StringBuffer.h>

#include <staticnet-config.h>
#include <staticnet/stack/staticnet.h>

#include "net/ManagementTCPProtocol.h"

#ifdef SIMULATION
#include <staticnet/drivers/tap/TapEthernetInterface.h>
#include "target/sim/SimCryptoEngine.h"
#endif

#include "misc/FPGAInterface.h"

#define MAX_LOG_SINKS SSH_TABLE_SIZE

extern KVS* g_kvs;
extern LogSink<MAX_LOG_SINKS>* g_logSink;
extern Logger g_log;
extern FPGAInterface* g_fpga;
extern Timer* g_logTimer;
extern EthernetInterface* g_ethIface;
extern MACAddress g_macAddress;
extern IPv4Config g_ipConfig;
extern EthernetProtocol* g_ethProtocol;
extern bool g_sfpPresent;
extern bool g_sfpFaulted;

#ifndef SIMULATION
extern UART* g_cliUART;
extern OctoSPI* g_qspi;
extern I2C* g_macI2C;
extern I2C* g_tempI2C;
extern I2C* g_sfpI2C;
extern GPIOPin* g_sfpModAbsPin;
extern GPIOPin* g_sfpTxDisablePin;
extern GPIOPin* g_sfpTxFaultPin;
#endif

//includes fabric ports, management, and uplink
#define NUM_PORTS 16
#define UPLINK_PORT 14
#define MGMT_PORT 15

enum linkstate_t
{
	LINK_STATE_DOWN,			//no link partner or failure to link
	LINK_STATE_UP,				//active
	LINK_STATE_ADMIN_DOWN,		//user forced the port off
	LINK_STATE_ERR_DISABLE,		//hardware failure or similar
	LINK_STATE_TESTPATTERN		//sending test pattern
};

enum linkspeed_t
{
	LINK_SPEED_10M,
	LINK_SPEED_100M,
	LINK_SPEED_1G,
	LINK_SPEED_10G
};

extern linkstate_t g_linkState[NUM_PORTS];
extern linkspeed_t g_linkSpeed[NUM_PORTS];
extern const char* g_linkStateNames[];
extern const char* g_linkSpeedNames[];
extern const char* g_linkSpeedNamesLong[];
extern const char* g_interfaceNames[];
extern const char g_interfaceDescriptions[NUM_PORTS][64];

extern const IPv4Address g_defaultIP;
extern const IPv4Address g_defaultNetmask;
extern const IPv4Address g_defaultBroadcast;
extern const IPv4Address g_defaultGateway;

extern uint16_t g_portVlans[NUM_PORTS];

#ifndef SIMULATION
void InitClocks();
void InitUART();
void InitTimer();
void InitQSPI();
void InitFPGA();
void InitI2C();
void InitEEPROM();
void InitSensors();
void InitSFP();
void PollSFP();
void InitManagementPHY();
void InitSGMIIPHYs();
void InitQSGMIIPHY();
void PollFPGA();
void PollPHYs();

uint16_t ReadThermalSensor(uint8_t addr);
uint16_t GetFanRPM(uint8_t channel);
uint16_t GetFPGATemperature();
uint16_t GetFPGAVCCINT();
uint16_t GetFPGAVCCAUX();
uint16_t GetFPGAVCCBRAM();

uint16_t ManagementPHYRead(uint8_t regid);
uint16_t ManagementPHYExtendedRead(uint8_t mmd, uint8_t regid);
void ManagementPHYWrite(uint8_t regid, uint16_t regval);
void ManagementPHYExtendedWrite(uint8_t regid, uint8_t mmd, uint16_t regval);

uint16_t SGMIIPHYRead(uint8_t phyid, uint8_t regid);
uint16_t SGMIIPHYExtendedRead(uint8_t phyid, uint8_t mmd, uint8_t regid);
void SGMIIPHYWrite(uint8_t phyid, uint8_t regid, uint16_t regval);
void SGMIIPHYExtendedWrite(uint8_t phyid, uint16_t regid, uint16_t regval);

uint16_t QSGMIIPHYRead(uint8_t phyid, uint8_t regid);
uint16_t QSGMIIPHYExtendedRead(uint8_t phyid, uint8_t mmd, uint8_t regid);
void QSGMIIPHYWrite(uint8_t phyid, uint8_t regid, uint16_t regval);
void QSGMIIPHYExtendedWrite(uint8_t phyid, uint8_t mmd, uint8_t regid, uint16_t regval);

uint16_t InterfacePHYRead(uint8_t portnum, uint8_t regid);
uint16_t InterfacePHYExtendedRead(uint8_t portnum, uint8_t mmd, uint8_t regid);

void InterfacePHYWrite(uint8_t portnum, uint8_t regid, uint16_t regval);
void InterfacePHYExtendedWrite(uint8_t portnum, uint8_t mmd, uint8_t regid, uint16_t regval);

void UpdateLinkState(uint8_t port, uint16_t bctl, uint16_t bstat);

void MemoryTest();
bool DoMemoryTest(uint32_t seed);

extern const char* g_tempSensorNames[4];
extern uint8_t g_tempSensorAddrs[4];
#endif

void InitLog(CharacterDevice* logdev, Timer* timer);
void InitKVS(StorageBank* left, StorageBank* right, uint32_t logsize);
void InitFPGAInterface();
void InitFPGA();
void InitInterfaces();
void ConfigureInterfaces();
void InitEthernet();
void InitIP();
void ConfigureIP();
void InitSSH();

void DetectHardware();

#ifdef SIMULATION
void OnShutdown();
#endif

enum mdioreg_t
{
	REG_BASIC_CONTROL	= 0x0,
	REG_BASIC_STATUS	= 0x1,
	REG_PHY_ID_1		= 0x2,
	REG_PHY_ID_2		= 0x3,

	REG_PHY_REGCR		= 0x0d,
	REG_PHY_ADDAR		= 0x0e,

	REG_DP83867_CFG4	= 0x0031
};

enum basic_ctl_bits
{
	BCTL_SPEED_MASK		= 0x2040,
	BCTL_SPEED_10M		= 0x0000,
	BCTL_SPEED_100M		= 0x2000,
	BCTL_SPEED_1G		= 0x0040
};

enum basic_status_bits
{
	BSTAT_LINK_STATE_UP		= 0x0004
};

#endif
