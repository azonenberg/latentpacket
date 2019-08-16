CFLAGS=-march=armv7-m
CXXFLAGS=-march=armv7-m --std=c++17 -fno-exceptions
CC=arm-none-eabi-gcc
CXX=arm-none-eabi-g++
NEWLIB=/nfs4/home/azonenberg/code/3rdparty/newlib-arm-none-eabi/arm-none-eabi/thumb/v7-m/newlib
all:
	$(CC) *.S -c $(CFLAGS)
	$(CXX) *.cpp -c $(CXXFLAGS)
	$(CXX) -nostdlib *.o -Wl,-T scripts/stm32f777.ld $(NEWLIB)/libc.a $(NEWLIB)/libg.a $(NEWLIB)/libm.a -o latentred.elf
#	arm-none-eabi-ld *.o -T scripts/stm32f777.ld $(NEWLIB)/libc.a $(NEWLIB)/libg.a $(NEWLIB)/libm.a -o latentred.elf
	arm-none-eabi-objcopy -O binary --only-section=.text --only-section=.data latentred.elf latentred.bin
