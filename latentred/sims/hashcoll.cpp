/**
	@file	hashcoll.cpp
	@author Andrew D. Zonenberg
	@brief	Monte Carlo simulation of hash collisions in a MAC table
 */
#include <stdio.h>
#include <stdint.h>
#include <map>
#include <math.h>

using namespace std;

uint32_t rnum(uint32_t nbits)
{
	return random() % (1 << nbits);
}

int main(int argc, char* argv[])
{
	const uint32_t NUM_ITERATIONS	= 10000;	//number of times to simulate
	const uint32_t NUM_PORTS		= 24+4;
	const uint32_t MACS_PER_PORT	= 32;
	const uint32_t NUM_MACS 		= NUM_PORTS * MACS_PER_PORT;
	const uint32_t TABLE_ROWS		= 4096;	//depth of table, must be multiple of 1024 to efficiently use block ram
	const uint32_t TABLE_BITS		= log2(TABLE_ROWS);
	const uint32_t TABLE_SETS		= 4;	//level of associativity, should be power of 2
	const uint32_t TABLE_SIZE		= TABLE_ROWS * TABLE_SETS;
	const uint32_t SEED				= 0;
	const uint32_t NUM_4K_RAM		= (TABLE_ROWS/1024) * 2 * TABLE_SETS;	//Block RAMs are 36 bits x 1024 rows.
																			//We need to store {MAC, port, VLAN}
																			//Say 72 bits total so 2 BRAMs wide per set
	const uint32_t NUM_2K_RAM		= NUM_4K_RAM * 2;

	printf(
		"Simulation scenario (ran for %u iterations)\n"
		"    Seed   : %u\n"
		"    Switch : %u ports\n"
		"    Network: %u MACs per port (%u total)\n"
		"    Table  : %u rows, %u ways, %d total entries (%d 4KB BRAM / %d 2KB BRAM)\n\n",
		NUM_ITERATIONS,
		SEED,
		NUM_PORTS,
		MACS_PER_PORT, NUM_MACS,
		TABLE_ROWS, TABLE_SETS, TABLE_SIZE, NUM_4K_RAM, NUM_2K_RAM
		);

	uint32_t total_collisions		= 0;
	uint32_t rounds_with_collision	= 0;
	uint32_t bins_with_collision	= 0;

	srandom(SEED);

	for(uint32_t niter=0; niter < NUM_ITERATIONS; niter ++)
	{
		//map of hash to number of hits in the bin
		map<uint32_t, uint32_t> bins;

		//Simulate adding address to table
		for(uint32_t naddr=0; naddr < NUM_MACS; naddr ++)
		{
			uint32_t hash = rnum(TABLE_BITS);
			bins[hash] ++;
		}

		//Find the biggest bin and all overflows
		uint32_t biggest_bin_size = 0;
		for(auto it : bins)
		{
			uint32_t n = it.second;
			if(n > biggest_bin_size)
				biggest_bin_size = n;

			if(biggest_bin_size > TABLE_SETS)
			{
				total_collisions += it.second;
				bins_with_collision ++;
			}
		}

		if(biggest_bin_size > TABLE_SETS)
			rounds_with_collision ++;
	}

	printf("Iterations with collisions:       %u (%.0f %%)\n",
		rounds_with_collision, rounds_with_collision * 100.0f / NUM_ITERATIONS);
	printf("Average collisions per iteration: %.2f\n",
		total_collisions * 1.0f / NUM_ITERATIONS);
	printf("Average bins with colision:       %.2f (%.2f %%)\n",
		bins_with_collision * 1.0f / NUM_ITERATIONS, bins_with_collision * 100.0f / (NUM_ITERATIONS * TABLE_ROWS) );

	return 0;
};
