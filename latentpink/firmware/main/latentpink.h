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
#endif

#include <microkvs/kvs/KVS.h>
#include <microkvs/driver/TestStorageBank.h>

#include <util/Logger.h>
#include <util/StringBuffer.h>

/*
#include <staticnet-config.h>
#include <staticnet/stack/staticnet.h>
#include <staticnet/drivers/tap/TapEthernetInterface.h>

#include "BridgeTCPProtocol.h"
#include "BridgeCryptoEngine.h"
*/

#include "misc/FPGAInterface.h"

extern KVS* g_kvs;
extern Logger g_log;
extern FPGAInterface* g_fpga;
extern Timer* g_logTimer;

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
extern const char* g_interfaceNames[];
extern const char g_interfaceDescriptions[NUM_PORTS][64];

extern uint16_t g_portVlans[NUM_PORTS];

void InitLog(CharacterDevice* logdev, Timer* timer);
void InitKVS(StorageBank* left, StorageBank* right, uint32_t logsize);
void InitFPGAInterface();
void InitFPGA();
void InitInterfaces();

void DetectHardware();

#ifdef SIMULATION
void OnShutdown();
#endif

#endif
