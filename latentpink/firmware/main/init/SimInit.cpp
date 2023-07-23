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
	@brief	Initialization only used in simulation
 */

#include "latentpink.h"
#include "../target/sim/SimFPGAInterface.h"

/**
	@brief Detects and prints info about our hardware
 */
void DetectHardware()
{
	g_log("Identifying hardware\n");
	LogIndenter li(g_log);

	g_log("STM32H1234 stepping 0, TQFP-123\n");
	g_log("-1 kB total SRAM, -1 kB DTCM, up to -1 kB ITCM, -1 kB backup SRAM\n");
	g_log("-1 kB Flash\n");
	g_log("Lot %s, wafer %d, die (%d, %d)\n", "ASDFGHJK", 1, 2, 3);
}

/**
	@brief Initializes the connection to the FPGA
 */
void InitFPGAInterface()
{
	static SimFPGAInterface iface;
	g_fpga = &iface;
}

/**
	@brief Initializes the Ethernet interface
 */
void InitEthernet()
{
	g_log("Initializing Ethernet management\n");

	//Create the IP stack
	static TapEthernetInterface iface("simtap");
	g_ethIface = &iface;

	//Set our MAC address to a hard coded constant
	g_macAddress = {{ 0x02, 0xde, 0xad, 0xbe, 0xef, 0x41 }};
}