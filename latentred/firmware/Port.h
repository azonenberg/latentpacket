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
	enum speed_t
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
		@brief Determines if the port is currently linked up
		
		@return True if link up, false if link down
	 */
	virtual bool IsLinkUp() =0;
	
	/**
		@brief Gets the rate the port is currently operating at
		
		@return Current data rate, or SPEED_DOWN if link isn't up
	 */
	virtual speed_t GetCurrentLinkSpeed() =0;
	
protected:
	char m_description[64];
};

#endif
