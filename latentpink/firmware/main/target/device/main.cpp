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
#include <microkvs/driver/STM32StorageBank.h>

int main()
{
	//Initialize power (must be the very first thing done after reset)
	Power::ConfigureSMPSToLDOCascade(Power::VOLTAGE_1V8, RANGE_VOS0);

	//Copy .data from flash to SRAM (for some reason the default newlib startup won't do this??)
	memcpy(&__data_start, &__data_romstart, &__data_end - &__data_start + 1);

	//Enable SYSCFG before changing any settings on it
	RCCHelper::EnableSyscfg();

	//Basic hardware setup
	InitClocks();
	InitTimer();
	InitUART();
	InitLog(g_cliUART, g_logTimer);
	DetectHardware();

	/*
		Use sectors 6 and 7 of main flash (in single bank mode) for a 128 kB microkvs

		Each log entry is 64 bytes, and we want to allocate ~50% of storage to the log since our objects are pretty
		small (SSH keys, IP addresses, etc). A 1024-entry log is a nice round number, and comes out to 64 kB or 50%,
		leaving the remaining 64 kB or 50% for data.
	 */
	static STM32StorageBank left(reinterpret_cast<uint8_t*>(0x080c0000), 0x20000);
	static STM32StorageBank right(reinterpret_cast<uint8_t*>(0x080e0000), 0x20000);
	InitKVS(&left, &right, 1024);

	//Set up the quad SPI and connect to the FPGA
	InitQSPI();
	InitFPGA();

	//Get our MAC address
	InitI2C();
	InitEEPROM();

	//Bring up sensors
	InitSensors();

	//Test the external RAM
	MemoryTest();

	//Begin initializing fabric ports
	InitInterfaces();
	InitSFP();

	//Initialize our local Ethernet interface and TCP/IP stack
	InitEthernet();
	InitIP();

	//Set up the GPIO LEDs and turn them off
	GPIOPin led0(&GPIOC, 4, GPIOPin::MODE_OUTPUT, GPIOPin::SLEW_SLOW);
	GPIOPin led1(&GPIOA, 6, GPIOPin::MODE_OUTPUT, GPIOPin::SLEW_SLOW);
	GPIOPin led2(&GPIOE, 10, GPIOPin::MODE_OUTPUT, GPIOPin::SLEW_SLOW);
	GPIOPin led3(&GPIOE, 9, GPIOPin::MODE_OUTPUT, GPIOPin::SLEW_SLOW);
	led0 = 0;
	led1 = 0;
	led2 = 0;
	led3 = 0;

	//Create a CLI stream for the UART
	UARTOutputStream uartStream;
	uartStream.Initialize(g_cliUART);

	//Initialize the CLI for the UART
	SwitchCLISessionContext uartContext;
	uartContext.Initialize(&uartStream, "user");

	//Enable interrupts only after all setup work is done
	EnableInterrupts();

	//Show the initial prompt
	uartContext.PrintPrompt();

	/*
	//Main event loop
	int nextRxFrame = 0;
	uint32_t numRxFrames = 0;
	uint32_t numRxBad = 0;
	*/
	uint32_t nextAgingTick = 0;


	GPIOPin irq(&GPIOA, 0, GPIOPin::MODE_INPUT, GPIOPin::SLEW_SLOW);
	irq.SetPullMode(GPIOPin::PULL_DOWN);

	while(1)
	{
		//Wait for an interrupt
		//asm("wfi");

		//Check if anything happened on the FPGA
		if(irq)
			PollFPGA();

		//Check if we had a PHY link state change
		//TODO: add irq bit for this so we don't have to poll nonstop
		PollPHYs();

		//Check if we had an optic inserted or removed
		PollSFP();

		//Poll for UART input
		if(g_cliUART->HasInput())
			uartContext.OnKeystroke(g_cliUART->BlockingRead());

		//Check for aging on stuff once a second
		if(g_logTimer->GetCount() > nextAgingTick)
		{
			g_ethProtocol->OnAgingTick();
			nextAgingTick = g_logTimer->GetCount() + 10000;
		}
	}

	return 0;
}

/**
	@brief Reads the FPGA status register to see why it sent us an IRQ
 */
void PollFPGA()
{
	uint16_t fpgastat = g_fpga->BlockingRead16(REG_FPGA_IRQSTAT);
	//g_log("FPGA poll: IRQ stat = %04x\n", fpgastat);

	//New Ethernet frame ready?
	if(fpgastat & 1)
	{
		auto frame = g_ethIface->GetRxFrame();
		if(frame != NULL)
			g_ethProtocol->OnRxFrame(frame);
	}
}
