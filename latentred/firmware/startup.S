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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Interrupt vector table

.section .vector
vectorTable:
	.word __stack_end
	.word _start
	.word NMI_Handler		//NMI
	.word HardFault_Handler	//hardfault
	.word MMUFault_Handler	//mmufault
	.word BusFault_Handler	//busfault
	.word UsageFault_Handler	//usagefault
	.word defaultISR		//reserved_7
	.word defaultISR		//reserved_8
	.word defaultISR		//reserved_9
	.word defaultISR		//reserved_10
	.word defaultISR		//svcall
	.word defaultISR		//debug
	.word defaultISR		//reserved_13
	.word defaultISR		//pend_sv
	.word defaultISR		//systick
	.word defaultISR		//irq0 WWDG
	.word defaultISR		//irq1 PVD
	.word defaultISR		//irq2 TIME_STAMP
	.word defaultISR		//irq3 RTC_WKUP
	.word defaultISR		//irq4 FLASH
	.word defaultISR		//irq5 RCC
	.word defaultISR		//irq6 EXTI0
	.word defaultISR		//irq7 EXTI1
	.word defaultISR		//irq8 EXTI2
	.word defaultISR		//irq9 EXTI3
	.word defaultISR		//irq10 EXTI4
	.word defaultISR		//irq11 DMA1_Stream0
	.word defaultISR		//irq12 DMA1_Stream1
	.word defaultISR		//irq13 DMA1_Stream2
	.word defaultISR		//irq14 DMA1_Stream3
	.word defaultISR		//irq15 DMA1_Stream4
	.word defaultISR		//irq16 DMA1_Stream5
	.word defaultISR		//irq17 DMA1_Stream6
	.word defaultISR		//irq18 ADC
	.word defaultISR		//irq19 CAN1_TX
	.word defaultISR		//irq20 CAN1_RX0
	.word defaultISR		//irq21 CAN1_RX1
	.word defaultISR		//irq22 CAN1_SCE
	.word defaultISR		//irq23 EXTI9_5
	.word defaultISR		//irq24 TIM1_BRK_TIM9
	.word defaultISR		//irq25 TIM1_UP_TIM10
	.word defaultISR		//irq26 TIM1_TRG_COM_TIM11
	.word defaultISR		//irq27 TIM1_CC
	.word defaultISR		//irq28 TIM2
	.word defaultISR		//irq29 TIM3
	.word defaultISR		//irq30 TIM4
	.word defaultISR		//irq31 I2C1_EV
	.word defaultISR		//irq32 I2C1_ER
	.word defaultISR		//irq33 I2C2_EV
	.word defaultISR		//irq34 I2C2_ER
	.word defaultISR		//irq35 SPI1
	.word defaultISR		//irq36 SPI2
	.word defaultISR		//irq37 USART1
	.word USART2_Handler	//irq38 USART2
	.word defaultISR		//irq39 USART3
	.word defaultISR		//irq40 EXTI15_10
	.word defaultISR		//irq41 RTC_Alarm
	.word defaultISR		//irq42 OTG_FS_WKUP
	.word defaultISR		//irq43 TIM8_BRK_TIM12
	.word defaultISR		//irq44 TIM8_UP_TIM13
	.word defaultISR		//irq45 TIM8_TRG_COM_TIM14
	.word defaultISR		//irq46 TIM8_CC
	.word defaultISR		//irq47 DMA1_Stream7
	.word defaultISR		//irq48 FMC
	.word defaultISR		//irq49 SDMMC1
	.word defaultISR		//irq50 TIM5
	.word defaultISR		//irq51 SPI3
	.word defaultISR		//irq52 UART4
	.word UART5_Handler		//irq53 UART5
	.word defaultISR		//irq54 TIM6_DAC
	.word defaultISR		//irq55 TIM7
	.word defaultISR		//irq56 DMA2_Stream0
	.word defaultISR		//irq57 DMA2_Stream1
	.word defaultISR		//irq58 DMA2_Stream2
	.word defaultISR		//irq59 DMA2_Stream3
	.word defaultISR		//irq60 DMA2_Stream4
	.word defaultISR		//irq61 ETH
	.word defaultISR		//irq62 ETH_WKUP
	.word defaultISR		//irq63 CAN2_TX
	.word defaultISR		//irq64 CAN2_RX0
	.word defaultISR		//irq65 CAN2_RX1
	.word defaultISR		//irq66 CAN2_SCE
	.word defaultISR		//irq67 OTG_FS
	.word defaultISR		//irq68 DMA2_Stream5
	.word defaultISR		//irq69 DMA2_Stream6
	.word defaultISR		//irq70 DMA2_Stream7
	.word defaultISR		//irq71 USART6
	.word defaultISR		//irq72 I2C3_EV
	.word defaultISR		//irq73 I2C3_ER
	.word defaultISR		//irq74 OTG_HS_EP1_OUT
	.word defaultISR		//irq75 OTG_HS_EP1_IN
	.word defaultISR		//irq76 OTG_HS_WKUP
	.word defaultISR		//irq77 OTG_HS
	.word defaultISR		//irq78 DCMI
	.word defaultISR		//irq79 CRYP
	.word defaultISR		//irq80 HASH_RNG
	.word defaultISR		//irq81 FPU
	.word defaultISR		//irq82 UART7
	.word defaultISR		//irq83 UART8
	.word defaultISR		//irq84 SPI4
	.word defaultISR		//irq85 SPI5
	.word defaultISR		//irq86 SPI6
	.word defaultISR		//irq87 SAI1
	.word defaultISR		//irq88 LCD-TFT
	.word defaultISR		//irq89 LCD-TFT-ER
	.word defaultISR		//irq90 DMA2D
	.word defaultISR		//irq91 SAI2
	.word defaultISR		//irq92 QuadSPI
	.word defaultISR		//irq93 LP_TIMER1
	.word defaultISR		//irq94 HDMI-CEC
	.word defaultISR		//irq95 I2C4_EV
	.word defaultISR		//irq96 I2C4_ER
	.word defaultISR		//irq97 SPDIFRX
	.word defaultISR		//irq98 DSIHOST
	.word defaultISR		//irq99 DFSDM1_FLT0
	.word defaultISR		//irq100 DFSDM1_FLT1
	.word defaultISR		//irq101 DFSDM1_FLT2
	.word defaultISR		//irq102 DFSDM1_FLT3
	.word defaultISR		//irq103 SDMMC2
	.word defaultISR		//irq104 CAN3_TX
	.word defaultISR		//irq105 CAN3_RX0
	.word defaultISR		//irq106 CAN3_RX1
	.word defaultISR		//irq107 CAN3_SCE
	.word defaultISR		//irq108 JPEG
	.word defaultISR		//irq109 MDIOS

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Default ISR if not used: infinite loop

defaultISR:
	b	defaultISR

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Startup code

.thumb_func
.text
.global _start
_start:

	//Zero .bss
	ldr r0, =#0
	ldr r1, =__bss_start
	ldr r2, =__bss_end
bssloop:
	str r0, [r1]
	add r1, r1, #4
	cmp r1, r2
	ble	bssloop

	//Copy .data to RAM
	ldr r1, =__data_romstart
	ldr r2, =__data_start
	ldr r3, =__data_end
dataloop:
	ldr r0, [r1]
	str r0, [r2]
	add r1, r1, #4
	add r2, r2, #4
	cmp r2, r3
	ble dataloop

	//Call all global constructors
	ldr r1, = __ctor_start
	ldr r2, = __ctor_end
ctorloop:
	ldr r0, [r1]
	blx r0
	add r1, r1, #4
	cmp r1, r2
	ble ctorloop

	//Done initializing, jump to main
	ldr r0, =main
	blx r0

	//If we get here, something is wrong
die:
	b	die
