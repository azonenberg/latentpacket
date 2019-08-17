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

static const char* CURSOR_LEFT = "\x1b[D";
static const char* CURSOR_RIGHT = "\x1b[C";

void CLI::RunPrompt(const char* prompt)
{
	//Show the prompt
	g_uart.PrintString(prompt);

	//The line of user input we're parsing
	Command command;

	m_currentToken = 0;
	m_tokenOffset = 0;
	m_lastToken = 0;

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
			OnBackspace(command);

		//Escape sequences
		else if(c == 0x1b)
		{
			//Next char should be a [
			if(g_uart.BlockingRead() != '[')
			{
				g_uart.PrintString("Malformed escape sequence, expected [ after esc\n");
				continue;
			}

			//and the actual escape code
			char code = g_uart.BlockingRead();
			switch(code)
			{
				//B = down, A = up

				case 'C':
					OnRightArrow(command);
					break;

				case 'D':
					OnLeftArrow(command);
					break;

				default:
					break;
			}
		}

		//Tab complete the current token
		else if(c == '\t')
			OnTabComplete(command);

		//Ignore other non-printable characters
		else if(!isprint(c))
			g_uart.Printf("\nIgnoring nonprintable: 0x%02x\n", c);

		//Space ends the current token
		else if(c == ' ')
			OnSpace(command);

		//Echo characters as typed
		else
			OnKey(command, c);

		//Update the last token (TODO: only when needed)
		for(size_t i=0; i<MAX_TOKENS; i++)
		{
			if(strlen(command.m_tokens[i].m_text) == 0)
				break;
			m_lastToken = i;
		}
	}

	//Done, print the final output
	g_uart.Printf("Parsed command:\n");
	for(size_t i=0; i<=m_lastToken; i++)
		g_uart.Printf("    %d: %s\n", i, command.m_tokens[i].m_text);
	g_uart.Printf("currentToken: %d\n", m_currentToken);
	g_uart.Printf("lastToken: %d\n", m_lastToken);
	g_uart.Printf("tokenOffset: %d\n", m_tokenOffset);
}

void CLI::OnKey(Command& command, char c)
{
	//If the token doesn't have room for another character, abort
	char* token = command.m_tokens[m_currentToken].m_text;
	size_t len = strlen(token);
	if(len >= (MAX_TOKEN_LEN - 1))
		return;

	//If we're NOT at the end of the token, we need to move everything right to make room for the new character
	bool redrawLine = (m_currentToken != m_lastToken);
	if(m_tokenOffset != len)
	{
		redrawLine = true;
		for(size_t i=len; i > m_tokenOffset; i--)
			token[i] = token[i-1];
	}

	//Append the character
	token[m_tokenOffset ++] = c;
	len++;

	//Draw the new character
	g_uart.PrintBinary(c);

	//Update the remainder of the line.
	//Keep track of how many characters we drew so we can move back here.
	if(redrawLine)
	{
		//Draw the remainder of this token
		char* restOfToken = token + m_tokenOffset;
		size_t charsDrawn = strlen(restOfToken);
		g_uart.PrintString(restOfToken);

		//Draw all subsequent tokens
		for(size_t i = m_currentToken + 1; i < MAX_TOKENS; i++)
		{
			char* tok = command.m_tokens[i].m_text;
			charsDrawn += strlen(tok) + 1;
			g_uart.Printf(" %s", tok);
		}

		//Move the cursor back to where it belongs
		for(size_t i=0; i<charsDrawn; i++)
			g_uart.PrintString(CURSOR_LEFT);
	}
}

void CLI::OnSpace(Command& command)
{
	//If we're out of token space, stop
	//TODO: handle insertion into the middle of the token list
	if(m_currentToken >= MAX_TOKENS)
		return;

	g_uart.PrintBinary(' ' );
	m_tokenOffset = 0;

	//If the current token is empty, don't move to another one (ignore consecutive spaces)
	if(strlen(command.m_tokens[m_currentToken].m_text) == 0)
		return;

	//Not empty. Start a new token.
	m_currentToken ++;
	//TODO: if we have tokens to the right, move them right
	//TODO: if we're in the middle of a token, split it
}

void CLI::OnTabComplete(Command& command)
{
	//TODO
}

void CLI::OnBackspace(Command& command)
{
	//TODO: better handling of tokens to the right@

	//We're in the current token
	if(m_tokenOffset > 0)
	{
		//Delete the character
		//move left, space over the deleted character, move left for good this time
		g_uart.Printf("%s %s", CURSOR_LEFT, CURSOR_LEFT);

		//Move back one character and shift the token left
		m_tokenOffset --;
		char* text = command.m_tokens[m_currentToken].m_text;
		for(size_t i=m_tokenOffset; i<MAX_TOKEN_LEN-1; i++)
			text[i] = text[i+1];
	}

	//We just started a new token and changed our mind.
	else if(m_currentToken > 0)
	{
		//Delete the space
		g_uart.PrintString(CURSOR_LEFT);

		//Move to end of previous token
		m_currentToken --;
		m_tokenOffset = strlen(command.m_tokens[m_currentToken].m_text);
	}

	//Backspace at the start of the prompt. Ignore it.
	else
	{
	}
}

void CLI::OnRightArrow(Command& command)
{
	//Are we at the end of the current token?
	char* text = command.m_tokens[m_currentToken].m_text;
	if(m_tokenOffset == strlen(text))
	{
		//Is this the last token? Can't go any further
		if(m_currentToken == m_lastToken)
		{
		}

		//Move to the start of the next one
		else
		{
			m_tokenOffset = 0;
			m_currentToken ++;
			g_uart.PrintString(CURSOR_RIGHT);
		}
	}

	//Nope, just move one to the right
	else
	{
		m_tokenOffset ++;
		g_uart.PrintString(CURSOR_RIGHT);
	}
}

void CLI::OnLeftArrow(Command& command)
{
	//At somewhere other than the start of the current token?
	//Just move left and go to the previous character
	if(m_tokenOffset > 0)
	{
		m_tokenOffset --;
		g_uart.PrintString(CURSOR_LEFT);
	}

	//Move left, but go to the previous token
	else if(m_currentToken > 0)
	{
		g_uart.PrintString(CURSOR_LEFT);
		m_tokenOffset = strlen(command.m_tokens[m_currentToken].m_text);
		m_currentToken --;
	}

	//Start of prompt, can't go left any further
	else
	{
	}
}
