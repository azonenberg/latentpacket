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

#ifndef LogSink_h
#define LogSink_h

/**
	@brief A destination for Logger that can output to multiple CLIOutputStream's

	TODO: look into refactoring Logger so it can write directly to a CLIOutputStream?
 */
template<uint32_t MAX_SINKS>
class LogSink : public CharacterDevice
{
public:

	LogSink(CharacterDevice* primary)
		: m_primary(primary)
	{
		for(uint32_t i=0; i<MAX_SINKS; i++)
			m_sinks[i] = nullptr;
	}

	/**
		@brief Adds a new log sink
	 */
	void AddSink(CLIOutputStream* sink)
	{
		for(uint32_t i=0; i<MAX_SINKS; i++)
		{
			if(!m_sinks[i])
			{
				m_sinks[i] = sink;
				break;
			}
		}
	}

	/**
		@brief Removes a log sink
	 */
	void RemoveSink(CLIOutputStream* sink)
	{
		for(uint32_t i=0; i<MAX_SINKS; i++)
		{
			if(m_sinks[i] == sink)
			{
				m_sinks[i] = nullptr;
				break;
			}
		}
	}

	virtual void PrintBinary(char ch)
	{
		m_primary->PrintBinary(ch);
		for(uint32_t i=0; i<MAX_SINKS; i++)
		{
			if(m_sinks[i])
			{
				m_sinks[i]->PutCharacter(ch);
				m_sinks[i]->Flush();
			}
		}
	}

	virtual void PrintText(char ch)
	{
		m_primary->PrintText(ch);
		for(uint32_t i=0; i<MAX_SINKS; i++)
		{
			if(m_sinks[i])
			{
				m_sinks[i]->PutCharacter(ch);
				m_sinks[i]->Flush();
			}
		}
	}

	virtual void PrintString(const char* str)
	{
		m_primary->PrintString(str);
		for(uint32_t i=0; i<MAX_SINKS; i++)
		{
			if(m_sinks[i])
			{
				m_sinks[i]->PutString(str);
				m_sinks[i]->Flush();
			}
		}
	}

protected:
	CharacterDevice* m_primary;

	CLIOutputStream* m_sinks[MAX_SINKS];
};

#endif
