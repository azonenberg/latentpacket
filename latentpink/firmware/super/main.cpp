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

#include "supervisor.h"

//UART console
UART* g_cliUART = NULL;
Logger g_log;
/*
UARTOutputStream g_uartStream;
SnifferCLISessionContext g_uartCliContext;
*/
Timer* g_logTimer;

void InitClocks();
void InitUART();
void InitLog();
//void DetectHardware();
void InitKVS();
//void InitCLI();

int main()
{
	//Copy .data from flash to SRAM (for some reason the default newlib startup won't do this??)
	memcpy(&__data_start, &__data_romstart, &__data_end - &__data_start + 1);

	//Enable SYSCFG before changing any settings on it
	//RCCHelper::EnableSyscfg();

	//Hardware setup
	InitClocks();
	InitUART();
	InitLog();
	/*
	DetectHardware();
	InitCLI();
	*/

	//Turn on the GPIO LED B8
	GPIOPin gpio_led(&GPIOB, 8, GPIOPin::MODE_OUTPUT, GPIOPin::SLEW_SLOW);
	gpio_led = 1;

	g_log("hai world\n");

	/*

	//Enable interrupts only after all setup work is done
	EnableInterrupts();

	//Show the initial prompt
	g_uartCliContext.PrintPrompt();

	uint32_t nextAgingTick = 0;

	while(1)
	{
		//Poll for UART input
		if(g_cliUART->HasInput())
			g_uartCliContext.OnKeystroke(g_cliUART->BlockingRead());

		//Check for aging on stuff once a second
		if(g_logTimer->GetCount() > nextAgingTick)
		{
			//g_ethStack->OnAgingTick();
			nextAgingTick = g_logTimer->GetCount() + 10000;
		}
	}
	*/

	//DEBUG: blink the LED
	volatile int foo = 0;
	while(1)
	{
		for(int i=0; i<100000; i++)
			foo++;

		gpio_led = 1;

		for(int i=0; i<100000; i++)
			foo++;

		gpio_led = 0;
	}

	while(1)
	{}

	return 0;
}

void InitClocks()
{
	//No need to mess with flash wait states
	//At full voltage (Range 1) we can run up to 16 MHz with no wait states, which is more than adequate for our needs
	RCCHelper::InitializePLLFromHSI16(
		4,	//VCO at 16*4 = 64 MHz
		4,	//CPU frequency is 64/4 = 16 MHz (max 32)
		1,	//AHB at 16 MHz (max 32)
		1,	//APB2 at 16 MHz (max 32)
		1);	//APB1 at 16 MHz (max 32)
}

void InitUART()
{
	//Initialize the UART for local console: 115.2 Kbps using PB6 for USART2 transmit and PB7 for USART2 receive
	//TODO: nice interface for enabling UART interrupts
	GPIOPin uart_tx(&GPIOB, 6, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 0);
	GPIOPin uart_rx(&GPIOB, 7, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 0);

	//USART2 is on APB1 (16MHz), so we need a divisor of 138.88, round to 139
	static UART uart(&USART2, 139);
	g_cliUART = &uart;

	/*
	//Enable the UART RX interrupt
	//TODO: Make an RCC method for this
	volatile uint32_t* NVIC_ISER1 = (volatile uint32_t*)(0xe000e104);
	*NVIC_ISER1 = 0x100000;
	*/

	//Clear screen and move cursor to X0Y0
	uart.Printf("\x1b[2J\x1b[0;0H");
}

void InitLog()
{
	//APB1 is 32 MHz
	//Divide down to get 10 kHz ticks
	static Timer logtim(&TIMER2, Timer::FEATURE_GENERAL_PURPOSE, 3200);
	g_logTimer = &logtim;

	g_log.Initialize(g_cliUART, &logtim);
	g_log("UART logging ready\n");
}
/*
void DetectHardware()
{
	g_log("Identifying hardware\n");
	LogIndenter li(g_log);

	uint16_t rev = DBGMCU.IDCODE >> 16;
	uint16_t device = DBGMCU.IDCODE & 0xfff;

	if(device == 0x483)
	{
		//Look up the stepping number
		const char* srev = NULL;
		switch(rev)
		{
			case 0x1000:
				srev = "A";
				break;

			case 0x1001:
				srev = "Z";
				break;

			default:
				srev = "(unknown)";
		}

		uint8_t pkg = SYSCFG.PKGR;
		const char* package = "";
		switch(pkg)
		{
			case 0:
				package = "VQFPN68 (industrial)";
				break;
			case 1:
				package = "LQFP100/TFBGA100 (legacy)";
				break;
			case 2:
				package = "LQFP100 (industrial)";
				break;
			case 3:
				package = "TFBGA100 (industrial)";
				break;
			case 4:
				package = "WLCSP115 (industrial)";
				break;
			case 5:
				package = "LQFP144 (legacy)";
				break;
			case 6:
				package = "UFBGA144 (legacy)";
				break;
			case 7:
				package = "LQFP144 (industrial)";
				break;
			case 8:
				package = "UFBGA169 (industrial)";
				break;
			case 9:
				package = "UFBGA176+25 (industrial)";
				break;
			case 10:
				package = "LQFP176 (industrial)";
				break;
			default:
				package = "unknown package";
				break;
		}

		g_log("STM32%c%c%c%c stepping %s, %s\n",
			(L_ID >> 24) & 0xff,
			(L_ID >> 16) & 0xff,
			(L_ID >> 8) & 0xff,
			(L_ID >> 0) & 0xff,
			srev,
			package
			);
		g_log("564 kB total SRAM, 128 kB DTCM, up to 256 kB ITCM, 4 kB backup SRAM\n");
		g_log("%d kB Flash\n", F_ID);

		//U_ID fields documented in 45.1 of STM32 programming manual
		uint16_t waferX = U_ID[0] >> 16;
		uint16_t waferY = U_ID[0] & 0xffff;
		uint8_t waferNum = U_ID[1] & 0xff;
		char waferLot[8] =
		{
			static_cast<char>((U_ID[1] >> 24) & 0xff),
			static_cast<char>((U_ID[1] >> 16) & 0xff),
			static_cast<char>((U_ID[1] >> 8) & 0xff),
			static_cast<char>((U_ID[2] >> 24) & 0xff),
			static_cast<char>((U_ID[2] >> 16) & 0xff),
			static_cast<char>((U_ID[2] >> 8) & 0xff),
			static_cast<char>((U_ID[2] >> 0) & 0xff),
			'\0'
		};
		g_log("Lot %s, wafer %d, die (%d, %d)\n", waferLot, waferNum, waferX, waferY);
	}
	else
		g_log(Logger::WARNING, "Unknown device (0x%06x)\n", device);
}
*/

/*
void InitCLI()
{
	g_log("Initializing CLI\n");

	//Initialize the CLI on the console UART interface
	g_uartStream.Initialize(g_cliUART);
	g_uartCliContext.Initialize(&g_uartStream, "admin");

	//g_log("IP address not configured, defaulting to 192.168.1.42\n");
}
*/
