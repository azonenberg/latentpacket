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

CLI::CLI(Switch* sw)
	: m_hostname("Mock-switch")
	, m_switch(sw)
{

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Top level event loop

void CLI::Run()
{
	while(true)
		RunTopLevel();
}

void CLI::RunTopLevel()
{
	while(true)
	{
		//Get a line of input from the user
		Command command;
		RunPrompt("", command);

		//Autocomplete/parse the command
		if(!ParseCommand(command, g_topCommands))
			continue;

		//Execute the command if the parser made sense of it
		switch(command[0].m_commandID)
		{
			case CMD_SHOW:
				OnShowCommand(command);
				break;

			default:
				break;
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

bool CLI::ParseCommand(Command& command, const clikeyword_t* root)
{
	//Go through each token and figure out if it matches anything we know about
	const clikeyword_t* node = root;
	for(size_t i = 0; i < MAX_TOKENS; i ++)
	{
		if(command[i].IsEmpty())
		{
			//If the node is not NULL, we're missing arguments!
			if(node != NULL)
			{
				g_uart.Printf("\nIncomplete command\n");
				return false;
			}

			break;
		}

		//Debug print
		g_uart.Printf("    %d: %s ", i, command[i].m_text);

		command[i].m_commandID = CMD_NULL;

		for(const clikeyword_t* row = node; row->keyword != NULL; row++)
		{
			//TODO: handle wildcards

			//If the token doesn't match the prefix, we're definitely not a hit
			if(!command[i].PrefixMatch(row->keyword))
				continue;

			//If it matches, but the subsequent token matches too, the command is ambiguous!
			//Fail with an error.
			if(command[i].PrefixMatch(row[1].keyword))
			{
				g_uart.Printf(
					"\nAmbiguous command (at word %d): you typed \"%s\", but this could be short for \"%s\" or \"%s\"\n",
					i,
					command[i].m_text,
					row->keyword,
					row[1].keyword);
				return false;
			}

			//Debug print
			g_uart.Printf("(matched \"%s\")\n", row->keyword);

			//Match!
			command[i].m_commandID = row->id;
			node = row->children;
		}

		//Didn't match anything at all, give up
		if(command[i].m_commandID == CMD_NULL)
		{
			g_uart.Printf(
				"\nUnrecognized command (at word %d): you typed \"%s\", but this did not match any known commands\n",
				i,
				command[i].m_text);
			return false;
		}

	}

	//If we get here, all good
	return true;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Input handling

void CLI::RunPrompt(const char* prompt, Command& command)
{
	//Show the prompt
	g_uart.Printf("%s# ", m_hostname, prompt);

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
		{
			//g_uart.Printf("\nIgnoring nonprintable: 0x%02x\n", c);
		}

		//Space ends the current token
		else if(c == ' ')
			OnSpace(command);

		//Echo characters as typed
		else
			OnKey(command, c);

		//Update the last token (TODO: only when needed)
		for(size_t i=0; i<MAX_TOKENS; i++)
		{
			//Don't break. If we type two spaces in the middle of a command we can have a null command momentarily.
			if(command[i].IsEmpty())
				continue;
			m_lastToken = i;
		}
	}

	//If we have any empty strings move stuff left over them
	for(size_t i=0; i<m_lastToken; i++)
	{
		if(command[i].IsEmpty())
		{
			for(int j=i+1; j <= m_lastToken; j++)
				strncpy(command[j-1].m_text, command[j].m_text, MAX_TOKEN_LEN);
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
		g_uart.PrintBinary(' ');
	g_uart.PrintString("^\n");

	//Done, print the final output
	g_uart.Printf("Parsed command:\n");
	for(size_t i=0; i<=m_lastToken; i++)
		g_uart.Printf("    %d: %s\n", i, command[i].m_text);
	g_uart.Printf("currentToken: %d\n", m_currentToken);
	g_uart.Printf("lastToken: %d\n", m_lastToken);
	g_uart.Printf("tokenOffset: %d\n", m_tokenOffset);
	*/
}

/**
	@brief Redraws everything right of the cursor
 */
void CLI::RedrawLineRightOfCursor(Command& command)
{
	//Draw the remainder of this token
	char* token = command[m_currentToken].m_text;
	char* restOfToken = token + m_tokenOffset;
	size_t charsDrawn = strlen(restOfToken);
	g_uart.PrintString(restOfToken);

	//Draw all subsequent tokens
	for(size_t i = m_currentToken + 1; i < MAX_TOKENS; i++)
	{
		char* tok = command[i].m_text;
		charsDrawn += strlen(tok) + 1;
		g_uart.Printf(" %s", tok);
	}

	//Draw a space at the end to clean up anything we may have deleted
	g_uart.PrintBinary(' ');
	charsDrawn ++;

	//Move the cursor back to where it belongs
	for(size_t i=0; i<charsDrawn; i++)
		g_uart.PrintString(CURSOR_LEFT);
}

void CLI::OnKey(Command& command, char c)
{
	//If the token doesn't have room for another character, abort
	char* token = command[m_currentToken].m_text;
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
	if(redrawLine)
		RedrawLineRightOfCursor(command);
}

void CLI::OnSpace(Command& command)
{
	//If we're out of token space, stop
	if(m_lastToken >= (MAX_TOKENS - 1) )
		return;

	//Ignore consecutive spaces - if we already made an empty token between the existing ones,
	//there's no need to do another one
	if(command[m_currentToken].IsEmpty())
		return;

	//OK, we're definitely adding a space. The only question now is where.
	g_uart.PrintBinary(' ' );

	//If we're at the end of the token, just insert a new token
	if(m_tokenOffset == command[m_currentToken].Length())
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
			strncpy(command[i].m_text, command[i-1].m_text, MAX_TOKEN_LEN);
		memset(command[m_currentToken].m_text, 0, MAX_TOKEN_LEN);

		m_tokenOffset = 0;
	}

	//We're in the middle of a token. Need to split it.
	else
	{
		//If we have tokens to the right, move them right
		if(m_currentToken < m_lastToken)
		{
			for(size_t i = m_lastToken+1; i > (m_currentToken+1); i-- )
				strncpy(command[i].m_text, command[i-1].m_text, MAX_TOKEN_LEN);
		}

		//Move the right half of the split token into a new one at right
		strncpy(
			command[m_currentToken+1].m_text,
			command[m_currentToken].m_text + m_tokenOffset,
			MAX_TOKEN_LEN);

		//Truncate the left half of the split token
		for(size_t i=m_tokenOffset; i<MAX_TOKEN_LEN; i++)
			command[m_currentToken].m_text[i] = '\0';

		//We're now at the start of the new token
		m_currentToken ++;
		m_tokenOffset = 0;
	}

	//Definitely have to redraw after doing this!
	RedrawLineRightOfCursor(command);
}

void CLI::OnTabComplete(Command& command)
{
	//TODO
}

void CLI::OnBackspace(Command& command)
{
	//We're in the middle/end of a token
	if(m_tokenOffset > 0)
	{
		//Delete the character
		//move left, space over the deleted character, move left for good this time
		g_uart.Printf("%s %s", CURSOR_LEFT, CURSOR_LEFT);

		//Move back one character and shift the token left
		m_tokenOffset --;
		char* text = command[m_currentToken].m_text;
		for(size_t i=m_tokenOffset; i<MAX_TOKEN_LEN-1; i++)
			text[i] = text[i+1];
	}

	//We're at the start of a token, but not the first one
	else if(m_currentToken > 0)
	{
		//Delete the space
		g_uart.PrintString(CURSOR_LEFT);

		//Move to end of previous token
		m_currentToken --;
		m_tokenOffset = strlen(command[m_currentToken].m_text);

		//Merge the token we were in with the current one
		strncpy(
			command[m_currentToken].m_text + m_tokenOffset,
			command[m_currentToken+1].m_text,
			MAX_TOKEN_LEN - m_tokenOffset);

		//If we have any tokens to the right of us, move them left
		for(size_t i = m_currentToken+1; i < m_lastToken; i++)
			strncpy(command[i].m_text, command[i+1].m_text, MAX_TOKEN_LEN);

		//Blow away the removed token at the far right
		memset(command[m_lastToken].m_text, 0, MAX_TOKEN_LEN);
	}

	//Backspace at the start of the prompt. Ignore it.
	else
	{
	}

	RedrawLineRightOfCursor(command);
}

void CLI::OnRightArrow(Command& command)
{
	//Are we at the end of the current token?
	char* text = command[m_currentToken].m_text;
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
		m_currentToken --;
		m_tokenOffset = strlen(command[m_currentToken].m_text);
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
void CLI::OnShowCommand(Command& command)
{
	switch(command[1].m_commandID)
	{
		case CMD_INTERFACE:
			OnShowInterfaceCommand(command);
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
	//see STM32 programming manual section 45.1
	volatile const uint32_t* serial = (volatile const uint32_t*)0x1ff0f420;
	uint16_t waferX = serial[0] >> 16;
	uint16_t waferY = serial[0] & 0xffff;
	uint8_t waferNum = serial[1] & 0xff;
	char waferLot[8] =
	{
		static_cast<char>((serial[1] >> 24) & 0xff),
		static_cast<char>((serial[1] >> 16) & 0xff),
		static_cast<char>((serial[1] >> 8) & 0xff),
		static_cast<char>((serial[2] >> 24) & 0xff),
		static_cast<char>((serial[2] >> 16) & 0xff),
		static_cast<char>((serial[2] >> 8) & 0xff),
		static_cast<char>((serial[2] >> 0) & 0xff),
		'\0'
	};
	const uint32_t flash_kb = (*(volatile uint32_t*)0x1ff0f440) >> 16;
	const uint16_t package = ( (*(volatile uint16_t*)0x1fff7bf0) >> 8) & 0x7;

	//see STM32 programming manual section 44.6.1
	const uint32_t devid = *(volatile uint32_t*)0xe0042000;

	//Lots of printing!
	g_uart.Printf("LATENTPACKET Management Software\n");
	g_uart.Printf("Copyright (c) 2019, Andrew D. Zonenberg.\n");
	g_uart.Printf("License: 3-clause (\"new\" or \"modified\") BSD.\n");
	g_uart.Printf("         (https://github.com/azonenberg/latentpacket/blob/master/LICENSE)\n");
	g_uart.Printf("Source code: https://github.com/azonenberg/latentpacket/\n");
	g_uart.Printf("This is free software: you are free to change and redistribute it.\n");
	g_uart.Printf("There is NO WARRANTY, to the extent permitted by law.\n");
	g_uart.Printf("\n");
	g_uart.Printf("Firmware:\n");
	g_uart.Printf("    LATENTRED CLI v0.1 (armv7-m)\n");
	g_uart.Printf("    Compiled on: %s %s\n", __DATE__, __TIME__);

	g_uart.Printf("Hardware:\n");
	g_uart.Printf("    Management engine CPU:\n");
	if( (devid & 0xfff) == 0x451)
	{
		g_uart.Printf("        ST STM32F777NI stepping %d\n", (devid >> 16) & 0xfff);
		g_uart.Printf("        ARM Cortex-M7 with FPU\n");
		g_uart.Printf("        %d KB Flash\n", flash_kb);
		g_uart.Printf("        512 KB SRAM\n");
	}
	else
		g_uart.Printf("        Unknown CPU\n");
	if(package == 0x7)
		g_uart.Printf("        TFBGA216 package\n");
	else
		g_uart.Printf("        Unknown package\n");
	g_uart.Printf("        Die (%d, %d), wafer %d, lot %s\n", waferX, waferY, waferNum, waferLot);

	g_uart.Printf("    Management engine FPGA:\n");
	g_uart.Printf("        Xilinx [details unimplemented]\n");
	g_uart.Printf("        Serial number 0x[details unimplemented]\n");
	g_uart.Printf("        Bitstream version [details unimplemented]\n");

	g_uart.Printf("    Switch fabric FPGA:\n");
	g_uart.Printf("        Xilinx [details unimplemented]\n");
	g_uart.Printf("        Serial number 0x[details unimplemented]\n");
	g_uart.Printf("        Bitstream version [details unimplemented]\n");

	g_uart.Printf("    Line cards:\n");
	g_uart.Printf("        0: LATENTRED switch fabric board rev [details unimplemented]\n");
	g_uart.Printf("            [details unimplemented] 10Gbase-R SFP+ interfaces\n");
	g_uart.Printf("        1: Pluggable line cards [details unimplemented]\n");
	g_uart.Printf("            [details unimplemented] 10/100/1000base-TX RJ45 interfaces\n");
}

/**
	@brief Processes a "show interface" command
 */
void CLI::OnShowInterfaceCommand(Command& command)
{
	switch(command[2].m_commandID)
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
