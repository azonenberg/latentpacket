SRCDIR=$(CURDIR)
ROOTDIR=$(CURDIR)/../../../
CXXFLAGS=-g -O2 --std=c++17 -mcpu=cortex-m0plus -DSTM32L031 -fno-exceptions -fno-rtti -g --specs=nano.specs \
	-I$(ROOTDIR) \
	-I$(SRCDIR) \
	-I$(ROOTDIR)/stm32-cpp/devices/inc \
	-I$(ROOTDIR)/stm32-cpp/src \
	-DMICROKVS_WRITE_BLOCK_SIZE=32 \
	-DTEST_BANK_SIZE=131072

CXX=arm-none-eabi-g++

.ONESHELL:
.SILENT: all
all:
	mkdir -p build
	cd build
	$(CXX) $(ROOTDIR)/stm32-cpp/src/cpu/*.S -c $(CXXFLAGS) || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/*.cpp || exit 1
	$(CXX) $(ROOTDIR)/stm32-cpp/src/newlib-stubs/*.cpp -c $(CXXFLAGS) || exit 1
	$(CXX) $(ROOTDIR)/stm32-cpp/src/peripheral/*.cpp -c $(CXXFLAGS) || exit 1
	$(CXX) $(ROOTDIR)/stm32-cpp/src/util/*.cpp -c $(CXXFLAGS) || exit 1
	$(CXX) $(ROOTDIR)/stm32-cpp/devices/src/stm32l031.cpp -c $(CXXFLAGS) || exit 1
	$(CXX) $(CXXFLAGS) *.o -Wl,-T $(ROOTDIR)/stm32-cpp/devices/link/stm32l031.ld -o ../firmware.elf
	cd ..
	arm-none-eabi-objcopy -O binary --only-section=.text --only-section=.data firmware.elf firmware.bin
	./imagesize.sh

.PHONY: clean
clean:
	rm build/*.o
