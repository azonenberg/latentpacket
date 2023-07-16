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
/*
#include <microkvs/driver/STM32StorageBank.h>

//UART console
UART* g_cliUART = NULL;
Logger g_log;
UARTOutputStream g_uartStream;
SnifferCLISessionContext g_uartCliContext;
Timer* g_logTimer;

//I2C bus to EEPROM
I2C* g_i2c;

//QSPI interface to FPGA
OctoSPI* g_qspi;

//Ethernet stuff
MACAddress g_macAddress;
IPv4Config g_ipConfig;
*/
/*
//KVS
KVS* g_kvs;

void InitClocks();
void InitUART();
void InitLog();
void DetectHardware();
void InitKVS();
void InitI2C();
void InitEEPROM();
void InitQSPI();
void InitCLI();
void InitFPGA();
*/
/*
void InitEthernet();
bool TestEthernet(uint32_t num_frames);
void InitSSH();
*/
int main()
{
	//Initialize power (must be the very first thing done after reset)
	Power::ConfigureSMPSToLDOCascade(Power::VOLTAGE_1V8, RANGE_VOS0);

	//Copy .data from flash to SRAM (for some reason the default newlib startup won't do this??)
	memcpy(&__data_start, &__data_romstart, &__data_end - &__data_start + 1);

	//Enable SYSCFG before changing any settings on it
	RCCHelper::EnableSyscfg();

	/*
	//Hardware setup
	InitClocks();
	InitUART();
	InitLog();
	DetectHardware();
	InitKVS();
	InitI2C();
	InitEEPROM();
	InitQSPI();
	InitFPGA();
	InitCLI();
	*/
	/*
	InitEthernet();
	InitSSH();
	*/

	/*
	//Set up the GPIO LEDs and turn them on
	GPIOPin led0_n(&GPIOB, 12, GPIOPin::MODE_OUTPUT, GPIOPin::SLEW_SLOW);
	GPIOPin led1_n(&GPIOB, 13, GPIOPin::MODE_OUTPUT, GPIOPin::SLEW_SLOW);
	GPIOPin led2_n(&GPIOG, 5, GPIOPin::MODE_OUTPUT, GPIOPin::SLEW_SLOW);
	GPIOPin led3_n(&GPIOG, 2, GPIOPin::MODE_OUTPUT, GPIOPin::SLEW_SLOW);
	led0_n = 0;
	led1_n = 0;
	led2_n = 0;
	led3_n = 0;

	//Enable interrupts only after all setup work is done
	EnableInterrupts();

	//Show the initial prompt
	g_uartCliContext.PrintPrompt();
	*/
	/*
	//Main event loop
	int nextRxFrame = 0;
	uint32_t numRxFrames = 0;
	uint32_t numRxBad = 0;
	*/
	uint32_t nextAgingTick = 0;

	while(1)
	{
		/*
		//Wait for an interrupt
		//asm("wfi");

		//Poll for Ethernet frames
		auto frame = g_eth->GetRxFrame();
		if(frame != NULL)
			g_ethStack->OnRxFrame(frame);
		*/
		/*
		//Poll for UART input
		if(g_cliUART->HasInput())
			g_uartCliContext.OnKeystroke(g_cliUART->BlockingRead());

		//Check for aging on stuff once a second
		if(g_logTimer->GetCount() > nextAgingTick)
		{
			//g_ethStack->OnAgingTick();
			nextAgingTick = g_logTimer->GetCount() + 10000;
		}*/
	}

	return 0;
}
/*
void InitClocks()
{
	//Configure the flash with wait states and prefetching before making any changes to the clock setup.
	//A bit of extra latency is fine, the CPU being faster than flash is not.
	Flash::SetConfiguration(275, RANGE_VOS0);

	//Start the high speed external clock
	RCCHelper::EnableHighSpeedExternalClock();

	//See fmax in table 56 for various peripherals TODO

	//Set up PLL1
	RCCHelper::InitializePLL(
		1,		//PLL1
		50,		//input is 50 MHz
		4,		//50/4 = 12.5 MHz at the PFD
		44,		//12.5 * 44 = 550 MHz at the VCO
		1,		//div P (primary output 550 MHz)
		32,		//div Q (not used for now)
		32		//div R (not used for now)
	);

	//Set up main system clock tree
	RCCHelper::InitializeSystemClocks(
		1,		//sysclk = 550 MHz
		2,		//AHB = 275 MHz
		4,		//APB1 = 68.75 MHz
		4,		//APB2 = 68.75 MHz
		4,		//APB3 = 68.75 MHz
		4		//APB4 = 68.75 MHz
	);

	//Select PLL1 as system clock source
	RCCHelper::SelectSystemClockFromPLL1();
}

void InitUART()
{
	//Initialize the UART for local console: 115.2 Kbps using PA12 for UART4 transmit and PA11 for UART2 receive
	//TODO: nice interface for enabling UART interrupts
	GPIOPin uart_tx(&GPIOA, 12, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 6);
	GPIOPin uart_rx(&GPIOA, 11, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 6);

	//Default after reset is for UART4 to be clocked by PCLK1 (APB1 clock) which is 68.75 MHz
	//So we need a divisor of 596.78
	static UART uart(&UART4, 597);
	g_cliUART = &uart;

	//Enable the UART RX interrupt
	//TODO: Make an RCC method for this
	volatile uint32_t* NVIC_ISER1 = (volatile uint32_t*)(0xe000e104);
	*NVIC_ISER1 = 0x100000;

	//Clear screen and move cursor to X0Y0
	uart.Printf("\x1b[2J\x1b[0;0H");
}

void InitLog()
{
	//APB1 is 68.75 MHz
	//Divide down to get 10 kHz ticks
	static Timer logtim(&TIM2, Timer::FEATURE_GENERAL_PURPOSE, 6875);
	g_logTimer = &logtim;

	g_log.Initialize(g_cliUART, &logtim);
	g_log("UART logging ready\n");
}

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
//void InitKVS()
//{
//	g_log("Initializing microkvs key-value store\n");
//	LogIndenter li(g_log);

	/*
		Use sectors 6 and 7 of main flash (in single bank mode) for a 128 kB microkvs

		Each log entry is 64 bytes, and we want to allocate ~50% of storage to the log since our objects are pretty
		small (SSH keys, IP addresses, etc). A 1024-entry log is a nice round number, and comes out to 64 kB or 50%,
		leaving the remaining 64 kB or 50% for data.
	 */
	 /*
	static STM32StorageBank left(reinterpret_cast<uint8_t*>(0x080c0000), 0x20000);
	static STM32StorageBank right(reinterpret_cast<uint8_t*>(0x080e0000), 0x20000);
	static KVS kvs(&left, &right, 1024);
	g_kvs = &kvs;

	g_log("Log area:  %d free entries\n", g_kvs->GetFreeLogEntries());
	uint32_t space = g_kvs->GetFreeDataSpace();
	g_log("Data area: %d.%02d kB free space\n", space/1024, (space % 1024) * 100 / 1024);

	//Load hostname, if we have it
	if(!g_kvs->ReadObject("hostname", (uint8_t*)g_hostname, sizeof(g_hostname)-1))
	{
		g_log("Hostname not configured, defaulting to \"sniffer\"\n");
		strncpy(g_hostname, "sniffer", sizeof(g_hostname));
	}*/
