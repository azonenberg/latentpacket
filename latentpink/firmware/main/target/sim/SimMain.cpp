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
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/select.h>
#include <termios.h>
#include "STDOutputStream.h"
#include "STDCharacterDevice.h"
#include "../../cli/SwitchCLISessionContext.h"

TestStorageBank g_leftBank;
TestStorageBank g_rightBank;

void LoadKVS();

int main(int argc, char* argv[])
{
	//Disable line buffering and echoing on stdin to emulate normal RS232 behavior
	termios term;
	if(0 != tcgetattr(STDIN_FILENO, &term))
	{
		perror("tcgetattr failed");
		return 1;
	}
	term.c_lflag &= ~ICANON;
	term.c_lflag &= ~ECHO;
	term.c_cc[VMIN] = 1;
	term.c_cc[VTIME] = 0;
	if(0 != tcsetattr(STDIN_FILENO, TCSANOW, &term))
	{
		perror("tcsetattr failed");
		return 1;
	}

	//Initialize the logger
	STDCharacterDevice logdev;
	Timer timer;
	InitLog(&logdev, &timer);

	//Output stream for main event loop
	STDOutputStream stream;

	//Initialize the key-value store
	//128 kB total size to match STM32H7 erase block size
	//Allocate ~50% of total storage to log since objects are fairly small
	LoadKVS();
	InitKVS(&g_leftBank, &g_rightBank, 1024);

	DetectHardware();

	//Set up the FPGA and start bringing up stuff there
	InitFPGAInterface();
	InitFPGA();
	InitInterfaces();

	//Initialize our local Ethernet interface
	InitEthernet();
	InitIP();

	//Initialize the CLI
	SwitchCLISessionContext context;
	context.Initialize(&stream, "user");
	context.PrintPrompt();

	//Run main event loop
	timeval timeout;
	while(true)
	{
		fd_set set;
		FD_ZERO(&set);
		FD_SET(STDIN_FILENO, &set);
		timeout.tv_sec = 0;
		timeout.tv_usec = 50000;

		//Check for new Ethernet frames
		auto frame = g_ethIface->GetRxFrame();
		if(frame)
			g_ethProtocol->OnRxFrame(frame);

		//Read next keystroke, or give up and time out after 50ms
		else if(1 == select(STDIN_FILENO+1, &set, nullptr, nullptr, &timeout))
		{
			char c;
			read(STDIN_FILENO, &c, 1);
			context.OnKeystroke(c);
		}

		//Time out, nothing to do. Keep simulation time moving
		else
			g_fpga->Nop();

		//TODO: do we need this?
		fflush(stdout);
	}
	return 0;
}

/**
	@brief Load KVS data from file
 */
void LoadKVS()
{
	g_leftBank.Load("kvs-left.bin");
	g_rightBank.Load("kvs-right.bin");
}

/**
	@brief Persist KVS data to file
 */
void OnShutdown()
{
	g_leftBank.Serialize("kvs-left.bin");
	g_rightBank.Serialize("kvs-right.bin");
}
