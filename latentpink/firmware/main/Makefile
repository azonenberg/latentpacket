SRCDIR=$(CURDIR)
ROOTDIR=$(CURDIR)/../../../
CXXFLAGS=-g -O0 --std=c++17 \
	-I$(ROOTDIR) \
	-I$(SRCDIR) \
	-I$(ROOTDIR)/stm32-cpp/devices/inc \
	-I$(ROOTDIR)/stm32-cpp/src \
	-DMICROKVS_WRITE_BLOCK_SIZE=32 \
	-DTEST_BANK_SIZE=131072
CXX=g++

.ONESHELL:
.SILENT: sim
sim: CXXFLAGS += -DSIMULATION -DHAVE_TIM -lrt

sim:
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
