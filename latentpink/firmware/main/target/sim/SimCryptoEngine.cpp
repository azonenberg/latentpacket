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
#include "SimCryptoEngine.h"
#include <stdlib.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Construction / destruction

SimCryptoEngine::SimCryptoEngine()
{
	m_fpRandom = fopen("/dev/urandom", "rb");
	if(m_fpRandom == NULL)
	{
		perror("open /dev/urandom\n");
		exit(1);
	}
}

SimCryptoEngine::~SimCryptoEngine()
{
	fclose(m_fpRandom);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// State reset

void SimCryptoEngine::Clear()
{
	CryptoEngine::Clear();

	//TODO: reset encryptor and decryptor
	//(mostly for extra safety, they re-key each packet anyway)
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// RNG

void SimCryptoEngine::GenerateRandom(uint8_t* buf, size_t len)
{
	fread(buf, 1, len, m_fpRandom);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SHA256

void SimCryptoEngine::SHA256_Init()
{
	m_hash.Restart();
}

void SimCryptoEngine::SHA256_Update(const uint8_t* data, uint16_t len)
{
	m_hash.Update(data, len);
}

void SimCryptoEngine::SHA256_Final(uint8_t* digest)
{
	m_hash.Final(digest);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// AES


bool SimCryptoEngine::DecryptAndVerify(uint8_t* data, uint16_t len)
{
	m_decryptor.SetKeyWithIV(m_keyClientToServer, AES_KEY_SIZE, m_ivClientToServer, GCM_IV_SIZE);

	try
	{
		std::string cleartext;
		CryptoPP::AuthenticatedDecryptionFilter df(
			m_decryptor,
			new CryptoPP::StringSink(cleartext),
			CryptoPP::AuthenticatedDecryptionFilter::MAC_AT_END,
			GCM_TAG_SIZE);

		//Packet length is added as additional authenticated data, but not part of the normal AES payload
		uint32_t len_be = __builtin_bswap32(len - GCM_TAG_SIZE);
		df.ChannelPut( CryptoPP::AAD_CHANNEL, (uint8_t*)&len_be, sizeof(len_be) );

		df.ChannelPut( CryptoPP::DEFAULT_CHANNEL, data, len);

		df.ChannelMessageEnd(CryptoPP::AAD_CHANNEL);
		df.ChannelMessageEnd(CryptoPP::DEFAULT_CHANNEL);

		//Check the MAC
		if(!df.GetLastResult())
		{
			g_log("Verification failed\n");
			return false;
		}

		//Crypto++ can't do in place transforms, so copy it ourselves
		memcpy(data, cleartext.c_str(), cleartext.length());
	}
	catch(...)
	{
		return false;
	}

	//Increment IV
	//high 4 bytes stay constant
	//low 8 bytes are 64 bit big endian integer
	m_ivClientToServer[GCM_IV_SIZE-1] ++;
	for(int i=GCM_IV_SIZE-1; i>=4; i--)
	{
		if(m_ivClientToServer[i] == 0)
			m_ivClientToServer[i-1] ++;
		else
			break;
	}

	return true;
}

void SimCryptoEngine::EncryptAndMAC(uint8_t* data, uint16_t len)
{
	m_encryptor.SetKeyWithIV(m_keyServerToClient, AES_KEY_SIZE, m_ivServerToClient, GCM_IV_SIZE);

	std::string ciphertext;
	CryptoPP::AuthenticatedEncryptionFilter ef(
		m_encryptor,
		new CryptoPP::StringSink(ciphertext),
		false,
		GCM_TAG_SIZE,
		CryptoPP::DEFAULT_CHANNEL,
		CryptoPP::AuthenticatedEncryptionFilter::NO_PADDING);

	//Packet length is added as additional authenticated data, but not part of the normal AES payload
	uint32_t len_be = __builtin_bswap32(len);
	ef.ChannelPut( CryptoPP::AAD_CHANNEL, (uint8_t*)&len_be, sizeof(len_be) );

	ef.ChannelPut( CryptoPP::DEFAULT_CHANNEL, data, len);

	ef.ChannelMessageEnd(CryptoPP::AAD_CHANNEL);
	ef.ChannelMessageEnd(CryptoPP::DEFAULT_CHANNEL);

	//Crypto++ can't do in place transforms, so copy it ourselves
	memcpy(data, ciphertext.c_str(), ciphertext.length());

	//Increment IV
	//high 4 bytes stay constant
	//low 8 bytes are 64 bit big endian integer
	m_ivServerToClient[GCM_IV_SIZE-1] ++;
	for(int i=GCM_IV_SIZE-1; i>=4; i--)
	{
		if(m_ivServerToClient[i] == 0)
			m_ivServerToClient[i-1] ++;
		else
			break;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Accelerated crypto

void SimCryptoEngine::SharedSecret(uint8_t* sharedSecret, uint8_t* clientPublicKey)
{
	//Do the crypto operation on the CPU
	crypto_scalarmult(sharedSecret, m_ephemeralkeyPriv, clientPublicKey);

	//Ask the FPGA to do the crypto operation
	g_fpga->BlockingWrite(REG_CRYPT_BASE + REG_WORK, clientPublicKey, ECDH_KEY_SIZE);
	g_fpga->BlockingWrite(REG_CRYPT_BASE + REG_E, m_ephemeralkeyPriv, ECDH_KEY_SIZE);

	//Advance simulation time until it finishes without having to lock step
	g_fpga->CryptoEngineBlock();

	//Poll status until the crypto accelerator finishes
	uint8_t status = 1;
	while(status != 0)
		status = g_fpga->BlockingRead8(REG_CRYPT_BASE + REG_CRYPT_STATUS);

	//Read output
	uint8_t fpgaSharedSecret[ECDH_KEY_SIZE] = {0};
	g_fpga->BlockingRead(REG_CRYPT_BASE + REG_WORK_OUT, fpgaSharedSecret, ECDH_KEY_SIZE);

	if(!memcmp(fpgaSharedSecret, sharedSecret, ECDH_KEY_SIZE))
		g_log("OK: Calculated shared secrets match\n");
	else
		g_log("FAIL: Calculated shared secrets do not match\n");
}
