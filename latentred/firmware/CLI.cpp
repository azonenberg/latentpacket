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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Construction / destruction

CLI::CLI(Switch* sw, UART* uart)
	: m_hostname("Mock-switch")
	, m_switch(sw)
	, m_uart(uart)
	, m_state(STATE_SHOW_PROMPT)
{

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Top level event loop

void CLI::Iteration()
{
	switch(m_state)
	{
		//Show the prompt, then reset the command line for new input
		case STATE_SHOW_PROMPT:
			m_uart->Printf("%s# ", m_hostname);

			m_currentToken = 0;
			m_tokenOffset = 0;
			m_lastToken = 0;
			m_command.Clear();

			m_state = STATE_EDIT;
			break;

		//If we have any input ready to process, do that
		case STATE_EDIT:
			if(m_uart->HasInput())
				OnInputReady();
			break;

		//Parse the input
		case STATE_PARSE:
			OnLineReady();
			break;

		//Execute it
		case STATE_EXECUTE:
			OnExecuteCommand();
			m_state = STATE_SHOW_PROMPT;
			break;
	}
}

void CLI::OnLineReady()
{
	//If we have any empty strings move stuff left over them
	for(size_t i=0; i<m_lastToken; i++)
	{
		if(m_command[i].IsEmpty())
		{
			for(int j=i+1; j <= m_lastToken; j++)
				strncpy(m_command[j-1].m_text, m_command[j].m_text, MAX_TOKEN_LEN);
			m_lastToken --;
		}
	}

	/*
	//DEBUG: Print cursor location
	size_t cursorPos = strlen(prompt);
	for(size_t i=0; i<m_currentToken; i++)
	{
		cursorPos += strlen(command[i].m_text);
		cursorPos ++;	//space between tokens
	}
	cursorPos += m_tokenOffset;
	for(size_t i=0; i<cursorPos; i++)
		m_uart->PrintBinary(' ');
	m_uart->PrintString("^\n");

	//Done, print the final output
	m_uart->Printf("Parsed command:\n");
	for(size_t i=0; i<=m_lastToken; i++)
		m_uart->Printf("    %d: %s\n", i, command[i].m_text);
	m_uart->Printf("currentToken: %d\n", m_currentToken);
	m_uart->Printf("lastToken: %d\n", m_lastToken);
	m_uart->Printf("tokenOffset: %d\n", m_tokenOffset);
	*/

	//Autocomplete/parse the command
	if(!ParseCommand(g_topCommands))
		m_state = STATE_SHOW_PROMPT;

	//All good, ready to execute
	else
		m_state = STATE_EXECUTE;
}

void CLI::OnExecuteCommand()
{
	switch(m_command[0].m_commandID)
	{
		case CMD_SHOW:
			OnShowCommand();
			break;

		default:
			break;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

bool CLI::ParseCommand(const clikeyword_t* root)
{
	//Go through each token and figure out if it matches anything we know about
	const clikeyword_t* node = root;
	for(size_t i = 0; i < MAX_TOKENS; i ++)
	{
		if(m_command[i].IsEmpty())
		{
			//If the node is not NULL, we're missing arguments!
			if(node != NULL)
			{
				m_uart->Printf("\nIncomplete command\n");
				return false;
			}

			break;
		}

		//Debug print
		m_uart->Printf("    %d: %s ", i, m_command[i].m_text);

		m_command[i].m_commandID = CMD_NULL;

		for(const clikeyword_t* row = node; row->keyword != NULL; row++)
		{
			//TODO: handle wildcards

			//If the token doesn't match the prefix, we're definitely not a hit
			if(!m_command[i].PrefixMatch(row->keyword))
				continue;

			//If it matches, but the subsequent token matches too, the command is ambiguous!
			//Fail with an error.
			if(m_command[i].PrefixMatch(row[1].keyword))
			{
				m_uart->Printf(
					"\nAmbiguous command (at word %d): you typed \"%s\", but this could be short for \"%s\" or \"%s\"\n",
					i,
					m_command[i].m_text,
					row->keyword,
					row[1].keyword);
				return false;
			}

			//Debug print
			m_uart->Printf("(matched \"%s\")\n", row->keyword);

			//Match!
			m_command[i].m_commandID = row->id;
			node = row->children;
		}

		//Didn't match anything at all, give up
		if(m_command[i].m_commandID == CMD_NULL)
		{
			m_uart->Printf(
				"\nUnrecognized command (at word %d): you typed \"%s\", but this did not match any known commands\n",
				i,
				m_command[i].m_text);
			return false;
		}

	}

	//If we get here, all good
	return true;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Input handling

void CLI::OnInputReady()
{
	//If we get here, there's input ready
	char c = m_uart->BlockingRead();

	//End of line means the command is ready to execute
	if( (c == '\r') || (c == '\n') )
	{
		m_uart->PrintString("\n");
		m_state = STATE_PARSE;
		return;
	}

	//Backspace
	else if(c == 0x7f)
		OnBackspace();

	//Escape sequences
	else if(c == 0x1b)
	{
		//TODO: don't stall if there's nothing in the fifo

		//Next char should be a [
		if(m_uart->BlockingRead() != '[')
		{
			m_uart->PrintString("Malformed escape sequence, expected [ after esc\n");
			return;
		}

		//and the actual escape code
		char code = m_uart->BlockingRead();
		switch(code)
		{
			//B = down, A = up

			case 'C':
				OnRightArrow();
				break;

			case 'D':
				OnLeftArrow();
				break;

			default:
				break;
		}
	}

	//Tab complete the current token
	else if(c == '\t')
		OnTabComplete();

	//Ignore other non-printable characters
	else if(!isprint(c))
	{
		//m_uart->Printf("\nIgnoring nonprintable: 0x%02x\n", c);
	}

	//Space ends the current token
	else if(c == ' ')
		OnSpace();

	//Echo characters as typed
	else
		OnKey(c);

	//Update the last-token index
	for(size_t i=0; i<MAX_TOKENS; i++)
	{
		//If we type two spaces in the middle of a command we can have an empty command momentarily.
		//This is totally fine.
		if(m_command[i].IsEmpty())
			continue;
		m_lastToken = i;
	}
}

/**
	@brief Redraws everything right of the cursor
 */
void CLI::RedrawLineRightOfCursor()
{
	//Draw the remainder of this token
	char* token = m_command[m_currentToken].m_text;
	char* restOfToken = token + m_tokenOffset;
	size_t charsDrawn = strlen(restOfToken);
	m_uart->PrintString(restOfToken);

	//Draw all subsequent tokens
	for(size_t i = m_currentToken + 1; i < MAX_TOKENS; i++)
	{
		char* tok = m_command[i].m_text;
		charsDrawn += strlen(tok) + 1;
		m_uart->Printf(" %s", tok);
	}

	//Draw a space at the end to clean up anything we may have deleted
	m_uart->PrintBinary(' ');
	charsDrawn ++;

	//Move the cursor back to where it belongs
	for(size_t i=0; i<charsDrawn; i++)
		m_uart->PrintString(CURSOR_LEFT);
}

void CLI::OnKey(char c)
{
	//If the token doesn't have room for another character, abort
	char* token = m_command[m_currentToken].m_text;
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
	m_uart->PrintBinary(c);

	//Update the remainder of the line.
	if(redrawLine)
		RedrawLineRightOfCursor();
}

void CLI::OnSpace()
{
	//If we're out of token space, stop
	if(m_lastToken >= (MAX_TOKENS - 1) )
		return;

	//Ignore consecutive spaces - if we already made an empty token between the existing ones,
	//there's no need to do another one
	if(m_command[m_currentToken].IsEmpty())
		return;

	//OK, we're definitely adding a space. The only question now is where.
	m_uart->PrintBinary(' ' );

	//If we're at the end of the token, just insert a new token
	if(m_tokenOffset == m_command[m_currentToken].Length())
	{
		//Not empty. Start a new token.
		m_currentToken ++;

		//If this was the last token, nothing more to do.
		if(m_currentToken > m_lastToken)
		{
			m_tokenOffset = 0;
			return;
		}

		//If we have tokens to the right, move them right and wipe the current one.
		for(size_t i = m_lastToken+1; i > m_currentToken; i-- )
			strncpy(m_command[i].m_text, m_command[i-1].m_text, MAX_TOKEN_LEN);
		memset(m_command[m_currentToken].m_text, 0, MAX_TOKEN_LEN);

		m_tokenOffset = 0;
	}

	//We're in the middle of a token. Need to split it.
	else
	{
		//If we have tokens to the right, move them right
		if(m_currentToken < m_lastToken)
		{
			for(size_t i = m_lastToken+1; i > (m_currentToken+1); i-- )
				strncpy(m_command[i].m_text, m_command[i-1].m_text, MAX_TOKEN_LEN);
		}

		//Move the right half of the split token into a new one at right
		strncpy(
			m_command[m_currentToken+1].m_text,
			m_command[m_currentToken].m_text + m_tokenOffset,
			MAX_TOKEN_LEN);

		//Truncate the left half of the split token
		for(size_t i=m_tokenOffset; i<MAX_TOKEN_LEN; i++)
			m_command[m_currentToken].m_text[i] = '\0';

		//We're now at the start of the new token
		m_currentToken ++;
		m_tokenOffset = 0;
	}

	//Definitely have to redraw after doing this!
	RedrawLineRightOfCursor();
}

void CLI::OnTabComplete()
{
	//TODO
}

void CLI::OnBackspace()
{
	//We're in the middle/end of a token
	if(m_tokenOffset > 0)
	{
		//Delete the character
		//move left, space over the deleted character, move left for good this time
		m_uart->Printf("%s %s", CURSOR_LEFT, CURSOR_LEFT);

		//Move back one character and shift the token left
		m_tokenOffset --;
		char* text = m_command[m_currentToken].m_text;
		for(size_t i=m_tokenOffset; i<MAX_TOKEN_LEN-1; i++)
			text[i] = text[i+1];
	}

	//We're at the start of a token, but not the first one
	else if(m_currentToken > 0)
	{
		//Delete the space
		m_uart->PrintString(CURSOR_LEFT);

		//Move to end of previous token
		m_currentToken --;
		m_tokenOffset = strlen(m_command[m_currentToken].m_text);

		//Merge the token we were in with the current one
		strncpy(
			m_command[m_currentToken].m_text + m_tokenOffset,
			m_command[m_currentToken+1].m_text,
			MAX_TOKEN_LEN - m_tokenOffset);

		//If we have any tokens to the right of us, move them left
		for(size_t i = m_currentToken+1; i < m_lastToken; i++)
			strncpy(m_command[i].m_text, m_command[i+1].m_text, MAX_TOKEN_LEN);

		//Blow away the removed token at the far right
		memset(m_command[m_lastToken].m_text, 0, MAX_TOKEN_LEN);
	}

	//Backspace at the start of the prompt. Ignore it.
	else
	{
	}

	RedrawLineRightOfCursor();
}

void CLI::OnRightArrow()
{
	//Are we at the end of the current token?
	char* text = m_command[m_currentToken].m_text;
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
			m_uart->PrintString(CURSOR_RIGHT);
		}
	}

	//Nope, just move one to the right
	else
	{
		m_tokenOffset ++;
		m_uart->PrintString(CURSOR_RIGHT);
	}
}

void CLI::OnLeftArrow()
{
	//At somewhere other than the start of the current token?
	//Just move left and go to the previous character
	if(m_tokenOffset > 0)
	{
		m_tokenOffset --;
		m_uart->PrintString(CURSOR_LEFT);
	}

	//Move left, but go to the previous token
	else if(m_currentToken > 0)
	{
		m_uart->PrintString(CURSOR_LEFT);
		m_currentToken --;
		m_tokenOffset = strlen(m_command[m_currentToken].m_text);
	}

	//Start of prompt, can't go left any further
	else
	{
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Command execution

/**
	@brief Processes a "show" command
 */
void CLI::OnShowCommand()
{
	switch(m_command[1].m_commandID)
	{
		case CMD_INTERFACE:
			OnShowInterfaceCommand();
			break;

		case CMD_VERSION:
			OnShowVersion();
			break;
	}
}

/**
	@brief Processes as "show version" command
 */
void CLI::OnShowVersion()
{
	//Lots of printing!
	m_uart->Printf("LATENTPACKET Management Software\n");
	m_uart->Printf("Copyright (c) 2019, Andrew D. Zonenberg.\n");
	m_uart->Printf("License: 3-clause (\"new\" or \"modified\") BSD.\n");
	m_uart->Printf("         (https://github.com/azonenberg/latentpacket/blob/master/LICENSE)\n");
	m_uart->Printf("Source code: https://github.com/azonenberg/latentpacket/\n");
	m_uart->Printf("This is free software: you are free to change and redistribute it.\n");
	m_uart->Printf("There is NO WARRANTY, to the extent permitted by law.\n");
	m_uart->Printf("\n");
	m_uart->Printf("Firmware:\n");
	m_uart->Printf("    LATENTRED CLI v0.1 (armv7-m)\n");
	m_uart->Printf("    Compiled on: %s %s\n", __DATE__, __TIME__);

	m_uart->Printf("Hardware:\n");

	for(size_t i=0; i<m_switch->GetBoardCount(); i++)
	{
		auto board = m_switch->GetBoard(i);
		m_uart->Printf("    Board %d: %s\n", i, board->GetDescription());
		board->PrintCPUInfo();
		board->PrintFPGAInfo();
	}
}

/**
	@brief Processes a "show interface" command
 */
void CLI::OnShowInterfaceCommand()
{
	switch(m_command[2].m_commandID)
	{
		case CMD_STATUS:
			OnShowInterfaceStatus();
			break;
	}
}

/**
	@brief Processes a "show interface status" command
 */
void CLI::OnShowInterfaceStatus()
{
}
