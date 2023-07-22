`timescale 1ns/1ps
`default_nettype none
/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2023 Andrew D. Zonenberg and contributors                                                              *
* All rights reserved.                                                                                                 *
*                                                                                                                      *
* Redistribution and use in source and binary forms, with or without modification, are permitted provided that the     *
* following conditions are met:                                                                                        *
*                                                                                                                      *
*    * Redistributions of source code must retain the above copyright notice, this list of conditions, and the         *
*      following disclaimer.                                                                                           *
*                                                                                                                      *
*    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the       *
*      following disclaimer in the documentation and/or other materials provided with the distribution.                *
*                                                                                                                      *
*    * Neither the name of the author nor the names of any contributors may be used to endorse or promote products     *
*      derived from this software without specific prior written permission.                                           *
*                                                                                                                      *
* THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   *
* TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL *
* THE AUTHORS BE HELD LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES        *
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR       *
* BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT *
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE       *
* POSSIBILITY OF SUCH DAMAGE.                                                                                          *
*                                                                                                                      *
***********************************************************************************************************************/

`include "EthernetBus.svh"

/**
	@file
	@author Andrew D. Zonenberg
	@brief Container for management logic

	Management registers have 16-bit addresses and are 8 bits in size.
 */
module ManagementRegisterInterface #(
	parameter NUM_PORTS						= 15
)(

	//Core clock for the management domain
	input wire						clk,

	//Data bus from QSPI interface or simulation bridge
	input wire						rd_en,
	input wire[15:0]				rd_addr,
	output logic					rd_valid	= 0,
	output logic[7:0]				rd_data		= 0,

	input wire						wr_en,
	input wire[15:0]				wr_addr,
	input wire[7:0]					wr_data,

	//Device information bus
	//Must be divided down from core clock, but phase aligned
	input wire						die_serial_valid,
	input wire[63:0]				die_serial,
	input wire						idcode_valid,
	input wire[31:0]				idcode,

	//Configuration registers in port RX clock domains
	input wire[NUM_PORTS-1:0]		port_rx_clk,
	output vlan_t[NUM_PORTS-1:0]	port_rx_vlan,
	output wire[NUM_PORTS-1:0]		port_rx_tagged_allowed,
	output wire[NUM_PORTS-1:0]		port_rx_untagged_allowed,

	//Configuration registers in core clock domain
	output vlan_t[NUM_PORTS-1:0]	port_vlan		= 0,
	output logic[NUM_PORTS-1:0]		port_is_trunk	= 0,
	input wire[15:0]				fan0_rpm,
	input wire[15:0]				fan1_rpm,
	input wire[15:0]				die_temp,
	input wire[15:0]				volt_core,
	input wire[15:0]				volt_ram,
	input wire[15:0]				volt_aux,
	output logic					mbist_start	= 0,
	output logic[31:0]				mbist_seed	= 0,
	input wire						mbist_done,
	input wire						mbist_fail,
	input wire[17:0]				mbist_fail_addr,
	output logic					mbist_select = 0,
	input wire						mgmt0_mdio_busy,
	output logic[4:0]				mgmt0_phy_reg_addr = 0,
	output logic[15:0]				mgmt0_phy_wr_data = 0,
	input wire[15:0]				mgmt0_phy_rd_data,
	output logic					mgmt0_phy_reg_wr = 0,
	output logic					mgmt0_phy_reg_rd = 0,
	output logic[4:0]				mgmt0_phy_md_addr = 0,
	input wire						dp_mdio_busy,
	output logic[4:0]				dp_phy_reg_addr = 0,
	output logic[15:0]				dp_phy_wr_data = 0,
	input wire[15:0]				dp_phy_rd_data,
	output logic					dp_phy_reg_wr = 0,
	output logic					dp_phy_reg_rd = 0,
	output logic[4:0]				dp_phy_md_addr = 0,
	input wire						vsc_mdio_busy,
	output logic[4:0]				vsc_phy_reg_addr = 0,
	output logic[15:0]				vsc_phy_wr_data = 0,
	input wire[15:0]				vsc_phy_rd_data,
	output logic					vsc_phy_reg_wr = 0,
	output logic					vsc_phy_reg_rd = 0,
	output logic[4:0]				vsc_phy_md_addr = 0,

	//Configuration registers in crypto clock domain
	input wire						clk_crypt,
	output logic					crypt_en = 0,
	output wire[255:0]				crypt_work_in,
	output wire[255:0]				crypt_e,
	input wire						crypt_out_valid,
	input wire[255:0]				crypt_work_out
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synchronizers for crypto stuff

	logic			crypt_in_updated	= 0;
	logic[255:0]	crypt_work_in_mgmt	= 0;
	logic[255:0]	crypt_e_mgmt		= 0;

	//Ignore toggles on updated_b for first few clocks after reset
	//seems sync glitches, at least in sim?
	wire			crypt_en_sync;
	logic[3:0]		rst_count 			= 1;
	always_ff @(posedge clk_crypt) begin
		if(rst_count)
			rst_count	<= rst_count + 1;
		else
			crypt_en	<= crypt_en_sync;
	end

	RegisterSynchronizer #(
		.WIDTH(512)
	) sync_crypt_inputs (
		.clk_a(clk),
		.en_a(crypt_in_updated),
		.ack_a(),
		.reg_a({crypt_work_in_mgmt, crypt_e_mgmt}),

		.clk_b(clk_crypt),
		.updated_b(crypt_en_sync),
		.reset_b(1'b0),
		.reg_b({crypt_work_in, crypt_e})
	);

	wire			crypt_out_updated;
	wire[255:0]		crypt_work_out_mgmt;

	RegisterSynchronizer #(
		.WIDTH(256)
	) sync_crypt_outputs (
		.clk_a(clk_crypt),
		.en_a(crypt_out_valid),
		.ack_a(),
		.reg_a(crypt_work_out),

		.clk_b(clk),
		.updated_b(crypt_out_updated),
		.reset_b(1'b0),
		.reg_b(crypt_work_out_mgmt)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synchronizers for per-port configuration registers

	logic[NUM_PORTS-1:0]	port_vlan_updated	= 0;

	logic[NUM_PORTS-1:0]	port_tagged_allowed		= 0;
	logic[NUM_PORTS-1:0]	port_untagged_allowed	= 0;
	logic[NUM_PORTS-1:0]	port_tagmode_updated	= 0;

	initial begin
		for(integer i=0; i<NUM_PORTS; i=i+1) begin
			port_vlan[i]	= 0;
		end
	end

	for(genvar g=0; g<NUM_PORTS; g=g+1) begin : portsyncs

		RegisterSynchronizer #(
			.WIDTH($bits(vlan_t))
		) sync_rx_vlan (
			.clk_a(clk),
			.en_a(port_vlan_updated[g]),
			.ack_a(),
			.reg_a(port_vlan[g]),

			.clk_b(port_rx_clk[g]),
			.updated_b(),
			.reset_b(1'b0),
			.reg_b(port_rx_vlan[g])
		);

		//TODO: TX vlan stuff

		RegisterSynchronizer #(
			.WIDTH(1)
		) sync_rx_tagged_allowed (
			.clk_a(clk),
			.en_a(port_tagmode_updated[g]),
			.ack_a(),
			.reg_a(port_tagged_allowed[g]),

			.clk_b(port_rx_clk[g]),
			.updated_b(),
			.reset_b(1'b0),
			.reg_b(port_rx_tagged_allowed[g])
		);

		RegisterSynchronizer #(
			.WIDTH(1)
		) sync_rx_untagged_allowed (
			.clk_a(clk),
			.en_a(port_tagmode_updated[g]),
			.ack_a(),
			.reg_a(port_untagged_allowed[g]),

			.clk_b(port_rx_clk[g]),
			.updated_b(),
			.reset_b(1'b0),
			.reg_b(port_rx_untagged_allowed[g])
		);

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// List of named registers

	//Note that ManagementBridge uses MSB of address as read/write flag
	//so we actually have only 15 bits available for addressing

	//must match ManagementRegisterInterface in FPGAInterface.h
	typedef enum logic[15:0]
	{
		//FPGA die information
		REG_FPGA_IDCODE		= 16'h0000,		//4 bytes of IDCODE
		REG_FPGA_IDCODE_1	= 16'h0001,
		REG_FPGA_IDCODE_2	= 16'h0002,
		REG_FPGA_IDCODE_3	= 16'h0003,
		REG_FPGA_SERIAL		= 16'h0004,		//8 bytes of die serial
		REG_FPGA_SERIAL_1	= 16'h0005,
		REG_FPGA_SERIAL_2	= 16'h0006,
		REG_FPGA_SERIAL_3	= 16'h0007,
		REG_FPGA_SERIAL_4	= 16'h0008,
		REG_FPGA_SERIAL_5	= 16'h0009,
		REG_FPGA_SERIAL_6	= 16'h000a,
		REG_FPGA_SERIAL_7	= 16'h000b,

		//Sensors
		REG_FAN0_RPM		= 16'h0010,
		REG_FAN0_RPM_1		= 16'h0011,
		REG_FAN1_RPM		= 16'h0012,
		REG_FAN1_RPM_1		= 16'h0013,
		REG_DIE_TEMP		= 16'h0014,
		REG_DIE_TEMP_1		= 16'h0015,
		REG_VOLT_CORE		= 16'h0016,
		REG_VOLT_CORE_1		= 16'h0017,
		REG_VOLT_RAM		= 16'h0018,
		REG_VOLT_RAM_1		= 16'h0019,
		REG_VOLT_AUX		= 16'h001a,
		REG_VOLT_AUX_1		= 16'h001b,

		//Reasons for an IRQ
		REG_IRQ_STAT		= 16'h0020,		//TODO: put stuff here

		//RAM BIST
		REG_MBIST			= 16'h0040,		//31 = test enable flag (RW)
		REG_MBIST_1			= 16'h0041,		//30 = test start flag (W)
		REG_MBIST_2			= 16'h0042,		//29 = done flag (R)
		REG_MBIST_3			= 16'h0043,		//28 = fail flag (R)
											//17:0 = fail address (R)

		REG_MBIST_SEED		= 16'h0044,
		REG_MBIST_SEED_1	= 16'h0045,
		REG_MBIST_SEED_2	= 16'h0046,
		REG_MBIST_SEED_3	= 16'h0047,

		//MDIO controllers
		REG_MGMT0_MDIO		= 16'h0048,		//31    = busy flag (R)
		REG_MGMT0_MDIO_1	= 16'h0049,		//30    = write enable (W)
		REG_MGMT0_MDIO_2	= 16'h004a,		//29    = read enable (W)
		REG_MGMT0_MDIO_3	= 16'h004b,		//25:21 = phy addr (W)
											//20:16 = register addr (W)
											//15:0	= register data (RW)

		REG_DP_MDIO			= 16'h004c,
		REG_DP_MDIO_1		= 16'h004d,
		REG_DP_MDIO_2		= 16'h004e,
		REG_DP_MDIO_3		= 16'h004f,

		REG_VSC_MDIO		= 16'h0050,
		REG_VSC_MDIO_1		= 16'h0051,
		REG_VSC_MDIO_2		= 16'h0052,
		REG_VSC_MDIO_3		= 16'h0053,

		//Crypto accelerator
		REG_CRYPT_BASE		= 16'h3800,

		//Per port configuration starts here
		REG_INTERFACE_BASE	= 16'h4000,

		//helper just so we can use commas to separate list items
		REG_LAST

	} regid_t;

	//Amount of register address space allocated to each port
	localparam INTERFACE_STRIDE	= 16'h0400;

	//Register offsets within each interface block
	typedef enum logic[15:0]
	{
		REG_VLAN_NUM		= 16'h0000,		//VLAN number
		REG_VLAN_NUM_1		= 16'h0001,
		REG_TAG_MODE		= 16'h0002,		//[0] = inbound tagged traffic allowed
											//[1] = inbound untagged traffic allowed
											//[2] = tag outbound traffic to native vlan
											//[3] = tag outbound traffic to other vlans
											//[4] = port should be considered a trunk for forwarding decisions

		//TODO

		REG_IF_LAST
	} ifoff_t;

	//Register offsets within crypto block
	typedef enum logic[15:0]
	{
		REG_WORK			= 16'h0000,
		REG_E				= 16'h0020,
		REG_CRYPT_STATUS	= 16'h0040,
		REG_WORK_OUT		= 16'h0060
	} cryptoff_t;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Address decoding and muxing logic

	logic 					reading			= 0;
	logic					crypto_active	= 0;

	//Split interface config into port number and register ID
	localparam PORT_BITS 				= 4;
	localparam REGID_BITS				= 10;
	logic[PORT_BITS-1:0]	rd_port		= 0;
	logic[REGID_BITS-1:0]	rd_regid	= 0;

	logic[PORT_BITS-1:0]	wr_port		= 0;
	logic[REGID_BITS-1:0]	wr_regid	= 0;

	always_ff @(posedge clk) begin

		//Clear single cycle flags
		rd_valid				<= 0;
		port_vlan_updated		<= 0;
		port_tagmode_updated	<= 0;
		crypt_in_updated		<= 0;
		mbist_start				<= 0;
		mgmt0_phy_reg_wr		<= 0;
		mgmt0_phy_reg_rd		<= 0;
		dp_phy_reg_wr			<= 0;
		dp_phy_reg_rd			<= 0;
		vsc_phy_reg_wr			<= 0;
		vsc_phy_reg_rd			<= 0;

		//Start a new read
		if(rd_en)
			reading	<= 1;

		//Finish a crypto operation
		if(crypt_out_updated)
			crypto_active		<= 0;

		//Continue a read
		if(rd_en || reading) begin

			//Interface registers are decoded separately
			if(rd_addr >= REG_INTERFACE_BASE) begin

				//Extract port number and register ID
				rd_port	= rd_addr[REGID_BITS +: PORT_BITS];
				rd_regid = rd_addr[0 +: REGID_BITS];

				//All OK if we get here
				rd_valid	<= 1;
				reading		<= 0;

				//Note that multi byte registers are little endian for easier access from ARM (and x86 simulation) hosts

			end

			//Data not ready? Wait
			else if( (rd_addr >= REG_FPGA_IDCODE) && (rd_addr <= REG_FPGA_IDCODE_3) && !idcode_valid) begin
			end
			else if( (rd_addr >= REG_FPGA_SERIAL) && (rd_addr <= REG_FPGA_SERIAL_7) && !die_serial_valid) begin
			end

			//Data is ready
			else begin

				rd_valid	<= 1;
				reading		<= 0;

			end

			//Crypto registers are decoded separately
			if(rd_addr >= REG_CRYPT_BASE) begin

				if(rd_addr[7:0] == REG_CRYPT_STATUS)
					rd_data	<= {7'b0, crypto_active};
				else if(rd_addr[7:0] >= REG_WORK_OUT)
					rd_data <= crypt_work_out_mgmt[rd_addr[4:0]*8 +: 8];

				//unmapped address
				else
					rd_data	<= 0;

			end

			//Interface registers are decoded separately
			else if(rd_addr >= REG_INTERFACE_BASE) begin

				//TODO: actually implement readback
				rd_data	<= 0;

			end

			//Main register decoder
			else begin

				case(rd_addr)

					REG_FPGA_IDCODE:	rd_data <= idcode[3*8 +: 8];
					REG_FPGA_IDCODE_1:	rd_data <= idcode[2*8 +: 8];
					REG_FPGA_IDCODE_2:	rd_data <= idcode[1*8 +: 8];
					REG_FPGA_IDCODE_3:	rd_data <= idcode[0*8 +: 8];

					REG_FPGA_SERIAL:	rd_data <= die_serial[7*8 +: 8];
					REG_FPGA_SERIAL_1:	rd_data <= die_serial[6*8 +: 8];
					REG_FPGA_SERIAL_2:	rd_data <= die_serial[5*8 +: 8];
					REG_FPGA_SERIAL_3:	rd_data <= die_serial[4*8 +: 8];
					REG_FPGA_SERIAL_4:	rd_data <= die_serial[3*8 +: 8];
					REG_FPGA_SERIAL_5:	rd_data <= die_serial[2*8 +: 8];
					REG_FPGA_SERIAL_6:	rd_data <= die_serial[1*8 +: 8];
					REG_FPGA_SERIAL_7:	rd_data <= die_serial[0*8 +: 8];

					REG_FAN0_RPM:		rd_data	<= fan0_rpm[7:0];
					REG_FAN0_RPM_1:		rd_data	<= fan0_rpm[15:8];
					REG_FAN1_RPM:		rd_data	<= fan1_rpm[7:0];
					REG_FAN1_RPM_1:		rd_data	<= fan1_rpm[15:8];

					REG_DIE_TEMP:		rd_data	<= die_temp[7:0];
					REG_DIE_TEMP_1:		rd_data	<= die_temp[15:8];
					REG_VOLT_CORE:		rd_data	<= volt_core[7:0];
					REG_VOLT_CORE_1:	rd_data	<= volt_core[15:8];
					REG_VOLT_RAM:		rd_data	<= volt_ram[7:0];
					REG_VOLT_RAM_1:		rd_data	<= volt_ram[15:8];
					REG_VOLT_AUX:		rd_data	<= volt_aux[7:0];
					REG_VOLT_AUX_1:		rd_data	<= volt_aux[15:8];

					REG_MBIST:			rd_data	<= mbist_fail_addr[7:0];
					REG_MBIST_1:		rd_data	<= mbist_fail_addr[15:8];
					REG_MBIST_2:		rd_data	<= { 6'b0, mbist_fail_addr[17:15] };
					REG_MBIST_3:		rd_data	<= { mbist_select, 1'b0, mbist_done, mbist_fail, 4'b0 };

					REG_MGMT0_MDIO:		rd_data	<= mgmt0_phy_rd_data[7:0];
					REG_MGMT0_MDIO_1:	rd_data	<= mgmt0_phy_rd_data[15:8];
					REG_MGMT0_MDIO_2:	rd_data	<= 0;
					REG_MGMT0_MDIO_3:	rd_data <= {mgmt0_mdio_busy, 7'b0};

					REG_DP_MDIO:		rd_data	<= dp_phy_rd_data[7:0];
					REG_DP_MDIO_1:		rd_data	<= dp_phy_rd_data[15:8];
					REG_DP_MDIO_2:		rd_data	<= 0;
					REG_DP_MDIO_3:		rd_data <= {dp_mdio_busy, 7'b0};

					REG_VSC_MDIO:		rd_data	<= vsc_phy_rd_data[7:0];
					REG_VSC_MDIO_1:		rd_data	<= vsc_phy_rd_data[15:8];
					REG_VSC_MDIO_2:		rd_data	<= 0;
					REG_VSC_MDIO_3:		rd_data <= {vsc_mdio_busy, 7'b0};

					default: begin
						rd_data	<= 0;
					end

				endcase

			end

		end

		//Execute a write
		if(wr_en) begin

			//Extract port number and register ID
			wr_port	= wr_addr[REGID_BITS +: PORT_BITS];
			wr_regid = wr_addr[0 +: REGID_BITS];

			//Interface registers are decoded separately
			if(wr_addr >= REG_INTERFACE_BASE) begin

				//Note that multi byte registers are little endian for easier access from ARM (and x86 simulation) hosts
				case(wr_regid)

					REG_VLAN_NUM:	port_vlan[wr_port][7:0]	<= wr_data;
					REG_VLAN_NUM_1: begin
						port_vlan[wr_port][11:8]		<= wr_data[3:0];
						port_vlan_updated[wr_port]		<= 1;
					end

					REG_TAG_MODE: begin
						port_tagged_allowed[wr_port]	<= wr_data[0];
						port_untagged_allowed[wr_port]	<= wr_data[1];
						port_tagmode_updated[wr_port]	<= 1;

						port_is_trunk[wr_port]			<= wr_data[4];
					end

				endcase

			end

			//Crypto accelerator registers are decoded separately
			else if(wr_addr >= REG_CRYPT_BASE) begin

				//E register
				if(wr_addr[7:0] >= REG_E) begin
					crypt_e_mgmt[wr_addr[4:0]*8 +: 8]	<= wr_data;

					if(wr_addr[4:0] == 5'h1f) begin
						crypt_in_updated				<= 1;
						crypto_active					<= 1;
					end

				end

				//work_in register
				else /*if(wr_addr[7:0] >= REG_WORK)*/ begin
					crypt_work_in_mgmt[wr_addr[4:0]*8 +: 8]	<= wr_data;
				end

			end

			else begin

				case(wr_addr[7:0])

					//Memory BIST control
					REG_MBIST_3: begin
						mbist_select			<= wr_data[7];
						mbist_start				<= wr_data[6];
					end

					REG_MBIST_SEED:		mbist_seed[7:0]			<= wr_data;
					REG_MBIST_SEED_1:	mbist_seed[15:8]		<= wr_data;
					REG_MBIST_SEED_2:	mbist_seed[23:16]		<= wr_data;
					REG_MBIST_SEED_3:	mbist_seed[31:24]		<= wr_data;

					REG_MGMT0_MDIO:		mgmt0_phy_wr_data[7:0]	<= wr_data;
					REG_MGMT0_MDIO_1:	mgmt0_phy_wr_data[15:8]	<= wr_data;
					REG_MGMT0_MDIO_2: begin
						mgmt0_phy_reg_addr		<= wr_data[4:0];
						mgmt0_phy_md_addr[3:0]	<= wr_data[7:5];
					end
					REG_MGMT0_MDIO_3: begin
						mgmt0_phy_md_addr[4]	<= wr_data[0];
						mgmt0_phy_reg_rd		<= wr_data[5];
						mgmt0_phy_reg_wr		<= wr_data[6];
					end

					REG_DP_MDIO:	dp_phy_wr_data[7:0]			<= wr_data;
					REG_DP_MDIO_1:	dp_phy_wr_data[15:8]		<= wr_data;
					REG_DP_MDIO_2: begin
						dp_phy_reg_addr			<= wr_data[4:0];
						dp_phy_md_addr[3:0]		<= wr_data[7:5];
					end
					REG_DP_MDIO_3: begin
						dp_phy_md_addr[4]		<= wr_data[0];
						dp_phy_reg_rd			<= wr_data[5];
						dp_phy_reg_wr			<= wr_data[6];
					end

					REG_VSC_MDIO:	vsc_phy_wr_data[7:0]		<= wr_data;
					REG_VSC_MDIO_1:	vsc_phy_wr_data[15:8]		<= wr_data;
					REG_VSC_MDIO_2: begin
						vsc_phy_reg_addr		<= wr_data[4:0];
						vsc_phy_md_addr[3:0]	<= wr_data[7:5];
					end
					REG_VSC_MDIO_3: begin
						vsc_phy_md_addr[4]		<= wr_data[0];
						vsc_phy_reg_rd			<= wr_data[5];
						vsc_phy_reg_wr			<= wr_data[6];
					end

				endcase

			end

		end

	end

endmodule
