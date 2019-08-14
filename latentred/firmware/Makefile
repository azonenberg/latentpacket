CFLAGS=-march=armv7-m
CC=arm-none-eabi-gcc

all:
	$(CC) *.S -c $(CFLAGS)
	$(CC) *.c -c $(CFLAGS)
	arm-none-eabi-ld *.o -T scripts/stm32f777.ld -o latentred.elf
	arm-none-eabi-objcopy -O binary --only-section=.text --only-section=.data latentred.elf latentred.bin
