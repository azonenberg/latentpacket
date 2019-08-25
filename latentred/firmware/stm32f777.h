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

#ifndef stm32f777_h
#define stm32f777_h

typedef struct
{
	uint32_t ACR;
	uint32_t KEYR;
	uint32_t OPTKEYR;
	uint32_t SR;
	uint32_t CR;
	uint32_t OPTCR;
	uint32_t OPTCR1;
} flash_t;

extern volatile flash_t FLASH;

enum flash_acr
{
	FLASH_ACR_ARTEN = 0x20,
	FLASH_ACR_PREFETCHEN = 0x10,
};


typedef struct
{
	uint32_t MODER;
	uint32_t OTYPER;
	uint32_t OSPEEDR;
	uint32_t PUPDR;
	uint32_t IDR;
	uint32_t ODR;
	uint32_t BSRR;
	uint32_t LCKR;
	uint32_t AFRL;
	uint32_t AFRH;
} gpio_t;

extern volatile gpio_t GPIOA;
extern volatile gpio_t GPIOB;
extern volatile gpio_t GPIOC;
extern volatile gpio_t GPIOD;
extern volatile gpio_t GPIOE;
extern volatile gpio_t GPIOF;
extern volatile gpio_t GPIOG;
extern volatile gpio_t GPIOH;
extern volatile gpio_t GPIOI;
extern volatile gpio_t GPIOJ;
extern volatile gpio_t GPIOK;

enum rcc_ahb1
{
	RCC_AHB1_GPIOA = 0x0001,
	RCC_AHB1_GPIOB = 0x0002,
	RCC_AHB1_GPIOC = 0x0004,
	RCC_AHB1_GPIOD = 0x0008,
	RCC_AHB1_GPIOE = 0x0010,
	RCC_AHB1_GPIOF = 0x0020,
	RCC_AHB1_GPIOG = 0x0040,
	RCC_AHB1_GPIOH = 0x0080,
	RCC_AHB1_GPIOI = 0x0100,
	RCC_AHB1_GPIOJ = 0x0200,
	RCC_AHB1_GPIOK = 0x0400
};

enum rcc_apb1
{
	RCC_APB1_UART5 = 0x100000,
	RCC_APB1_UART4 = 0x080000,
	RCC_APB1_USART3 = 0x040000,
	RCC_APB1_USART2 = 0x020000
};

enum rcc_apb2
{
	RCC_APB2_SPI1 = 0x1000,
	RCC_APB2_SPI4 = 0x2000,
	RCC_APB2_SPI5 = 0x100000,
	RCC_APB2_SPI6 = 0x200000
};

typedef struct
{
	uint32_t CR;
	uint32_t PLLCFGR;
	uint32_t CFGR;
	uint32_t CIR;
	uint32_t AHB1RSTR;
	uint32_t AHB2RSTR;
	uint32_t AHB3RSTR;
	uint32_t field_1c;
	uint32_t APB1RSTR;
	uint32_t APB2RSTR;
	uint32_t field_28;
	uint32_t field_2c;
	uint32_t AHB1ENR;
	uint32_t AHB2ENR;
	uint32_t AHB3ENR;
	uint32_t field_3c;
	uint32_t APB1ENR;
	uint32_t APB2ENR;
	uint32_t field_48;
	uint32_t field_4c;
	uint32_t AHB1LPENR;
	uint32_t AHB2LPENR;
	uint32_t AHB3LPENR;
	uint32_t field_5c;
	uint32_t APB1LPENR;
	uint32_t APB2LPENR;
	uint32_t field_68;
	uint32_t field_6c;
	uint32_t BDCR;
	uint32_t CSR;
	uint32_t field_78;
	uint32_t field_7c;
	uint32_t SSCGR;
	uint32_t PLLI2SCFGR;
	uint32_t PLLSAICFGR;
	uint32_t DCKCFGR1;
	uint32_t DCKCFGR2;
} rcc_t;

enum rcc_pll_bits
{
	RCC_PLL_READY	= 0x2000000,
	RCC_PLL_ENABLE 	= 0x1000000,

	RCC_APB2_DIV4 	= 0xA000,
	RCC_APB1_DIV8	= 0x1800,
	RCC_AHB_DIV1	= 0x0,
	RCC_SYSCLK_PLL	= 0x2,

	RCC_PLLCFGR_RESERVED_MASK = 0x80BC8000
};

extern volatile rcc_t RCC;

typedef struct
{
	uint32_t CR1;
	uint32_t CR2;
	uint32_t CR3;
	uint32_t BRR;
	uint32_t GTPR;
	uint32_t RTOR;
	uint32_t RQR;
	uint32_t ISR;
	uint32_t ICR;
	uint32_t RDR;
	uint32_t TDR;
} usart_t;

enum usart_bits
{
	USART_ISR_TXE = 0x80,
	USART_ISR_RXNE = 0x20
};

extern volatile usart_t USART1;
extern volatile usart_t USART2;
extern volatile usart_t USART3;
extern volatile usart_t UART4;
extern volatile usart_t UART5;
extern volatile usart_t USART6;

typedef struct
{
	uint16_t CR1;
	uint16_t field_02;
	uint16_t CR2;
	uint16_t field_06;
	uint16_t SR;
	uint16_t field_0a;
	uint16_t DR;
	uint16_t field_0e;
	uint16_t CRCPR;
	uint16_t field_12;
	uint16_t RXCRCR;
	uint16_t field_16;
	uint16_t TXCRCR;
	uint16_t field_1a;
	uint16_t I2SCFGR;
	uint16_t field_1e;
	uint16_t I2SPR;
	uint16_t field_22;
} spi_t;

extern volatile spi_t SPI1;
extern volatile spi_t SPI4;
extern volatile spi_t SPI5;
extern volatile spi_t SPI6;

typedef struct
{
	uint32_t reserved_0;
	uint32_t ictr;
	uint32_t reserved_8[62];
} nvic_t;

extern volatile nvic_t NVIC;

/**
	@brief Disables interrupts without saving the previous enable state
 */
extern "C" void DisableInterrupts();

/**
	@brief Enables interrupts without saving the previous enable state
 */
extern "C" void EnableInterrupts();

/**
	@brief Enters a critical section, disables interrupts, and returns the previous PRIMASK value
 */
extern "C" uint32_t EnterCriticalSection();

/**
	@brief Leaves a critical section and restores the previous PRIMASK value
 */
extern "C" void LeaveCriticalSection(uint32_t cpu_sr);

extern char __heap_start;
extern char __heap_end;

extern "C" void NMI_Handler();
extern "C" void HardFault_Handler();
extern "C" void BusFault_Handler();
extern "C" void UsageFault_Handler();
extern "C" void MMUFault_Handler();

#endif
