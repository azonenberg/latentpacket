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

/**
	@brief Gets the type of port in a given switch slot

	@param slot		Slot index

	@return			Type of port in that slot. All ports in a given slot have the same type.
 */
PortType GetSlotPortType(unsigned int slot);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Generic port configuration

/**
	@brief Enable or disable a port.

	@param port		Port ID
	@param enable	Enables port if true, forces to LINK_ADMDOWN if false
 */
void EnablePort(port_t port, bool enable);

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
	@brief Sets the trunking mode of a port

	@param mode		Trunking mode
 */
void SetPortMode(PortMode mode);


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
// Port info for debug commands etc

/**
	@brief Gets a description of the hardware attached to the specified port.

	Example return values are "DP83867 (SGMII)" or "SFP+"

	@param port			Port ID

	@return				Constant string identifiying the port
 */
const char* GetPortHwDescription(port_t port);

/**
	@brief Connector type for an interface
 */
enum ConnectorType
{
	CONNECTOR_RJ45,
	CONNECTOR_LC,
	CONNECTOR_MPO,
	CONNECTOR_UNKNOWN
};

/**
	@brief Gets the type of connector attached to a given port

	@param port			Port ID

	@return				Type of connector
 */
ConnectorType GetPortConnectorType(port_t port);

/**
	@brief Media types for an interface
 */
enum MediaType
{
	MEDIA_1GBASE_T,
	MEDIA_1GBASE_SX,
	MEDIA_1GBASE_LX,
	MEDIA_10GBASE_SR,
	MEDIA_10GBASE_LR,
	MEDIA_40GBASE_SR4,
	MEDIA_40GBASE_SR4_BIDI
};

/**
	@brief Gets the physical media a port is connected to

	@param port			Port ID

	@return				Type of media
 */
MediaType GetPortMediaType(port_t port);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Performance counters

/**
	@brief Stats for a switch port
 */
struct perfcount_t
{
	//Total data seen, whether good or not
	uint64_t bytes_in;
	uint64_t frames_in;

	//Errors on the inbound interface
	uint64_t runts_in;
	uint64_t jumbos_in;
	uint64_t crc_in;
	uint64_t overflow_in:

	//Types of frame
	uint64_t unicasts_in;
	uint64_t broadcasts_in;
	uint64_t unicasts_out;
	uint64_t broadcasts_out;

	//Total data forwarded
	uint64_t bytes_out;
	uint64_t frames_out;

	//Link load (0-255)
	uint8_t tx_load;
	uint8_t rx_load;
};

/**
	@brief Gets stats for a switch port

	@param port				Port ID
	@return					Performance counters
 */
perfcount_t GetPortPerformanceCounters(port_t port);

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

/**
	@brief A single entry in the MAC address table
 */
typedef struct
{
	bool		valid;
	uint16_t	vlan;
	port_t		port;
	uint8_t		mac_addr[6];
} macentry_t;

/**
	@brief Gets the number of entries in the MAC address table

	@return Size of the MAC table
 */
uint32_t GetMacTableSize();

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// RTC stuff

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Credential stuff

#endif