//}
/*
void InitCLI()
{
	g_log("Initializing CLI\n");

	//Initialize the CLI on the console UART interface
	g_uartStream.Initialize(g_cliUART);
	g_uartCliContext.Initialize(&g_uartStream, "admin");

	//g_log("IP address not configured, defaulting to 192.168.1.42\n");
}

void InitI2C()
{
	g_log("Initializing I2C interface\n");

	static GPIOPin i2c_scl(&GPIOD, 12, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 4, true);
	static GPIOPin i2c_sda(&GPIOD, 13, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 4, true);

	//Default kernel clock for I2C4 is pclk4 (68.75 MHz for our current config)
	//Prescale by 16 to get 4.29 MHz
	//Divide by 24 after that to get 179 kHz
	static I2C i2c(&I2C4, 16, 12);
	g_i2c = &i2c;
}

void InitEEPROM()
{
	g_log("Initializing MAC address EEPROM\n");

	//Extended memory block for MAC address data isn't in the normal 0xa* memory address space
	//uint8_t main_addr = 0xa0;
	uint8_t ext_addr = 0xb0;

	//Pointers within extended memory block
	uint8_t serial_offset = 0x80;
	uint8_t mac_offset = 0x9a;

	//Read MAC address
	g_i2c->BlockingWrite8(ext_addr, mac_offset);
	g_i2c->BlockingRead(ext_addr, &g_macAddress[0], sizeof(g_macAddress));

	//Read serial number
	const int serial_len = 16;
	uint8_t serial[serial_len] = {0};
	g_i2c->BlockingWrite8(ext_addr, serial_offset);
	g_i2c->BlockingRead(ext_addr, serial, serial_len);

	{
		LogIndenter li(g_log);
		g_log("MAC address: %02x:%02x:%02x:%02x:%02x:%02x\n",
			g_macAddress[0], g_macAddress[1], g_macAddress[2], g_macAddress[3], g_macAddress[4], g_macAddress[5]);

		g_log("Serial number: %02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x\n",
			serial[0], serial[1], serial[2], serial[3], serial[4], serial[5], serial[6], serial[7],
			serial[8], serial[9], serial[10], serial[11], serial[12], serial[13], serial[14], serial[15]);
	}
}

void InitQSPI()
{
	g_log("Initializing QSPI interface\n");

	//Configure the I/O manager
	OctoSPIManager::ConfigureMux(false);
	OctoSPIManager::ConfigurePort(
		1,							//Configuring port 1
		false,						//DQ[7:4] disabled
		OctoSPIManager::C1_HIGH,
		true,						//DQ[3:0] enabled
		OctoSPIManager::C1_LOW,		//DQ[3:0] from OCTOSPI1 DQ[3:0]
		true,						//CS# enabled
		OctoSPIManager::PORT_1,		//CS# from OCTOSPI1
		false,						//DQS disabled
		OctoSPIManager::PORT_1,
		true,						//Clock enabled
		OctoSPIManager::PORT_1);	//Clock from OCTOSPI1

	//Configure the I/O pins
	static GPIOPin qspi_cs_n(&GPIOE, 11, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_VERYFAST, 11);
	static GPIOPin qspi_sck(&GPIOB, 2, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_VERYFAST, 9);
	static GPIOPin qspi_dq0(&GPIOA, 2, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_VERYFAST, 6);
	static GPIOPin qspi_dq1(&GPIOB, 0, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_VERYFAST, 4);
	static GPIOPin qspi_dq2(&GPIOC, 2, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_VERYFAST, 9);
	static GPIOPin qspi_dq3(&GPIOA, 1, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_VERYFAST, 9);

	//Clock divider value
	//Default is for AHB3 bus clock to be used as kernel clock (275 MHz for us)
	//With 3.3V Vdd, we can go up to 140 MHz.
	//Dividing by 4 gives 68.75 MHz and a transfer rate of 275 Mbps.
	uint8_t prescale = 4;

	//Configure the OCTOSPI itself
	static OctoSPI qspi(&OCTOSPI1, 0x02000000, prescale);
	qspi.SetDoubleRateMode(false);
	qspi.SetInstructionMode(OctoSPI::MODE_QUAD, 2);
	qspi.SetAddressMode(OctoSPI::MODE_NONE);
	qspi.SetAltBytesMode(OctoSPI::MODE_NONE);
	qspi.SetDataMode(OctoSPI::MODE_QUAD);
	qspi.SetDummyCycleCount(1);
	qspi.SetDQSEnable(false);
	qspi.SetDeselectTime(1);
	qspi.SetSampleDelay(true);

	g_qspi = &qspi;
}

void InitFPGA()
{
	g_log("Initializing FPGA\n");
	LogIndenter li(g_log);

	//Read IP address configuration
	//Default to 192.168.1.42 if not configured
	//This is so much nicer looking with C++ 20 but Debian's arm-none-eabi-gcc cross compiler is currently stuck at
	//C++ 17 even though the host compiler does 20 just fine...
	if(!g_kvs->ReadObject("ip.addr", g_ipConfig.m_address.m_octets, 4))
	{
		g_log("IP address not configured, defaulting to 192.168.1.42\n");
		g_ipConfig.m_address.m_octets[0] = 192;
		g_ipConfig.m_address.m_octets[1] = 168;
		g_ipConfig.m_address.m_octets[2] = 1;
		g_ipConfig.m_address.m_octets[3] = 42;
	}

	//Read subnet mask
	//Default to /24 if not configured
	if(!g_kvs->ReadObject("ip.netmask", g_ipConfig.m_netmask.m_octets, 4))
	{
		g_log("Subnet mask not configured, defaulting to 255.255.255.0\n");
		g_ipConfig.m_netmask.m_octets[0] = 255;
		g_ipConfig.m_netmask.m_octets[1] = 255;
		g_ipConfig.m_netmask.m_octets[2] = 255;
		g_ipConfig.m_netmask.m_octets[3] = 0;
	}

	//Read gateway address mask
	//Default to 192.168.1.1 if not configured
	if(!g_kvs->ReadObject("ip.gateway", g_ipConfig.m_gateway.m_octets, 4))
	{
		g_log("Default gateway not configured, defaulting to 192.168.1.1\n");
		g_ipConfig.m_gateway.m_octets[0] = 192;
		g_ipConfig.m_gateway.m_octets[1] = 168;
		g_ipConfig.m_gateway.m_octets[2] = 1;
		g_ipConfig.m_gateway.m_octets[3] = 1;
	}

	//Calculate broadcast address
	for(int i=0; i<4; i++)
		g_ipConfig.m_broadcast.m_octets[i] = g_ipConfig.m_address.m_octets[i] | ~g_ipConfig.m_netmask.m_octets[i];

	//Read the FPGA IDCODE and serial number
	uint8_t buf[8];
	g_qspi->BlockingRead(REG_FPGA_IDCODE, 0, buf, 4);
	uint32_t idcode = (buf[0] << 24) | (buf[1] << 16) | (buf[2] << 8) | buf[3];
	g_qspi->BlockingRead(REG_FPGA_SERIAL, 0, buf, 8);

	//Push MAC address to FPGA
	g_qspi->BlockingWrite(REG_MAC_ADDRESS, 0, &g_macAddress[0], sizeof(g_macAddress));

	//Push IP config to FPGA
	g_qspi->BlockingWrite(REG_IP_ADDRESS, 0, g_ipConfig.m_address.m_octets, sizeof(IPv4Address));
	g_qspi->BlockingWrite(REG_SUBNET_MASK, 0, g_ipConfig.m_netmask.m_octets, sizeof(IPv4Address));
	g_qspi->BlockingWrite(REG_BROADCAST, 0, g_ipConfig.m_broadcast.m_octets, sizeof(IPv4Address));
	g_qspi->BlockingWrite(REG_GATEWAY, 0, g_ipConfig.m_gateway.m_octets, sizeof(IPv4Address));

	//Print status
	switch(idcode & 0x0fffffff)
	{
		case 0x03647093:
			g_log("IDCODE: %08x (XC7K70T rev %d)\n", idcode, idcode >> 28);
			break;

		case 0x0364c093:
			g_log("IDCODE: %08x (XC7K160T rev %d)\n", idcode, idcode >> 28);
			break;

		default:
			g_log("IDCODE: %08x (unknown device, rev %d)\n", idcode, idcode >> 28);
			break;
	}
	g_log("Serial: %02x%02x%02x%02x%02x%02x%02x%02x\n", buf[0], buf[1], buf[2], buf[3], buf[4], buf[5], buf[6], buf[7]);
}

/*
void InitEthernet()
{
	g_log("Initializing Ethernet\n");
	LogIndenter li(g_log);

	//Wait for the FPGA to be up and have our MAC address
	g_log("Polling FPGA status\n");
	while(true)
	{
		auto sr = GetFPGAStatus();
		if(sr & 1)
		{
			g_log(Logger::ERROR, "FPGA failed to get MAC address\n");
			while(1)
			{}
		}

		//address is ready
		if(sr & 2)
			break;
	}
	g_log("FPGA is up and has MAC address ready for us\n");

	//Read the MAC address from the FPGA
	*g_spiCS = 0;
	g_spi->BlockingWrite(REG_MAC_ADDR);
	for(int i=0; i<6; i++)
		g_macAddress[i] = g_spi->BlockingRead();
	*g_spiCS = 1;

	g_log("Our MAC address is %02x:%02x:%02x:%02x:%02x:%02x\n",
		g_macAddress[0], g_macAddress[1], g_macAddress[2], g_macAddress[3], g_macAddress[4], g_macAddress[5]);

	//Initialize the Ethernet pins. AF11 on all pins
	g_log("Initializing Ethernet pins\n");
	GPIOPin rmii_refclk(&GPIOA, 1, GPIOPin::MODE_PERIPHERAL, 11);
	GPIOPin rmii_mdio(&GPIOA, 2, GPIOPin::MODE_PERIPHERAL, 11);
	GPIOPin rmii_crs_dv(&GPIOA, 7, GPIOPin::MODE_PERIPHERAL, 11);
	GPIOPin rmii_tx_en(&GPIOB, 11, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_FAST, 11);
	GPIOPin rmii_txd0(&GPIOB, 12, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_FAST, 11);
	GPIOPin rmii_txd1(&GPIOB, 13, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_FAST, 11);
	GPIOPin rmii_mdc(&GPIOC, 1, GPIOPin::MODE_PERIPHERAL, 11);
	GPIOPin rmii_rxd0(&GPIOC, 4, GPIOPin::MODE_PERIPHERAL, 11);
	GPIOPin rmii_rxd1(&GPIOC, 5, GPIOPin::MODE_PERIPHERAL, 11);

	//Enable SYSCFG before changing any settings on it
	RCC.APB2ENR |= RCC_APB2_SYSCFG;

	//Ignore the MDIO bus for now

	//Read IP address configuration
	//Default to 192.168.1.42 if not configured
	//This is so much nicer looking with C++ 20 but Debian's arm-none-eabi-gcc cross compiler is currently stuck at
	//C++ 17 even though the host compiler does 20 just fine...
	if(!g_kvs->ReadObject("ip.addr", g_ipConfig.m_address.m_octets, 4))
	{
		g_log("IP address not configured, defaulting to 192.168.1.42\n");
		g_ipConfig.m_address.m_octets[0] = 192;
		g_ipConfig.m_address.m_octets[1] = 168;
		g_ipConfig.m_address.m_octets[2] = 1;
		g_ipConfig.m_address.m_octets[3] = 42;
	}

	//Read subnet mask
	//Default to /24 if not configured
	if(!g_kvs->ReadObject("ip.netmask", g_ipConfig.m_netmask.m_octets, 4))
	{
		g_log("Subnet mask not configured, defaulting to 255.255.255.0\n");
		g_ipConfig.m_netmask.m_octets[0] = 255;
		g_ipConfig.m_netmask.m_octets[1] = 255;
		g_ipConfig.m_netmask.m_octets[2] = 255;
		g_ipConfig.m_netmask.m_octets[3] = 0;
	}

	//Read gateway address mask
	//Default to 192.168.1.1 if not configured
	if(!g_kvs->ReadObject("ip.gateway", g_ipConfig.m_gateway.m_octets, 4))
	{
		g_log("Default gateway not configured, defaulting to 192.168.1.1\n");
		g_ipConfig.m_gateway.m_octets[0] = 192;
		g_ipConfig.m_gateway.m_octets[1] = 168;
		g_ipConfig.m_gateway.m_octets[2] = 1;
		g_ipConfig.m_gateway.m_octets[3] = 1;
	}

	//Calculate broadcast address
	for(int i=0; i<4; i++)
		g_ipConfig.m_broadcast.m_octets[i] = g_ipConfig.m_address.m_octets[i] | ~g_ipConfig.m_netmask.m_octets[i];

	//Set up all of the SFRs for the Ethernet IP itself
	g_log("Initializing MAC and DMA\n");
	static STM32EthernetInterface enet;
	g_eth = &enet;

	//Quick sanity check to make sure the link is up
	TestEthernet(25);

	//ARP cache
	static ARPCache arpCache;

	//Protocol stacks
	static EthernetProtocol eth(*g_eth, g_macAddress);
	static ARPProtocol arp(eth, g_ipConfig.m_address, arpCache);
	static IPv4Protocol ipv4(eth, g_ipConfig, arpCache);
	static ICMPv4Protocol icmpv4(ipv4);
	static DemoTCPProtocol tcp(&ipv4);

	//Register protocol handlers
	eth.UseARP(&arp);
	eth.UseIPv4(&ipv4);
	ipv4.UseICMPv4(&icmpv4);
	ipv4.UseTCP(&tcp);

	//Save the stack so we can use it later
	g_ethStack = &eth;
}

void InitSSH()
{
	g_log("Initializing SSH server\n");
	LogIndenter li(g_log);

	unsigned char pub[ECDSA_KEY_SIZE] = {0};
	unsigned char priv[ECDSA_KEY_SIZE] = {0};

	bool found = true;
	if(!g_kvs->ReadObject("ssh.hostpub", pub, ECDSA_KEY_SIZE))
		found = false;
	if(!g_kvs->ReadObject("ssh.hostpriv", priv, ECDSA_KEY_SIZE))
		found = false;

	if(found)
	{
		g_log("Using existing SSH host key\n");
		CryptoEngine::SetHostKey(pub, priv);
	}

	else
	{
		g_log("No SSH host key in flash, generating new key pair\n");
		STM32CryptoEngine tmp;
		tmp.GenerateHostKey();

		if(!g_kvs->StoreObject("ssh.hostpub", CryptoEngine::GetHostPublicKey(), ECDSA_KEY_SIZE))
			g_log(Logger::ERROR, "Unable to store SSH host public key to flash\n");
		if(!g_kvs->StoreObject("ssh.hostpriv", CryptoEngine::GetHostPrivateKey(), ECDSA_KEY_SIZE))
			g_log(Logger::ERROR, "Unable to store SSH host private key to flash\n");
	}

	char buf[64] = {0};
	STM32CryptoEngine tmp;
	tmp.GetHostKeyFingerprint(buf, sizeof(buf));
	g_log("ED25519 key fingerprint is SHA256:%s.\n", buf);
}

bool TestEthernet(uint32_t num_frames)
{
	g_log("Testing %d frames\n", num_frames);
	LogIndenter li(g_log);

	g_log("Putting FPGA in test mode\n");
	*g_spiCS = 0;
	g_spi->BlockingWrite(REG_RX_DISABLE);
	g_spi->WaitForWrites();
	*g_spiCS = 1;

	const int timeout = 50;

	for(uint32_t i=0; i<num_frames; i++)
	{
		//Ask for the frame
		*g_spiCS = 0;
		g_spi->BlockingWrite(REG_SEND_TEST);
		g_spi->WaitForWrites();
		*g_spiCS = 1;

		//Get current time
		auto tim = g_logTimer->GetCount();

		while(true)
		{
			//Check for a frame
			auto frame = g_eth->GetRxFrame();
			if(frame != NULL)
			{
				if(frame->Length() != 64)
				{
					g_log(Logger::ERROR, "Bad length on frame %d (%d bytes, expected 64)\n", i, frame->Length());
					return false;
				}

				g_eth->ReleaseRxFrame(frame);
				break;
			}

			//If we see a CRC error in the counters but the frame didn't get DMA'd, it's still a fail
			if(EMAC.MMCRFCECR != 0)
			{
				g_log(Logger::ERROR, "Bad CRC on frame %d (reported by counters)\n", i);
				break;
				return false;
			}

			//Time out if it's been too long
			auto delta = g_logTimer->GetCount() - tim;
			if(delta >= timeout)
			{
				g_log(Logger::ERROR, "Timed out after %d ms waiting for frame %d\n", timeout / 10, i);
				return false;
			}
		}
	}

	g_log("Test successful, enabling RX path in FPGA\n");

	*g_spiCS = 0;
	g_spi->BlockingWrite(REG_RX_ENABLE);
	g_spi->WaitForWrites();
	*g_spiCS = 1;
	return true;
}
*/
