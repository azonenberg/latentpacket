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
`ifndef NetworkPerfCounters_svh
`define NetworkPerfCounters_svh

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Names of registers

//High 8 bits identifies clock domain
//Low 8 is register within the domain
typedef enum logic[15:0]
{
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SGMIIToGMIIBridge (only for DP83867 based ports)

	//clk_sgmii_rx domain
	REG_RX_DISPARITY_ERRS			= 16'h0000,
	REG_RX_SYMBOL_ERRS				= 16'h0001,
	REG_RX_BITSLIPS					= 16'h0002,
	REG_RX_SYMBOLS					= 16'h0003,

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// EthernetPerformanceCounters (for all interfaces)

	//REG_TX_* and REG_RX_* must not have common LSBs
	//(to allow for MAC_TX_RX_SAME_CLOCK)

	//clk_mac_tx domain
	REG_TX_FRAMES					= 16'h1000,
	REG_TX_BYTES					= 16'h1001,

	//clk_mac_rx domain
	REG_RX_FRAMES					= 16'h1180,
	REG_RX_CRC_ERRS					= 16'h1181,
	REG_RX_BYTES					= 16'h1182

} regid_t;

`endif
