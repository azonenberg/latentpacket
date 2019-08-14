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
#include <stdint.h>

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

	///Transceiver is physically absent
	LINK_NOSFP,

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
	@brief Enable or disable a port.
	
	@param port		Port ID
	@param enable	Enables port if true, forces to LINK_ADMDOWN if false
 */
void EnablePort(port_t port, bool enable);

/**
	@brief Speeds that a port can operate at
 */
enum LinkSpeed
{
	SPEED_DOWN	= 0,
	SPEED_10M	= 1,
	SPEED_100M	= 2,
	SPEED_1G	= 4,
	SPEED_5G	= 8,
	SPEED_10G	= 0x10,
	SPEED_40G	= 0x20
};

/**
	@brief Gets the current speed of a port

	@param port		Port ID

	@return			Link speed, or SPEED_DOWN if link is down
 */
LinkSpeed GetLinkSpeed(port_t port);

/**
	@brief Forces a port to operate at a certain speed and disables negotiation
	
	@param port		Port ID
	@param speed	Link speed
 */
void ForceLinkSpeed(port_t port, LinkSpeed speed);

/**
	@brief Gets a bitmask of speeds this port is physically capable of operating at.
	
	@param port		Port ID

	@return			Speed mask
 */
uint32_t GetPossibleSpeeds(port_t port);

/**
	@brief Port modes
 */
enum PortMode
{
	/**
		@brief Native VLAN mode, roughly analogous to Cisco "trunk" mode

		802.1q frames are treated as the respective vlan, untagged traffic is treated as the native vlan.
	 */
	MODE_NATIVE,

	/**
		@brief Forced trunk mode.

		Only 802.1q traffic is passed, untagged traffic is dropped.
	 */
	MODE_TRUNK,

	/**
		@brief Forced access mode, roughly analogous to Cisco "access" mode

		Untagged frames only. All ethertypes are passed except 802.1q which is dropped.
	 */
	MODE_ACCESS
};

/**
	@brief Gets the trunking mode of a port
	
	@param port		Port ID

	@return			Trunk mode
 */
PortMode GetPortMode(port_t port);

/**
	@brief Sets the trunking mode of a port
	
	@param port		Port ID
	@param mode		Trunking mode
 */
void SetPortMode(port_t port, PortMode mode);

/**
	@brief Gets the autonegotiation enable status of a port.
	
	Autonegotiation is only supported for copper ports. Returns false for all optic ports.
	
	@param port		Port ID

	@return			Autonegotiation status
 */
bool IsAutonegotiationEnabled(port_t port);

/**
	@brief Enable or disable autonegotiation on a port.
	
	Autonegotiation is only supported for copper ports. Ignored for all optic ports.
	
	@param port		Port ID
	@param state	True to enable autonegotiation, false to disable
 */
void EnableAutonegotiation(port_t port port, bool state);

/**
	@brief Gets a bitmask of speeds this port is willing to negotiate.
	
	@param port		Port ID

	@return			Speed mask
 */
uint32_t GetNegotiationSpeeds(port_t port);


/**
	@brief Sets the allowed speeds for a port.
	
	If speeds are requested that the port is incapable of operating at, they are ignored. If no legal speeds are
	selected, the link will fail to come up.
	
	@param port			Port ID
	@param speedmask	Bitmask of LinkSpeed values.
 */
void SetNegotiationSpeeds(port_t port, uint32_t speedmask);

/**
	@brief Gets the VLAN for a port.
	
	This is the native vlan for MODE_NATIVE, the access vlan for MODE_ACTIVE, and has no meaning in MODE_TRUNK.
	
	@param port		Port ID
	
	@return			Vlan ID
 */
uint16_t GetPortVlan(port_t port);

/**
	@brief Sets the VLAN for a port
	
	@param port		Port ID
	@param vlan		VLAN ID
 */
void SetPortVlan(port_t port, uint16_t vlan);

/**
	@brief Gets the allowed-VLAN bitmask for a port.
	
	A VLAN bitmask consists of 4096 bits organized as 128 32-bit values with VLAN ID increasing from LSB to MSB.
	For example:
	* VLAN 0 is the LSB of vlanmask[0]
	* VLAN 31 is the MSB of vlanmask[0]
	* VLAN 32 is the LSB of vlanmask[1].
	
	@param port			Port ID
	@param vlanmask		Array of 128 values to store the vlan mask in
 */
void GetTrunkVlanMask(port_t port, uint32_t* vlanmask);

/**
	@brief Sets the allowed-VLAN bitmask for a port.
	
	@param port			Port ID
	@param vlanmask		Array of 128 values to load the vlan mask from
 */
void SetTrunkVlanMask(port_t port, uint32_t* vlanmask);


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Copper port stuff

/**
	@brief Checks if a port is capable of doing TDR diagnostics
	
	@param port		Port ID
	
	@return True if TDR capable
 */
bool IsTdrCapable(port_t port);

/**
	@brief Starts a TDR test on a port
	
	@param port		Port ID
 */
void StartTDRTest(port_t port);

/**
	@brief Checks if the TDR test is done
	
	@return			True if done, false if in progress or not started
 */
bool IsTDRResultReady(port_t port);

/**
	@brief A single TDR peak
	
	DP83867 notes: http://www.ti.com/lit/an/snla253/snla253.pdf
 */
typedef struct
{
	unsigned int distance;		//cm, converted from time units by PHY driver. Typically has around 0.5-1m precision.
	int amplitude;				//arbitrary units, scaled to +/- 255
} tdrpeak_t;

/**
	@brief Peaks for a single pair of the cable
 */
typedef struct
{
	//The peaks
	tdrpeak_t	peaks[5];
	
	//If set, too many peaks were found to display
	bool		peak_overflow;
	
	//If set, crosstalk from another channel was detected
	bool		crosstalk;
	
} tdrpair_t;

/**
	@brief TDR test results
	
	This struct is based around the DP83867 test capability. Other PHYs may have less fancy features.
 */
typedef struct
{
	//Stats for each channel
	tdrpair_t pairs[4];
} tdrresult_t;

/**
	@brief View TDR test result for a port
	
	@param port		Port ID
	
	@return	TDR test results
 */
tdrresult_t GetTDRResult(port_t port);

/**
	@brief Test patterns for copper PHY verification
 */
enum PhyTestMode
{
	PHY_TEST_NORMAL,		//Not testing, normal operation
	PHY_TEST_WAVEFORM,		//1000base-T waveform test pattern
	PHY_TEST_JITTER_MASTER,	//1000base-T jitter test, master mode
	PHY_TEST_JITTER_SLAVE,	//1000base-T jitter test, slave mode
	PHY_TEST_DISTORTION,	//1000base-T distortion test
	PHY_TEST_MLT3_IDLE,		//100base-TX MLT-3 idles (DP83867 specific)
	PHY_TEST_1_3Z,			//Repeating sequence of 1 bit followed by 3 zero bits (DP83867 specific)
	PHY_TEST_1_64Z,			//Repeating sequence of 1 bit followed by 64 zero bits (DP83867 specific)
};

/**
	@brief Configures test pattern mode on a port
	
	@param port		Port ID
	@param mode		Test mode
 */
void SetPortTestMode(port_t port, PhyTestMode mode);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Optic port stuff

/**
	@brief Checks if a port's transceiver is present.
	
	@param port		Port ID
	
	@return True if copper port or optical port with a transceiver present, false for optical port with no transceiver
 */
bool IsTransceiverPresent(port_t port);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MAC table access

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// RTC stuff

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Credential stuff

#endif
