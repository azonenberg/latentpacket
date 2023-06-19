`timescale 1ns/1ps
`default_nettype none

module QDRSim();

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Simulated external oscillator

	logic	clk_125mhz_p = 1;
	logic	clk_125mhz_n = 0;

	always begin
		#4;
		clk_125mhz_p = !clk_125mhz_p;
		clk_125mhz_n = !clk_125mhz_n;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Clock synthesis

	wire clk_125mhz;
	wire clk_250mhz;
	wire clk_312p5mhz;
	wire clk_400mhz;
	wire clk_625mhz_0;
	wire clk_625mhz_90;

	wire pll_main_lock;

	wire clk_ram;
	wire clk_ram_ctl;
	wire clk_ram_90;

	wire pll_ram_lock;

	ClockGeneration clk_system(
		.clk_125mhz_p(clk_125mhz_p),
		.clk_125mhz_n(clk_125mhz_n),

		.clk_125mhz(clk_125mhz),
		.clk_250mhz(clk_250mhz),
		.clk_312p5mhz(clk_312p5mhz),
		.clk_400mhz(clk_400mhz),
		.clk_625mhz_0(clk_625mhz_0),
		.clk_625mhz_90(clk_625mhz_90),

		.pll_main_lock(pll_main_lock),

		.clk_ram(clk_ram),
		.clk_ram_ctl(clk_ram_ctl),
		.clk_ram_90(clk_ram_90),

		.pll_ram_lock(pll_ram_lock)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The RAM

	wire		qdr_dclk_p;
	wire		qdr_dclk_n;

	wire[17:0]	qdr_a;
	wire		qdr_rps_n;
	wire		qdr_wps_n;

	wire[3:0]	qdr_bws_n;

	wire[35:0]	qdr_d;

	wire		qdr_qclk_p;
	wire		qdr_qclk_n;
	wire		qdr_qvld;
	wire[35:0]	qdr_q;

	cyqdr2_b4 ram(

		//JTAG
		.TCK(1'b0),
		.TMS(1'b0),
		.TDI(1'b0),
		.TDO(),

		//Mode straps
		.ODT(1'b1),
		.DOFF(1'b1),

		//Impedance control resistor (ignored except for boundary scan)
		.ZQ(1'b0),

		//Command/address bus
		.K(qdr_dclk_p),
		.Kb(qdr_dclk_n),
		.A(qdr_a),
		.RPSb(qdr_rps_n),
		.WPSb(qdr_wps_n),

		//Write data bus
		.BWS0b(qdr_bws_n[0]),
		.BWS1b(qdr_bws_n[1]),
		.BWS2b(qdr_bws_n[2]),
		.BWS3b(qdr_bws_n[3]),
		.D(qdr_d),

		//Read data bus
		.CQ(qdr_qclk_p),
		.CQb(qdr_qclk_n),

		.QVLD(qdr_qvld),
		.Q(qdr_q)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// RAM controller

	logic			ram_rd_en	= 0;
	logic[17:0]		ram_rd_addr	= 0;
	wire			ram_rd_valid;
	wire[143:0]		ram_rd_data;
	logic			ram_wr_en	= 0;
	logic[17:0]		ram_wr_addr	= 0;
	logic[143:0]	ram_wr_data	= 0;

	wire			qdr_pll_lock;

	QDR2PController #(
		.RAM_WIDTH(36),
		.ADDR_BITS(18)
	) ctrl (
		.clk_ctl(clk_ram_ctl),
		.clk_ram(clk_ram),
		.clk_ram_90(clk_ram_90),

		.rd_en(ram_rd_en),
		.rd_addr(ram_rd_addr),
		.rd_valid(ram_rd_valid),
		.rd_data(ram_rd_data),
		.wr_en(ram_wr_en),
		.wr_addr(ram_wr_addr),
		.wr_data(ram_wr_data),
		.pll_lock(qdr_pll_lock),

		.qdr_d(qdr_d),
		.qdr_q(qdr_q),
		.qdr_a(qdr_a),
		.qdr_wps_n(qdr_wps_n),
		.qdr_bws_n(qdr_bws_n),
		.qdr_rps_n(qdr_rps_n),
		.qdr_qvld(qdr_qvld),
		.qdr_dclk_p(qdr_dclk_p),
		.qdr_dclk_n(qdr_dclk_n),
		.qdr_qclk_p(qdr_qclk_p),
		.qdr_qclk_n(qdr_qclk_n)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Test state machine logic

	logic[7:0] state = 0;

	always_ff @(posedge clk_ram_ctl) begin

		ram_rd_en	<= 0;
		ram_rd_addr	<= 0;
		ram_wr_en	<= 0;
		ram_wr_addr	<= 0;
		ram_wr_data	<= 0;

		case(state)

			//Write a single value
			0: begin

				if(qdr_pll_lock) begin

					$display("Single write");

					ram_wr_en	<= 1;
					ram_wr_addr	<= 18'h0beef;
					ram_wr_data	<= 144'h0_deadbeef_1_baadc0de_2_feedface_3_c0def00d;

					state		<= 1;
				end

			end

			//Wait a while

			//Read it back
			1: begin
				$display("Single read");
				ram_rd_en	<= 1;
				ram_rd_addr	<= 18'h0beef;

				state		<= 2;
			end

			//Wait for read to complete
			2: begin
				if(ram_rd_valid) begin
					if(ram_rd_data != 144'h0_deadbeef_1_baadc0de_2_feedface_3_c0def00d) begin
						$display("FAIL: Read data mismatch");
						$finish;
					end
					else begin
						$display("Read data OK");
						state	<= 3;
					end
				end
			end

			//Two back to back write bursts
			3: begin
				$display("Dual write");

				ram_wr_en	<= 1;
				ram_wr_addr	<= 18'h0feed;
				ram_wr_data	<= 144'ha_41414141_b_69696969_c_cccccccc_d_cd80cd80;
				state		<= 4;
			end
			4: begin
				ram_wr_en	<= 1;
				ram_wr_addr	<= 18'h0face;
				ram_wr_data	<= 144'he_eeeeeeee_f_ffffffff_0_00000000_1_11111111;
				state		<= 5;
			end

			//Two back to back read bursts
			5: begin
				$display("Dual read");

				ram_rd_en	<= 1;
				ram_rd_addr	<= 18'h0feed;
				state		<= 6;
			end
			6: begin
				ram_rd_en	<= 1;
				ram_rd_addr	<= 18'h0face;
				state		<= 7;
			end

			//Verify dual read
			7: begin
				if(ram_rd_valid) begin
					if(ram_rd_data != 144'ha_41414141_b_69696969_c_cccccccc_d_cd80cd80) begin
						$display("FAIL: Read data mismatch");
						$finish;
					end
					else begin
						$display("Read data OK");
						state	<= 8;
					end
				end
			end
			8: begin
				if(ram_rd_valid) begin
					if(ram_rd_data != 144'he_eeeeeeee_f_ffffffff_0_00000000_1_11111111) begin
						$display("FAIL: Read data mismatch");
						$finish;
					end
					else begin
						$display("Read data OK");
						state	<= 9;
					end
				end
			end

			//xxx
			9: begin
			end

		endcase

	end

endmodule
