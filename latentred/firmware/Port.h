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

#ifndef Port_h
#define Port_h

class Board;

/**
	@brief Abstract base class for a switch port
 */
class Port
{
public:
	Port(Board* board);
	virtual ~Port();

	/**
		@brief Gets a printable description of the port (display only)
	 */
	virtual const char* GetDescription();

	/**
		@brief Gets the hardware name of the port (ex: x1/3)
	 */
	virtual const char* GetName() =0;

	/**
		@brief Data rate for a port.

		May be used as single values or bitmasks depending on context.
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
		@brief Gets the rate the port is currently operating at

		@return Current data rate, or SPEED_DOWN if link isn't up
	 */
	virtual LinkSpeed GetCurrentLinkSpeed() =0;

	/**
		@brief States a port can be in
	 */
	enum LinkState
	{
		///Link is up
		LINK_UP,

		///Working normally, but no link
		LINK_NOTCONNECT,

		///Transceiver is physically absent
		LINK_NOSFP,

		///Err-disabled
		LINK_ERRDOWN,

		///Administratively disabled
		LINK_ADMDOWN
	};

	/**
		@brief Gets the link state for a port
	 */
	virtual LinkState GetLinkState() =0;

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
		MODE_ACCESS,

		/**
			@brief Isolated port, not connected to the switch fabric (management only)
		 */
		MODE_ISOLATED
	};

	/**
		@brief Gets the trunking mode of a port

		@return			Trunk mode
	 */
	virtual PortMode GetMode() =0;

	/**
		@brief Gets the VLAN for a port.

		This is the native vlan for MODE_NATIVE, the access vlan for MODE_ACTIVE, and has no meaning in MODE_TRUNK.

		@return			Vlan ID
	 */
	virtual uint16_t GetVlan() =0;

	/**
		@brief Type of a physical interface
	 */
	enum PortType
	{
		TYPE_COPPER_SGMII,	//Copper interface using SGMII protocol
		TYPE_COPPER_RGMII,	//Copper interface using RGMII protocol
		TYPE_SFP,			//SFP/SFP+ optical interface
		TYPE_QSFP			//QSFP+ optical interface, may be divided into subinterfaces in the future
	};

	virtual PortType GetPortType() =0;

protected:
	Board* m_board;
	char m_description[64];
};

#endif
