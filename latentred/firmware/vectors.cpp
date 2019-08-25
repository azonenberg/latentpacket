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

extern uint32_t __stack_end;

//prototypes
extern "C" void _start();
void MMUFault_Handler();
void UsageFault_Handler();
void BusFault_Handler();
void HardFault_Handler();
void NMI_Handler();

void USART2_Handler();
void UART5_Handler();

void defaultISR();

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Interrupt vector table

fnptr __attribute__((section(".vector"))) vectorTable[] =
{
	(fnptr)&__stack_end,	//stack
	_start,					//reset
	NMI_Handler,			//NMI
	HardFault_Handler,		//hardfault
	MMUFault_Handler,		//mmufault
	BusFault_Handler,		//busfault
	UsageFault_Handler,		//usagefault
	defaultISR,				//reserved_7
	defaultISR,				//reserved_8
	defaultISR,				//reserved_9
	defaultISR,				//reserved_10
	defaultISR,				//svcall
	defaultISR,				//debug
	defaultISR,				//reserved_13
	defaultISR,				//pend_sv
	defaultISR,				//systick
	defaultISR,				//irq0 WWDG
	defaultISR,				//irq1 PVD
	defaultISR,				//irq2 TIME_STAMP
	defaultISR,				//irq3 RTC_WKUP
	defaultISR,				//irq4 FLASH
	defaultISR,				//irq5 RCC
	defaultISR,				//irq6 EXTI0
	defaultISR,				//irq7 EXTI1
	defaultISR,				//irq8 EXTI2
	defaultISR,				//irq9 EXTI3
	defaultISR,				//irq10 EXTI4
	defaultISR,				//irq11 DMA1_Stream0
	defaultISR,				//irq12 DMA1_Stream1
	defaultISR,				//irq13 DMA1_Stream2
	defaultISR,				//irq14 DMA1_Stream3
	defaultISR,				//irq15 DMA1_Stream4
	defaultISR,				//irq16 DMA1_Stream5
	defaultISR,				//irq17 DMA1_Stream6
	defaultISR,				//irq18 ADC
	defaultISR,				//irq19 CAN1_TX
	defaultISR,				//irq20 CAN1_RX0
	defaultISR,				//irq21 CAN1_RX1
	defaultISR,				//irq22 CAN1_SCE
	defaultISR,				//irq23 EXTI9_5
	defaultISR,				//irq24 TIM1_BRK_TIM9
	defaultISR,				//irq25 TIM1_UP_TIM10
	defaultISR,				//irq26 TIM1_TRG_COM_TIM11
	defaultISR,				//irq27 TIM1_CC
	defaultISR,				//irq28 TIM2
	defaultISR,				//irq29 TIM3
	defaultISR,				//irq30 TIM4
	defaultISR,				//irq31 I2C1_EV
	defaultISR,				//irq32 I2C1_ER
	defaultISR,				//irq33 I2C2_EV
	defaultISR,				//irq34 I2C2_ER
	defaultISR,				//irq35 SPI1
	defaultISR,				//irq36 SPI2
	defaultISR,				//irq37 USART1
	USART2_Handler,			//irq38 USART2
	defaultISR,				//irq39 USART3
	defaultISR,				//irq40 EXTI15_10
	defaultISR,				//irq41 RTC_Alarm
	defaultISR,				//irq42 OTG_FS_WKUP
	defaultISR,				//irq43 TIM8_BRK_TIM12
	defaultISR,				//irq44 TIM8_UP_TIM13
	defaultISR,				//irq45 TIM8_TRG_COM_TIM14
	defaultISR,				//irq46 TIM8_CC
	defaultISR,				//irq47 DMA1_Stream7
	defaultISR,				//irq48 FMC
	defaultISR,				//irq49 SDMMC1
	defaultISR,				//irq50 TIM5
	defaultISR,				//irq51 SPI3
	defaultISR,				//irq52 UART4
	defaultISR,				//irq53 UART5
	defaultISR,				//irq54 TIM6_DAC
	defaultISR,				//irq55 TIM7
	defaultISR,				//irq56 DMA2_Stream0
	defaultISR,				//irq57 DMA2_Stream1
	defaultISR,				//irq58 DMA2_Stream2
	defaultISR,				//irq59 DMA2_Stream3
	defaultISR,				//irq60 DMA2_Stream4
	defaultISR,				//irq61 ETH
	defaultISR,				//irq62 ETH_WKUP
	defaultISR,				//irq63 CAN2_TX
	defaultISR,				//irq64 CAN2_RX0
	defaultISR,				//irq65 CAN2_RX1
	defaultISR,				//irq66 CAN2_SCE
	defaultISR,				//irq67 OTG_FS
	defaultISR,				//irq68 DMA2_Stream5
	defaultISR,				//irq69 DMA2_Stream6
	defaultISR,				//irq70 DMA2_Stream7
	defaultISR,				//irq71 USART6
	defaultISR,				//irq72 I2C3_EV
	defaultISR,				//irq73 I2C3_ER
	defaultISR,				//irq74 OTG_HS_EP1_OUT
	defaultISR,				//irq75 OTG_HS_EP1_IN
	defaultISR,				//irq76 OTG_HS_WKUP
	defaultISR,				//irq77 OTG_HS
	defaultISR,				//irq78 DCMI
	defaultISR,				//irq79 CRYP
	defaultISR,				//irq80 HASH_RNG
	defaultISR,				//irq81 FPU
	defaultISR,				//irq82 UART7
	defaultISR,				//irq83 UART8
	defaultISR,				//irq84 SPI4
	defaultISR,				//irq85 SPI5
	defaultISR,				//irq86 SPI6
	defaultISR,				//irq87 SAI1
	defaultISR,				//irq88 LCD-TFT
	defaultISR,				//irq89 LCD-TFT-ER
	defaultISR,				//irq90 DMA2D
	defaultISR,				//irq91 SAI2
	defaultISR,				//irq92 QuadSPI
	defaultISR,				//irq93 LP_TIMER1
	defaultISR,				//irq94 HDMI-CEC
	defaultISR,				//irq95 I2C4_EV
	defaultISR,				//irq96 I2C4_ER
	defaultISR,				//irq97 SPDIFRX
	defaultISR,				//irq98 DSIHOST
	defaultISR,				//irq99 DFSDM1_FLT0
	defaultISR,				//irq100 DFSDM1_FLT1
	defaultISR,				//irq101 DFSDM1_FLT2
	defaultISR,				//irq102 DFSDM1_FLT3
	defaultISR,				//irq103 SDMMC2
	defaultISR,				//irq104 CAN3_TX
	defaultISR,				//irq105 CAN3_RX0
	defaultISR,				//irq106 CAN3_RX1
	defaultISR,				//irq107 CAN3_SCE
	defaultISR,				//irq108 JPEG
	defaultISR				//irq109 MDIOS
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Stub for unused interrupts

void defaultISR()
{
	g_platform.m_cliUart.PrintString("Unused interrupt vector called\n");
	while(1)
	{}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Exception vectors

void NMI_Handler()
{
	g_platform.m_cliUart.PrintString("NMI\n");
	while(1)
	{}
}

void HardFault_Handler()
{
	uint32_t* msp;
	asm volatile("mrs %[result], MSP" : [result]"=r"(msp));
	msp += 12;	//locals/alignment
	uint32_t r0 = msp[0];
	uint32_t r1 = msp[1];
	uint32_t r2 = msp[2];
	uint32_t r3 = msp[3];
	uint32_t r12 = msp[4];
	uint32_t lr = msp[5];
	uint32_t pc = msp[6];
	uint32_t xpsr = msp[7];

	g_platform.m_cliUart.Printf("Hard fault\n");
	g_platform.m_cliUart.Printf("    HFSR  = %08x\n", *(volatile uint32_t*)(0xe000ed2C));
	g_platform.m_cliUart.Printf("    MMFAR = %08x\n", *(volatile uint32_t*)(0xe000ed34));
	g_platform.m_cliUart.Printf("    BFAR  = %08x\n", *(volatile uint32_t*)(0xe000ed38));
	g_platform.m_cliUart.Printf("    CFSR  = %08x\n", *(volatile uint32_t*)(0xe000ed28));
	g_platform.m_cliUart.Printf("    UFSR  = %08x\n", *(volatile uint16_t*)(0xe000ed2a));
	g_platform.m_cliUart.Printf("    DFSR  = %08x\n", *(volatile uint32_t*)(0xe000ed30));
	g_platform.m_cliUart.Printf("    MSP   = %08x\n", msp);
	g_platform.m_cliUart.Printf("    r0    = %08x\n", r0);
	g_platform.m_cliUart.Printf("    r1    = %08x\n", r1);
	g_platform.m_cliUart.Printf("    r2    = %08x\n", r2);
	g_platform.m_cliUart.Printf("    r3    = %08x\n", r3);
	g_platform.m_cliUart.Printf("    r12   = %08x\n", r12);
	g_platform.m_cliUart.Printf("    lr    = %08x\n", lr);
	g_platform.m_cliUart.Printf("    pc    = %08x\n", pc);
	g_platform.m_cliUart.Printf("    xpsr  = %08x\n", xpsr);

	g_platform.m_cliUart.Printf("    Stack:\n");
	for(int i=0; i<16; i++)
		g_platform.m_cliUart.Printf("        %08x\n", msp[i]);

	while(1)
	{}
}

void BusFault_Handler()
{
	g_platform.m_cliUart.PrintString("Bus fault\n");
	while(1)
	{}
}

void UsageFault_Handler()
{
	g_platform.m_cliUart.PrintString("Usage fault\n");
	while(1)
	{}
}

void MMUFault_Handler()
{
	g_platform.m_cliUart.PrintString("MMU fault\n");
	while(1)
	{}
}
