SRCDIR=$(CURDIR)
ROOTDIR=$(CURDIR)/../../../
CXXFLAGS=-g -O0 --std=c++17 \
	-I$(ROOTDIR) \
	-I$(SRCDIR) \
	-I$(ROOTDIR)/stm32-cpp/devices/inc \
	-I$(ROOTDIR)/stm32-cpp/src \
	-DMICROKVS_WRITE_BLOCK_SIZE=32 \
	-DTEST_BANK_SIZE=131072

.ONESHELL:
.SILENT: sim device
sim: CXX=g++
sim: CXXFLAGS += -DSIMULATION -DHAVE_TIM -lrt

sim:
	mkdir -p output/sim
	cd output/sim
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/target/sim/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/init/CommonInit.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/init/SimInit.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/misc/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/cli/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/net/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/stm32-cpp/src/util/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/microkvs/kvs/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/microkvs/driver/TestStorageBank.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/embedded-cli/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/cli/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/contrib/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/crypt/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/drivers/base/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/drivers/tap/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/arp/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/ethernet/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/icmpv4/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/ipv4/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/tcp/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/ssh/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) *.o -lcrypto++ -o simcli || exit 1

# Actual on-device firmware
device: CXX=arm-none-eabi-g++
device: CXXFLAGS += -DSTM32H735 -fno-rtti -fno-exceptions --specs nano.specs -mcpu=cortex-m7

device:
	mkdir -p output/device
	cd output/device
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/target/device/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/init/CommonInit.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/init/DeviceInit.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/misc/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/cli/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/net/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/microkvs/kvs/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/microkvs/driver/STM32StorageBank.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/embedded-cli/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/cli/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/contrib/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/crypt/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/drivers/base/*.cpp || exit 1
	#$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/drivers/tap/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/arp/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/ethernet/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/icmpv4/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/ipv4/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/net/tcp/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/staticnet/ssh/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/stm32-cpp/src/cpu/*.S || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/stm32-cpp/src/util/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/stm32-cpp/src/newlib-stubs/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/stm32-cpp/src/peripheral/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/stm32-cpp/src/util/*.cpp || exit 1
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/stm32-cpp/devices/src/stm32h735.cpp || exit 1
	$(CXX) $(CXXFLAGS) *.o -Wl,-T $(ROOTDIR)/stm32-cpp/devices/link/stm32h735.ld -o ../../firmware.elf
	cd ../../
	arm-none-eabi-objcopy -O binary --only-section=.text --only-section=.data firmware.elf firmware.bin
	./imagesize.sh
