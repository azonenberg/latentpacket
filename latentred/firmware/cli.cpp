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

#include "latentred.h"

void CLI::RunPrompt(const char* prompt)
{
	//Show the prompt
	g_uart.PrintString(prompt);

	//The line of user input we're parsing
	Command command;

	//The token we're currently typing
	size_t currentToken = 0;

	//The byte offset within the token we're typing
	size_t tokenOffset = 0;

	while(1)
	{
		char c = g_uart.BlockingRead();

		//End of line means the command is ready to execute
		if( (c == '\r') || (c == '\n') )
		{
			g_uart.PrintString("\n");
			break;
		}

		//Backspace
		else if(c == 0x7f)
		{
			//We're at the end of the current token
			//TODO: handle being in the middle of a token (can't happen until we implement arrow keys)
			if(tokenOffset > 0)
			{
				//Delete the character
				//move left, space over the deleted character, move left for good this time
				g_uart.PrintString("\x1b[D \x1b[D");

				//Move back one character and wipe the previous token byte
				tokenOffset --;
				command.m_tokens[currentToken].m_text[tokenOffset] = '\0';
			}

			//We just started a new token and changed our mind.
			else if(currentToken > 0)
			{
				//Delete the space
				g_uart.PrintString("\x1b[D");

				//Move to end of previous token
				currentToken --;
				tokenOffset = strlen(command.m_tokens[currentToken].m_text);
			}

			//Backspace at the start of the prompt. Ignore it.
			else
			{
			}
		}

		//Escape sequences
		else if(c == 0x1b)
		{
			char brace = g_uart.BlockingRead();
			char code = g_uart.BlockingRead();

			//Next char should be a [
			if(brace != '[')
			{
				g_uart.PrintString("Malformed escape sequence, expected [ after esc\n");
				continue;
			}

			//Now comes the actual escape code
			//D = left, C = right, B = down, A = up

			//TODO: handle up/down

			//TODO: handle left/right
		}

		//Tab complete the current token
		else if(c == '\t')
		{
			//TODO
		}

		//Ignore other non-printable characters
		else if(!isprint(c))
			g_uart.Printf("\nIgnoring nonprintable: 0x%02x\n", c);

		//Space ends the current token
		else if(c == ' ')
		{
			g_uart.PrintBinary(c);
			tokenOffset = 0;

			//If the current token is empty, don't move to another one (ignore consecutive spaces)
			if(strlen(command.m_tokens[currentToken].m_text) == 0)
				continue;

			//Not empty. Start a new token.
			currentToken ++;

			//If we're out of token space, stop
			if(currentToken >= MAX_TOKENS)
				break;
		}

		//Echo characters as typed
		else
		{
			g_uart.PrintBinary(c);

			//Save the character
			//TODO: handle insertion before end of token
			command.m_tokens[currentToken].m_text[tokenOffset ++] = c;

			//If the token is stupidly long, abort
			if(tokenOffset >= MAX_TOKEN_LEN)
				break;
		}
	}

	//Done, print the final output
	g_uart.Printf("Parsed command:\n");
	for(size_t i=0; i<MAX_TOKENS; i++)
	{
		if(strlen(command.m_tokens[i].m_text) == 0)
			break;
		g_uart.Printf("    %d: %s\n", i, command.m_tokens[i].m_text);
	}
	g_uart.Printf("currentToken: %d\n", currentToken);
	g_uart.Printf("tokenOffset: %d\n", tokenOffset);
}
