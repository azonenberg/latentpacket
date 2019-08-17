CFLAGS=-march=armv7-m -mfloat-abi=hard
CXXFLAGS=-march=armv7-m -mfloat-abi=hard --std=c++17 -fno-exceptions -nostdinc
CC=arm-none-eabi-gcc
CXX=arm-none-eabi-g++
all:
	$(CC) *.S -c $(CFLAGS)
	$(CXX) *.cpp -c $(CXXFLAGS)
	$(CXX) $(CXXFLAGS) -nostdlib *.o -Wl,-T scripts/stm32f777.ld -o latentred.elf
	arm-none-eabi-objcopy -O binary --only-section=.text --only-section=.data latentred.elf latentred.bin
	./imagesize.sh
