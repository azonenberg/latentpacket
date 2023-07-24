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
#include "DeviceCryptoEngine.h"

DeviceCryptoEngine::DeviceCryptoEngine()
{
}

DeviceCryptoEngine::~DeviceCryptoEngine()
{
}

void DeviceCryptoEngine::SharedSecret(uint8_t* sharedSecret, uint8_t* clientPublicKey)
{
	//Calculate the shared secret using our software implementation
	uint32_t start = g_logTimer->GetCount();
	CryptoEngine::SharedSecret(sharedSecret, clientPublicKey);
	uint32_t delta = g_logTimer->GetCount() - start;
	g_log("Shared secret calculation using software implementation took %d.%d ms\n", delta/10, delta % 10);

	//Repeat using FPGA implementation
	uint8_t fpgaSharedSecret[ECDH_KEY_SIZE] = {0};
	start = g_logTimer->GetCount();
	g_fpga->BlockingWrite(REG_CRYPT_BASE + REG_WORK, clientPublicKey, ECDH_KEY_SIZE);
	g_fpga->BlockingWrite(REG_CRYPT_BASE + REG_E, m_ephemeralkeyPriv, ECDH_KEY_SIZE);
	uint8_t status = 1;
	while(status != 0)
		status = g_fpga->BlockingRead8(REG_CRYPT_BASE + REG_CRYPT_STATUS);
	g_fpga->BlockingRead(REG_CRYPT_BASE + REG_WORK_OUT, fpgaSharedSecret, ECDH_KEY_SIZE);
	delta = g_logTimer->GetCount() - start;
	g_log("Shared secret calculation using FPGA implementation took %d.%d ms\n", delta/10, delta % 10);

	//Verify result
	if(!memcmp(fpgaSharedSecret, sharedSecret, ECDH_KEY_SIZE))
		g_log("OK: Calculated shared secrets match\n");
	else
		g_log("FAIL: Calculated shared secrets do not match\n");
}
