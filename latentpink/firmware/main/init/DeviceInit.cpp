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

/**
	@file
	@author	Andrew D. Zonenberg
	@brief	Initialization code only used by real hardware
 */

#include "latentpink.h"
#include "target/device/DeviceFPGAInterface.h"

void InitClocks()
{
	//Configure the flash with wait states and prefetching before making any changes to the clock setup.
	//A bit of extra latency is fine, the CPU being faster than flash is not.
	Flash::SetConfiguration(275, RANGE_VOS0);

	//By default out of reset, we're clocked by the HSI clock at 64 MHz

	//Set up PLL1
	RCCHelper::InitializePLL(
		1,		//PLL1
		64,		//input is 64 MHz from the HSE
		4,		//64/4 = 16 MHz at the PFD
		32,		//16 * 32 = 512 MHz at the VCO
		1,		//div P (primary output 512 MHz)
		32,		//div Q (not used for now)
		32,		//div R (not used for now),
		RCCHelper::CLOCK_SOURCE_HSI
	);

	//Set up main system clock tree
	RCCHelper::InitializeSystemClocks(
		1,		//sysclk = 512 MHz
		2,		//AHB = 256 MHz
		4,		//APB1 = 64 MHz
		4,		//APB2 = 64 MHz
		4,		//APB3 = 64 MHz
		4		//APB4 = 64 MHz
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

	//Default after reset is for UART4 to be clocked by PCLK1 (APB1 clock) which is 64 MHz
	//So we need a divisor of 555.55
	static UART uart(&UART4, 556);
	g_cliUART = &uart;

	//Enable the UART RX interrupt
	//TODO: Make an RCC method for this
	volatile uint32_t* NVIC_ISER1 = (volatile uint32_t*)(0xe000e104);
	*NVIC_ISER1 = 0x100000;

	g_logTimer->Sleep(10);	//wait for UART pins to be high long enough to remove any glitches during powerup

	//Clear screen and move cursor to X0Y0
	uart.Printf("\x1b[2J\x1b[0;0H");
}

void InitTimer()
{
	//APB1 is 64 MHz
	//Divide down to get 10 kHz ticks
	static Timer logtim(&TIM2, Timer::FEATURE_GENERAL_PURPOSE, 6400);
	g_logTimer = &logtim;
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
	//Default is for AHB3 bus clock to be used as kernel clock (256 MHz for us)
	//With 3.3V Vdd, we can go up to 140 MHz.
	//Dividing by 4 gives 64 MHz and a transfer rate of 256 Mbps.
	//FPGA currently requires <= 46.875 MHz due to the RX oversampling used
	//Dividing by 6 gives 42.666 MHz and a transfer rate of 170.66 Mbps
	uint8_t prescale = 6;

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
	qspi.SetSampleDelay(false);

	g_qspi = &qspi;

	static DeviceFPGAInterface fpga;
	g_fpga = &fpga;
}

void InitI2C()
{
	g_log("Initializing I2C interfaces\n");

	static GPIOPin mac_i2c_scl(&GPIOB, 8, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 6, true);
	static GPIOPin mac_i2c_sda(&GPIOB, 9, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 6, true);

	//Default kernel clock for I2C4 is pclk4 (64 MHz for our current config)
	//Prescale by 16 to get 4 MHz
	//Divide by 40 after that to get 100 kHz
	static I2C mac_i2c(&I2C4, 16, 40);
	g_macI2C = &mac_i2c;

	static GPIOPin temp_i2c_scl(&GPIOB, 6, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 4, true);
	static GPIOPin temp_i2c_sda(&GPIOB, 7, GPIOPin::MODE_PERIPHERAL, GPIOPin::SLEW_SLOW, 4, true);

	//Default kernel clock for I2C4 is APB1 clock (64 MHz for our current config)
	//Prescale by 16 to get 4 MHz
	//Divide by 40 after that to get 100 kHz
	static I2C temp_i2c(&I2C1, 16, 40);
	g_tempI2C = &temp_i2c;
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
	g_macI2C->BlockingWrite8(ext_addr, mac_offset);
	g_macI2C->BlockingRead(ext_addr, &g_macAddress[0], sizeof(g_macAddress));

	//Read serial number
	const int serial_len = 16;
	uint8_t serial[serial_len] = {0};
	g_macI2C->BlockingWrite8(ext_addr, serial_offset);
	g_macI2C->BlockingRead(ext_addr, serial, serial_len);

	{
		LogIndenter li(g_log);
		g_log("MAC address: %02x:%02x:%02x:%02x:%02x:%02x\n",
			g_macAddress[0], g_macAddress[1], g_macAddress[2], g_macAddress[3], g_macAddress[4], g_macAddress[5]);

		g_log("EEPROM serial number: %02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x\n",
			serial[0], serial[1], serial[2], serial[3], serial[4], serial[5], serial[6], serial[7],
			serial[8], serial[9], serial[10], serial[11], serial[12], serial[13], serial[14], serial[15]);
	}
}

/**
	@brief Initialize sensors and log starting values for each
 */
void InitSensors()
{
	g_log("Initializing sensors\n");
	LogIndenter li(g_log);

	//Read fans
	for(uint8_t i=0; i<2; i++)
	{
		auto rpm = GetFanRPM(i);
		if(rpm == 0)
			g_log(Logger::ERROR, "Fan %d:                                 STOPPED\n", i, rpm);
		else
			g_log("Fan %d:                                 %d RPM\n", i, rpm);
	}

	//Bring up each temp sensor
	for(uint8_t i=0; i<4; i++)
	{
		auto addr = g_tempSensorAddrs[i];

		//Set mode to max resolution
		uint8_t cmd[3] = {0x01, 0x60, 0x00};
		if(!g_tempI2C->BlockingWrite(addr, cmd, sizeof(cmd)))
		{
			g_log(Logger::ERROR, "Failed to initialize I2C temp sensor at 0x%02x\n", addr);
			continue;
		}

		//Print value
		auto temp = ReadThermalSensor(addr);
		g_log("Temp 0x%02x (%25s): %d.%02d C\n",
			addr,
			g_tempSensorNames[i],
			(temp >> 8),
			static_cast<int>(((temp & 0xff) / 256.0) * 100));
	}

	//Read FPGA temperature
	auto temp = GetFPGATemperature();
	g_log("FPGA die temperature:                  %d.%02d C\n", (temp >> 8), static_cast<int>(((temp & 0xff) / 256.0) * 100));

	//Read FPGA voltage sensors
	int volt = GetFPGAVCCINT();
	g_log("FPGA VCCINT:                           %d.%02d V\n", (volt >> 8), static_cast<int>(((volt & 0xff) / 256.0) * 100));
	volt = GetFPGAVCCBRAM();
	g_log("FPGA VCCBRAM:                          %d.%02d V\n", (volt >> 8), static_cast<int>(((volt & 0xff) / 256.0) * 100));
	volt = GetFPGAVCCAUX();
	g_log("FPGA VCCAUX:                           %d.%02d V\n", (volt >> 8), static_cast<int>(((volt & 0xff) / 256.0) * 100));
}

/**
	@brief Test external SRAM
 */
void MemoryTest()
{
	g_log("Testing packet buffer SRAM\n");
	LogIndenter li(g_log);

	//Enter test mode
	g_fpga->BlockingWrite32(REG_MBIST, 0x80000000);

	uint32_t seeds[3] =
	{
		0xdeadbeef,
		0xfeedface,
		0xbaadf00d
	};

	bool fail = false;
	for(uint32_t i=0; i<3; i++)
	{
		if(!DoMemoryTest(seeds[i]))
		{
			fail = true;
			break;
		}
	}

	if(!fail)
		g_log("SRAM test passed\n");

	//Done, back to normal mode
	g_fpga->BlockingWrite32(REG_MBIST, 0x00000000);
}

/**
	@brief Run a single pass of the MBIST
 */
bool DoMemoryTest(uint32_t seed)
{
	//Set seed
	g_fpga->BlockingWrite32(REG_MBIST_SEED, seed);

	//Start the test
	g_fpga->BlockingWrite32(REG_MBIST, 0xc0000000);

	//Poll until test completes
	while(true)
	{
		uint32_t stat = g_fpga->BlockingRead32(REG_MBIST);
		if(stat & 0x20000000)
			break;
	}

	//Read test results
	uint32_t stat = g_fpga->BlockingRead32(REG_MBIST);
	if(stat & 0x10000000)
	{
		g_log(Logger::ERROR, "SRAM test failed at address 0x%08x\n", (stat & 0x3FFFF ));
		return false;
	}

	return true;
}
