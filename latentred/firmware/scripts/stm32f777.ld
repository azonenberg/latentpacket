ENTRY(_start)

MEMORY
{
	FLASH(RX):	ORIGIN = 0x08000000, LENGTH = 1M
	SRAM1(RW):	ORIGIN = 0x20020000, LENGTH = 368K
	DTCM(RW):	ORIGIN = 0x20000000, LENGTH = 128K
	SRAM2(RW):	ORIGIN = 0x2007c000, LENGTH = 16K

	/* SFRs */
	AHB1(RW):	ORIGIN = 0x40020000, LENGTH = 384K
	APB2(RW):	ORIGIN = 0x40010000, LENGTH = 32K
	APB1(RW):	ORIGIN = 0x40000000, LENGTH = 32K
}

SECTIONS
{
	/* Code comes right after the vector tables */
	.text :
	{
		*(.vector)
		*(.text.*)
		*(.rodata)
		*(.ctors)
		. = ALIGN(4);
		__ctor_start = .;
		*(.init_array)
		__ctor_end = .;
	} > FLASH

	/* Initialized data needs special handling because it lives in two places */
	.data :
	{
		__data_romstart = LOADADDR(.data);
		__data_start = .;
		*(.data)
		__data_end = .;
	} > SRAM1 AT> FLASH

	/* BSS is pretty straightforward */
	.bss :
	{
		__bss_start = .;
		*(.bss)
		__bss_end = .;
	} > SRAM1

	/* Stack goes in TCM to keep it fast. We probably won't be DMAing etc to/from it. */
	.stack :
	{
		__stack_start = .;
		. = ALIGN(4);
		. += 0x10000;
		__stack_end = .;
	} > DTCM

	/* Fill all remaining SRAM1 space with the heap */
	.heap :
	{
		. = ALIGN(4);
		__heap_start = .;
		. = ORIGIN(SRAM1) + LENGTH(SRAM1) - 4;
		__heap_end = .;
		PROVIDE(end = .);
	} > SRAM1

	/* SFRs */
	.sfr_ahb1 :
	{
		. = ALIGN(1024);
		*(.gpioa)
		. = ALIGN(1024);
		*(.gpiob)
		. = ALIGN(1024);
		*(.gpioc)
		. = ALIGN(1024);
		*(.gpiod)
		. = ALIGN(1024);
		*(.gpioe)
		. = ALIGN(1024);
		*(.gpiof)
		. = ALIGN(1024);
		*(.gpiog)
		. = ALIGN(1024);
		*(.gpioh)
		. = ALIGN(1024);
		*(.gpioi)
		. = ALIGN(1024);
		*(.gpioj)
		. = ALIGN(1024);
		*(.gpiok)

		. += 1024;		/* reserved 4002_2c00 */
		. += 1024;		/* CRC not yet implemented */
		. += 1024;		/* reserved 4002_3400 */

		. = ALIGN(1024);
		*(.rcc)
		. = ALIGN(1024);
		*(.flash)

	} > AHB1

	.sfr_apb1 :
	{
		. += 1024;		/* TIM2 not yet implemented */
		. += 1024;		/* TIM3 not yet implemented */
		. += 1024;		/* TIM4 not yet implemented */
		. += 1024;		/* TIM5 not yet implemented */
		. += 1024;		/* TIM6 not yet implemented */
		. += 1024;		/* TIM7 not yet implemented */
		. += 1024;		/* TIM12 not yet implemented */
		. += 1024;		/* TIM13 not yet implemented */
		. += 1024;		/* TIM14 not yet implemented */
		. += 1024;		/* LPTIM1 not yet implemented */
		. += 1024;		/* RTC not yet implemented */
		. += 1024;		/* WWDG not yet implemented */
		. += 1024;		/* IWDG not yet implemented */
		. += 1024;		/* CAN3 not yet implemented */
		. += 1024;		/* SPI2 not yet implemented */
		. += 1024;		/* SPI3 not yet implemented */
		. += 1024;		/* SPDIFRX not yet implemented */

		. = ALIGN(1024);
		*(.usart2)
		. = ALIGN(1024);
		*(.usart3)
		. = ALIGN(1024);
		*(.uart4)
		. = ALIGN(1024);
		*(.uart5)
	} > APB1

	.sfr_apb2 :
	{
		. += 1024;		/* TIM1 not yet implemented */
		. += 1024;		/* TIM8 not yet implemented */
		. += 2048;		/* reserved unimplemented */
		. = ALIGN(1024);
		*(.usart1)
		. = ALIGN(1024);
		*(.usart6)
		. += 1024;		/* reserved unimplemented */
		. += 1024;		/* SDMMC2 not yet implemented */
		. += 1024;		/* ADC not yet implemented */
		. += 2048;		/* reserved unimplemented */
		. += 1024;		/* SDMMC1 not yet implemented */
		. = ALIGN(1024);
		*(.spi1)
		. = ALIGN(1024);
		*(.spi4)
		. += 1024;		/* SYSCFG not yet implemented */
		. += 1024;		/* EXTI not yet implemented */
		. += 1024;		/* TIM9 not yet implemented */
		. += 1024;		/* TIM10 not yet implemented */
		. += 1024;		/* TIM11 not yet implemented */
		. += 1024;		/* reserved unimplemented */
		. = ALIGN(1024);
		*(.spi5)
		. = ALIGN(1024);
		*(.spi6)
		. += 1024;		/* SAI1 not yet implemented */
		. += 1024;		/* SAI2 not yet implemented */
		. += 2048;		/* reserved unimplemented */
		. += 1024;		/* LCD-TFT not yet implemented */
		. += 1024;		/* DSI-host not yet implemented */
		. += 1024;		/* DFSDM1 not yet implemented */
		. += 1024;		/* MDIOS not yet implemented */
	} > APB2
}
