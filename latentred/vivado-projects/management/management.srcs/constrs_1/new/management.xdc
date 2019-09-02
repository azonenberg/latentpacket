set_property IOSTANDARD LVCMOS33 [get_ports uart_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_txd]
set_property PACKAGE_PIN M14 [get_ports uart_rxd]
set_property PACKAGE_PIN M6 [get_ports uart_txd]
set_property PACKAGE_PIN E12 [get_ports clk_25mhz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_25mhz]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN H12 [get_ports {led[3]}]
set_property PACKAGE_PIN H13 [get_ports {led[2]}]
set_property PACKAGE_PIN J16 [get_ports {led[1]}]
set_property PACKAGE_PIN J15 [get_ports {led[0]}]

create_clock -period 40.000 -name clk_25mhz -waveform {0.000 20.000} [get_ports clk_25mhz]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

set_property PACKAGE_PIN C8 [get_ports ltc_vtemp]
set_property IOSTANDARD LVCMOS33 [get_ports ltc_vtemp]

set_property IOSTANDARD LVCMOS33 [get_ports spi_miso]
set_property PACKAGE_PIN P10 [get_ports spi_miso]
set_property IOSTANDARD LVCMOS33 [get_ports spi_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports spi_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports spi_sck]
set_property PACKAGE_PIN N16 [get_ports spi_cs_n]
set_property PACKAGE_PIN M12 [get_ports spi_mosi]
set_property PACKAGE_PIN M16 [get_ports spi_sck]

set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_rxd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_rxd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_rxd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_rxd[0]}]
set_property PACKAGE_PIN R8 [get_ports {rgmii_rxd[3]}]
set_property PACKAGE_PIN T7 [get_ports {rgmii_rxd[1]}]
set_property PACKAGE_PIN R7 [get_ports {rgmii_rxd[2]}]
set_property PACKAGE_PIN N6 [get_ports {rgmii_rxd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_txd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_txd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_txd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_txd[0]}]
set_property PACKAGE_PIN P9 [get_ports {rgmii_txd[3]}]
set_property PACKAGE_PIN T9 [get_ports {rgmii_txd[2]}]
set_property PACKAGE_PIN T10 [get_ports {rgmii_txd[1]}]
set_property PACKAGE_PIN R10 [get_ports {rgmii_txd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports rgmii_rxc]
set_property IOSTANDARD LVCMOS33 [get_ports rgmii_rx_ctl]
set_property IOSTANDARD LVCMOS33 [get_ports rgmii_tx_ctl]
set_property IOSTANDARD LVCMOS33 [get_ports rgmii_txc]
set_property PACKAGE_PIN P6 [get_ports rgmii_rx_ctl]
set_property PACKAGE_PIN N11 [get_ports rgmii_rxc]
set_property PACKAGE_PIN T8 [get_ports rgmii_tx_ctl]
set_property PACKAGE_PIN P8 [get_ports rgmii_txc]

set_property IOSTANDARD LVCMOS33 [get_ports {eth_led_n_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_led_n_in[0]}]
set_property PACKAGE_PIN R11 [get_ports {eth_led_n_in[0]}]
set_property PACKAGE_PIN P11 [get_ports {eth_led_n_in[1]}]
set_property PACKAGE_PIN R6 [get_ports rgmii_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rgmii_rst_n]

set_property IOSTANDARD LVCMOS33 [get_ports {flash_dq[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {flash_dq[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {flash_dq[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {flash_dq[0]}]
set_property PACKAGE_PIN K16 [get_ports {flash_dq[3]}]
set_property PACKAGE_PIN K15 [get_ports {flash_dq[2]}]
set_property PACKAGE_PIN J14 [get_ports {flash_dq[1]}]
set_property PACKAGE_PIN J13 [get_ports {flash_dq[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports flash_cs_n]
set_property PACKAGE_PIN L12 [get_ports flash_cs_n]

create_clock -period 8.000 -name rgmii_rxc -waveform {0.000 4.000} [get_ports rgmii_rxc]
create_generated_clock -name clk_100mhz -source [get_pins pll/mmcm/CLKIN1] -master_clock clk_25mhz [get_pins pll/mmcm/CLKOUT0]
create_generated_clock -name clk_125mhz -source [get_pins pll/mmcm/CLKIN1] -master_clock clk_25mhz [get_pins pll/mmcm/CLKOUT1]
create_generated_clock -name clk_250mhz -source [get_pins pll/mmcm/CLKIN1] -master_clock clk_25mhz [get_pins pll/mmcm/CLKOUT2]
create_generated_clock -name clk_200mhz -source [get_pins pll/mmcm/CLKIN1] -master_clock clk_25mhz [get_pins pll/mmcm/CLKOUT3]
set_clock_groups -asynchronous -group [get_clocks rgmii_rxc] -group [get_clocks clk_100mhz]
set_clock_groups -asynchronous -group [get_clocks rgmii_rxc] -group [get_clocks clk_125mhz]
set_clock_groups -asynchronous -group [get_clocks clk_125mhz] -group [get_clocks rgmii_rxc]

create_clock -period 10.000 -name VIRTUAL_clk_100mhz -waveform {0.000 5.000}

create_generated_clock -name flash_sck -source [get_pins {pll/clkbufs[0].output_buf/clkout[0]}] -divide_by 4 [get_nets flash/flash_sck]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_25mhz_IBUF_BUFG]
