/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2019 Andrew D. Zonenberg                                                                               *
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

#ifndef switchapi_h
#define switchapi_h

#include <stdbool.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Convenient helpers for port types

typedef struct
{
	///Slot number within the switch chassis
	unsigned int slot;

	///Port number within the slot
	unsigned int port;

	///Lane number within the port (only valid for QSFP+ and similar, always zero at other speeds)
	unsigned int lane;

} port_t;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Slot configuration

/**
	@brief Get the number of slots on the switch chassis.

	A slot is a group of one or more ports, all of the same physical type, but potentially running at different speeds.

	@return			Number of slots, always nonzero.
					Slot number 0 is the switch engine board and line card numbering starts at 1.
 */
unsigned int GetNumSwitchSlots();

/**
	@brief Gets the number of ports in a given switch slot.

	@param	slot	Slot index

	@return 		Number of ports in slot
 */
unsigned int GetNumPortsInSlot(unsigned int slot);

/**
	@brief Type of a physical interface
 */
enum PortType
{
	PORT_TYPE_COPPER,	//Copper interface, typically SGMII or RGMII
	PORT_TYPE_SFP,		//SFP/SFP+ optical interface
	PORT_TYPE_QSFP		//QSFP+ optical interface, may be divided into subinterfaces in the future
};

/**
	@brief Gets the type of port in a given switch slot

	@param slot		Slot index

	@return			Type of port in that slot. All ports in a given slot have the same type.
 */
PortType GetSlotPortType(unsigned int slot);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Generic port configuration

/**
	@brief States a port can be in
 */
enum LinkState
{
	///Link is up
	LINK_UP,

	///Working normally, but no link
	LINK_DOWN,

	///Err-disabled
	LINK_ERRDOWN,

	///Administratively disabled
	LINK_ADMDOWN
};

/**
	@brief Gets the current state of a port

	@param port		Port ID

	@return			State of the link
 */
LinkState GetLinkState(port_t port);

/**
	@brief Speeds that a port can operate at
 */
enum LinkSpeed
{
	SPEED_DOWN,
	SPEED_10M,
	SPEED_100M,
	SPEED_1G,
	SPEED_5G,
	SPEED_10G,
	SPEED_40G
};

/**
	@brief Gets the current speed of a port

	@param port		Port ID

	@return			Link speed, or SPEED_DOWN if link is down
 */
LinkSpeed GetLinkSpeed(port_t port);

/**
	@brief Port modes
 */
enum PortMode
{
	/**
		@brief Native VLAN mode.

		802.1q frames are treated as the respective vlan, untagged traffic is treated as the native vlan.
	 */
	MODE_NATIVE,

	///Trunk mode only. Only 802.1q traffic is passed, untagged traffic is dropped.
	MODE_TRUNK,

	///Untagged frames only. All ethertypes are passed except 802.1q which is dropped.
	MODE_ACCESS
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Copper port stuff

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Optic port stuff

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MAC table access

#endif
