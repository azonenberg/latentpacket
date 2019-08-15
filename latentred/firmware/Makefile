CFLAGS=-march=armv7-m
CC=arm-none-eabi-gcc
NEWLIB=/nfs4/home/azonenberg/code/3rdparty/newlib-arm-none-eabi/arm-none-eabi/thumb/v7-m/newlib
all:
	$(CC) *.S -c $(CFLAGS)
	$(CC) *.c -c $(CFLAGS)
	arm-none-eabi-ld *.o -T scripts/stm32f777.ld $(NEWLIB)/libc.a $(NEWLIB)/libg.a $(NEWLIB)/libm.a -o latentred.elf
	arm-none-eabi-objcopy -O binary --only-section=.text --only-section=.data latentred.elf latentred.bin
