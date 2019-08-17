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

void RunPrompt(const char* prompt)
{
	//Show the prompt
	g_uart.PrintString(prompt);

	int xpos = 0;
	while(1)
	{
		char c = g_uart.BlockingRead();

		//Handle newlines
		if( (c == '\r') || (c == '\n') )
		{
			g_uart.PrintString("\n");
			return;
		}

		//Backspace
		else if(c == 0x7f)
		{
			//TODO
		}

		//Handle escape sequences
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

		//If not printable, ignore for now
		else if(!isprint(c))
		{
			//TODO: tab complete
			if(c == '\t')
			{
			}

			else
			{
				g_uart.PrintString("Nonprintable: 0x");
				//PrintHex(c);
				g_uart.PrintString("\n");
			}
		}

		//Echo characters as typed
		else
		{
			g_uart.PrintBinary(c);
			xpos ++;
		}
	}
}
