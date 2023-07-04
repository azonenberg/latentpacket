SRCDIR=$(CURDIR)
ROOTDIR=$(CURDIR)/../../../
CXXFLAGS=-g -O0 --std=c++17 -I$(ROOTDIR)
CXX=g++

.ONESHELL:
.SILENT: sim

sim:
	cd output/sim
	$(CXX) $(CXXFLAGS) -c $(SRCDIR)/target/sim/*.cpp
	$(CXX) $(CXXFLAGS) -c $(ROOTDIR)/embedded-cli/*.cpp
	$(CXX) $(CXXFLAGS) *.o -o simcli
