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
	g_fpga->BlockingWrite(REG_CRYPT_BASE + REG_WORK, clientPublicKey, ECDH_KEY_SIZE);
	g_fpga->BlockingWrite(REG_CRYPT_BASE + REG_E, m_ephemeralkeyPriv, ECDH_KEY_SIZE);
	uint8_t status = 1;
	while(status != 0)
		status = g_fpga->BlockingRead8(REG_CRYPT_BASE + REG_CRYPT_STATUS);
	g_fpga->BlockingRead(REG_CRYPT_BASE + REG_WORK_OUT, sharedSecret, ECDH_KEY_SIZE);
}

/**
	@brief Generates an x25519 key pair.

	The private key is kept internal to the CryptoEngine object.

	The public key is stored in the provided buffer, which must be at least 32 bytes in size.
 */
void DeviceCryptoEngine::GenerateX25519KeyPair(uint8_t* pub)
{
	//To be a valid key, a few bits need well-defined values. The rest are cryptographic randomness.
	GenerateRandom(m_ephemeralkeyPriv, 32);
	m_ephemeralkeyPriv[0] &= 0xF8;
	m_ephemeralkeyPriv[31] &= 0x7f;
	m_ephemeralkeyPriv[31] |= 0x40;

	//Well defined curve25519 base point from crypto_scalarmult_base
	static uint8_t basepoint[ECDH_KEY_SIZE] =
	{
		9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	};

	//Make the FPGA do the rest of the work
	g_fpga->BlockingWrite(REG_CRYPT_BASE + REG_WORK, basepoint, ECDH_KEY_SIZE);
	g_fpga->BlockingWrite(REG_CRYPT_BASE + REG_E, m_ephemeralkeyPriv, ECDH_KEY_SIZE);
	uint8_t status = 1;
	while(status != 0)
		status = g_fpga->BlockingRead8(REG_CRYPT_BASE + REG_CRYPT_STATUS);
	g_fpga->BlockingRead(REG_CRYPT_BASE + REG_WORK_OUT, pub, ECDH_KEY_SIZE);
}
