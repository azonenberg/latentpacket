/**
	@file	queuesim.cpp
	@author	Andrew D. Zonenberg
	@brief 	LATENTRED queue size simulator

	Sequential discrete event simulator running at an emulated 156.25 MHz with a 64-bit datapath.

	Assume store-and-forward switching, cut-through will use less buffer space so this is a worst-case model.
 */

#include <stdio.h>

#include <list>

using namespace std;

/**
	@brief A generic port that can respond to events
 */
class EventPort
{
public:
	virtual ~EventPort();
	virtual void Tick() =0;
};

/**
	@brief A packet generator
 */
class InputPort : public EventPort
{
public:
	InputPort(int queue_words;);
	virtual ~InputPort();

	virtual void Tick();
};

/**
	@brief A packet sink
 */
class OutputPort : public EventPort
{
public:
	OutputPort();
	virtual ~OutputPort();

	virtual void Tick();
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// EventPort

EventPort::~EventPort()
{

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// InputPort

InputPort::~InputPort()
{
}

void InputPort::Tick()
{
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OutputPort

OutputPort::~OutputPort()
{

}

void OutputPort::Tick()
{

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const int NUM_1G_PORTS = 24;
const int NUM_10G_PORTS = 4;
const int NUM_PORTS = NUM_1G_PORTS + NUM_10G_PORTS;
const int SEED = 0;

InputPort* g_ports[NUM_PORTS];
OutputPort* g_ports[NUM_PORTS];


int main(int argc, char* argv[])
{
	srandom();

	//Initialize

	return 0;
}
