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

#ifndef cli_h
#define cli_h

/**
	@file
	@author Andrew D. Zonenberg
	@brief Functions related to the command-line interface itself (not specific commands)
 */

/**
	@brief A single keyword in the CLI command tree
 */
struct clikeyword_t
{
	///ASCII representation of the unabbreviated keyword
	const char*			keyword;

	///Integer identifier used by the command parser
	uint32_t			id;

	///Child nodes for subsequent words
	clikeyword_t*		children;
};

/**
	@brief The command-line interface
 */
class CLI
{
public:

	/**
		@brief Shows the prompt, then reads a line of input
	 */
	void RunPrompt(const char* prompt);

protected:

	///@brief The token we're currently typing into
	size_t m_currentToken;

	///@brief Our position within that token
	size_t m_tokenOffset;

	///@brief Index of the last token we currently have
	size_t m_lastToken;

	void OnBackspace(Command& command);
	void OnTabComplete(Command& command);
	void OnSpace(Command& command);
	void OnLeftArrow(Command& command);
	void OnRightArrow(Command& command);
	void OnKey(Command& command, char c);

	void RedrawLineRightOfCursor(Command& command);
};

#endif
