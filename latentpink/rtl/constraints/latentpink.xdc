set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks [list clk_125mhz_p clk_125mhz_raw]] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_rst_stat/dout0_reg \
          port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_rst_stat/dout0_reg \
          port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg \
          qdr/fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          qdr/fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          qdr/fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          qdr/fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          {qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg}]] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list {qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_rst_stat/dout0_reg \
          port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_rst_stat/dout0_reg \
          port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg \
          qdr/fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          qdr/fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          qdr/fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          qdr/fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          {qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg}]] -to [get_clocks [list clk_125mhz_p clk_125mhz_raw]] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks [list clk_125mhz_p clk_125mhz_raw]] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_rst_stat/dout0_reg \
          port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_rst_stat/dout0_reg \
          port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg]] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_rst_stat/dout0_reg \
          port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_rst_stat/dout0_reg \
          port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg]] -to [get_clocks [list clk_125mhz_p clk_125mhz_raw]] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks [list clk_125mhz_p clk_125mhz_raw]] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_rst_stat/dout0_reg \
          port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_rst_stat/dout0_reg \
          port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg]] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_rst_stat/dout0_reg \
          port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_rst_stat/dout0_reg \
          port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg]] -to [get_clocks [list clk_125mhz_p clk_125mhz_raw]] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks [list clk_125mhz_p clk_125mhz_raw]] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_rst_stat/dout0_reg \
          port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_rst_stat/dout0_reg \
          port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg]] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g12/bridge/sync_rst_stat/dout0_reg \
          port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          port_g13/bridge/sync_rst_stat/dout0_reg \
          port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg]] -to [get_clocks [list clk_125mhz_p clk_125mhz_raw]] 2.500
########################################################################################################################
# Pinout constraints

set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[35]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[34]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[33]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[32]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[31]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[30]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[29]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[28]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[27]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[26]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[25]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[24]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[23]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[22]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[21]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[20]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[19]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[18]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[17]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[16]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[15]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[14]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[13]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[12]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[11]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[10]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[9]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[8]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[7]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[6]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[5]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[4]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[3]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[2]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[1]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_d[0]}]
set_property PACKAGE_PIN D16 [get_ports {qdr_d[35]}]
set_property PACKAGE_PIN A15 [get_ports {qdr_d[34]}]
set_property PACKAGE_PIN C15 [get_ports {qdr_d[33]}]
set_property PACKAGE_PIN B15 [get_ports {qdr_d[32]}]
set_property PACKAGE_PIN B16 [get_ports {qdr_d[31]}]
set_property PACKAGE_PIN R16 [get_ports {qdr_d[30]}]
set_property PACKAGE_PIN AB16 [get_ports {qdr_d[28]}]
set_property PACKAGE_PIN AB17 [get_ports {qdr_d[27]}]
set_property PACKAGE_PIN B18 [get_ports {qdr_d[26]}]
set_property PACKAGE_PIN D17 [get_ports {qdr_d[25]}]
set_property PACKAGE_PIN D19 [get_ports {qdr_d[24]}]
set_property PACKAGE_PIN C13 [get_ports {qdr_d[23]}]
set_property PACKAGE_PIN T15 [get_ports {qdr_d[22]}]
set_property PACKAGE_PIN T19 [get_ports {qdr_d[21]}]
set_property PACKAGE_PIN W15 [get_ports {qdr_d[20]}]
set_property PACKAGE_PIN V15 [get_ports {qdr_d[29]}]
set_property PACKAGE_PIN AB20 [get_ports {qdr_d[19]}]
set_property PACKAGE_PIN Y18 [get_ports {qdr_d[18]}]
set_property PACKAGE_PIN AA18 [get_ports {qdr_d[17]}]
set_property PACKAGE_PIN Y19 [get_ports {qdr_d[16]}]
set_property PACKAGE_PIN W21 [get_ports {qdr_d[15]}]
set_property PACKAGE_PIN V14 [get_ports {qdr_d[14]}]
set_property PACKAGE_PIN T20 [get_ports {qdr_d[13]}]
set_property PACKAGE_PIN J16 [get_ports {qdr_d[12]}]
set_property PACKAGE_PIN E16 [get_ports {qdr_d[11]}]
set_property PACKAGE_PIN E17 [get_ports {qdr_d[10]}]
set_property PACKAGE_PIN B20 [get_ports {qdr_d[9]}]
set_property PACKAGE_PIN Y22 [get_ports {qdr_d[8]}]
set_property PACKAGE_PIN W22 [get_ports {qdr_d[7]}]
set_property PACKAGE_PIN U21 [get_ports {qdr_d[6]}]
set_property PACKAGE_PIN T21 [get_ports {qdr_d[5]}]
set_property PACKAGE_PIN G16 [get_ports {qdr_d[4]}]
set_property PACKAGE_PIN G15 [get_ports {qdr_d[3]}]
set_property PACKAGE_PIN C22 [get_ports {qdr_d[2]}]
set_property PACKAGE_PIN B21 [get_ports {qdr_d[1]}]
set_property PACKAGE_PIN A20 [get_ports {qdr_d[0]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[35]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[34]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[33]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[32]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[31]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[30]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[29]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[28]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[27]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[26]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[25]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[24]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[23]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[22]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[21]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[20]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[19]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[18]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[17]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[16]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[15]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[14]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[13]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[12]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[11]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[10]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[9]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[8]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[7]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[6]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[5]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[4]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[3]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[2]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[1]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_q[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[35]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[34]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[33]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[32]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[31]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[30]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[29]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[28]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[27]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[26]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[25]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[24]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[23]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[22]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[21]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[20]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[19]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[18]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[17]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[16]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[15]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[14]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[13]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[12]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[11]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[10]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[9]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[8]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[7]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[6]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[5]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[4]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[3]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[2]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {qdr_q[0]}]
set_property PACKAGE_PIN B13 [get_ports {qdr_q[35]}]
set_property PACKAGE_PIN A14 [get_ports {qdr_q[34]}]
set_property PACKAGE_PIN A13 [get_ports {qdr_q[33]}]

set_property PACKAGE_PIN A16 [get_ports {qdr_q[32]}]
set_property PACKAGE_PIN C14 [get_ports {qdr_q[31]}]
set_property PACKAGE_PIN U16 [get_ports {qdr_q[30]}]
set_property PACKAGE_PIN AA16 [get_ports {qdr_q[29]}]
set_property PACKAGE_PIN Y14 [get_ports {qdr_q[28]}]
set_property PACKAGE_PIN AB15 [get_ports {qdr_q[27]}]
set_property PACKAGE_PIN B22 [get_ports {qdr_q[26]}]
set_property PACKAGE_PIN B17 [get_ports {qdr_q[25]}]
set_property PACKAGE_PIN A18 [get_ports {qdr_q[24]}]
set_property PACKAGE_PIN E18 [get_ports {qdr_q[23]}]
set_property PACKAGE_PIN T16 [get_ports {qdr_q[22]}]

set_property PACKAGE_PIN U15 [get_ports {qdr_q[21]}]
set_property PACKAGE_PIN V19 [get_ports {qdr_q[20]}]
set_property PACKAGE_PIN W17 [get_ports {qdr_q[19]}]
set_property PACKAGE_PIN AB18 [get_ports {qdr_q[18]}]
set_property PACKAGE_PIN AB21 [get_ports {qdr_q[17]}]
set_property PACKAGE_PIN V20 [get_ports {qdr_q[16]}]
set_property PACKAGE_PIN V18 [get_ports {qdr_q[15]}]
set_property PACKAGE_PIN U18 [get_ports {qdr_q[14]}]
set_property PACKAGE_PIN U17 [get_ports {qdr_q[13]}]
set_property PACKAGE_PIN F16 [get_ports {qdr_q[12]}]
set_property PACKAGE_PIN E19 [get_ports {qdr_q[11]}]
set_property PACKAGE_PIN C19 [get_ports {qdr_q[10]}]
set_property PACKAGE_PIN A19 [get_ports {qdr_q[9]}]
set_property PACKAGE_PIN AA20 [get_ports {qdr_q[8]}]
set_property PACKAGE_PIN Y21 [get_ports {qdr_q[7]}]
set_property PACKAGE_PIN V22 [get_ports {qdr_q[6]}]
set_property PACKAGE_PIN U22 [get_ports {qdr_q[5]}]
set_property PACKAGE_PIN J17 [get_ports {qdr_q[4]}]
set_property PACKAGE_PIN F18 [get_ports {qdr_q[3]}]
set_property PACKAGE_PIN D22 [get_ports {qdr_q[2]}]
set_property PACKAGE_PIN D21 [get_ports {qdr_q[1]}]
set_property PACKAGE_PIN A21 [get_ports {qdr_q[0]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_bws_n[3]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_bws_n[2]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_bws_n[1]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_bws_n[0]}]
set_property PACKAGE_PIN W20 [get_ports {qdr_bws_n[3]}]
set_property PACKAGE_PIN AA19 [get_ports {qdr_bws_n[2]}]
set_property PACKAGE_PIN Y17 [get_ports {qdr_bws_n[1]}]
set_property PACKAGE_PIN W19 [get_ports {qdr_bws_n[0]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[20]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[19]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[18]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[17]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[16]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[15]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[14]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[13]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[12]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[11]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[10]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[9]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[8]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[7]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[6]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[5]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[4]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[3]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[2]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[1]}]
set_property IOSTANDARD SSTL18_I [get_ports {qdr_a[0]}]

set_property PACKAGE_PIN R22 [get_ports {qdr_a[20]}]
set_property PACKAGE_PIN M22 [get_ports {qdr_a[19]}]
set_property PACKAGE_PIN P21 [get_ports {qdr_a[18]}]

set_property PACKAGE_PIN G22 [get_ports {qdr_a[17]}]
set_property PACKAGE_PIN F21 [get_ports {qdr_a[16]}]
set_property PACKAGE_PIN E22 [get_ports {qdr_a[15]}]
set_property PACKAGE_PIN F20 [get_ports {qdr_a[14]}]
set_property PACKAGE_PIN E21 [get_ports {qdr_a[13]}]
set_property PACKAGE_PIN G21 [get_ports {qdr_a[12]}]
set_property PACKAGE_PIN H22 [get_ports {qdr_a[11]}]
set_property PACKAGE_PIN G20 [get_ports {qdr_a[10]}]
set_property PACKAGE_PIN J20 [get_ports {qdr_a[9]}]
set_property PACKAGE_PIN M21 [get_ports {qdr_a[8]}]
set_property PACKAGE_PIN J22 [get_ports {qdr_a[7]}]
set_property PACKAGE_PIN J21 [get_ports {qdr_a[6]}]
set_property PACKAGE_PIN K22 [get_ports {qdr_a[5]}]
set_property PACKAGE_PIN K21 [get_ports {qdr_a[4]}]
set_property PACKAGE_PIN L20 [get_ports {qdr_a[3]}]
set_property PACKAGE_PIN L21 [get_ports {qdr_a[2]}]
set_property PACKAGE_PIN N20 [get_ports {qdr_a[1]}]
set_property PACKAGE_PIN M20 [get_ports {qdr_a[0]}]
set_property IOSTANDARD SSTL18_I [get_ports i2c_derp_scl_device]
set_property IOSTANDARD SSTL18_I [get_ports i2c_derp_scl_host]
set_property IOSTANDARD SSTL18_II [get_ports i2c_derp_sda_device]
set_property IOSTANDARD SSTL18_II [get_ports i2c_derp_sda_host]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports i2c_derp_sda_host]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports i2c_derp_scl_device]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports i2c_derp_sda_device]
set_property PACKAGE_PIN Y16 [get_ports i2c_derp_scl_device]
set_property PACKAGE_PIN W16 [get_ports i2c_derp_sda_device]
set_property PACKAGE_PIN AA14 [get_ports i2c_derp_scl_host]
set_property PACKAGE_PIN AA15 [get_ports i2c_derp_sda_host]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports qdr_cq_p]
set_property PACKAGE_PIN N18 [get_ports qdr_cq_p]
set_property PACKAGE_PIN AA21 [get_ports qdr_k_p]
set_property PACKAGE_PIN H20 [get_ports qdr_qvld]
set_property IOSTANDARD SSTL18_I [get_ports qdr_qvld]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports qdr_qvld]

set_property PACKAGE_PIN N22 [get_ports qdr_rps_n]
set_property IOSTANDARD SSTL18_I [get_ports qdr_rps_n]
set_property PACKAGE_PIN P22 [get_ports qdr_wps_n]
set_property IOSTANDARD SSTL18_I [get_ports qdr_wps_n]
set_property IOSTANDARD LVCMOS18 [get_ports {flash_dq[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {flash_dq[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {flash_dq[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {flash_dq[0]}]
set_property PACKAGE_PIN F19 [get_ports {flash_dq[3]}]
set_property PACKAGE_PIN G18 [get_ports {flash_dq[2]}]
set_property PACKAGE_PIN H19 [get_ports {flash_dq[1]}]
set_property PACKAGE_PIN H18 [get_ports {flash_dq[0]}]
set_property PACKAGE_PIN L16 [get_ports flash_cs_n]
set_property IOSTANDARD LVCMOS18 [get_ports flash_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod_dq[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod_dq[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod_dq[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod_dq[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod_dq[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod_dq[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod_dq[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod_dq[0]}]
set_property PACKAGE_PIN F11 [get_ports {pmod_dq[7]}]
set_property PACKAGE_PIN E12 [get_ports {pmod_dq[6]}]
set_property PACKAGE_PIN H12 [get_ports {pmod_dq[5]}]
set_property PACKAGE_PIN H14 [get_ports {pmod_dq[4]}]
set_property PACKAGE_PIN G12 [get_ports {pmod_dq[3]}]
set_property PACKAGE_PIN E13 [get_ports {pmod_dq[2]}]
set_property PACKAGE_PIN H13 [get_ports {pmod_dq[1]}]
set_property PACKAGE_PIN F14 [get_ports {pmod_dq[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_led[0]}]
set_property PACKAGE_PIN B10 [get_ports {gpio_led[3]}]
set_property PACKAGE_PIN A10 [get_ports {gpio_led[2]}]
set_property PACKAGE_PIN C10 [get_ports {gpio_led[1]}]
set_property PACKAGE_PIN A9 [get_ports {gpio_led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {fan_tach[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {fan_tach[0]}]
set_property PACKAGE_PIN F9 [get_ports {fan_tach[1]}]
set_property PACKAGE_PIN F10 [get_ports {fan_tach[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {g12_led_p_3v3[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g12_led_p_3v3[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g12_led_p_3v3[0]}]
set_property PACKAGE_PIN H9 [get_ports {g12_led_p_3v3[2]}]
set_property PACKAGE_PIN G10 [get_ports {g12_led_p_3v3[1]}]
set_property PACKAGE_PIN H8 [get_ports {g12_led_p_3v3[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g13_led_p_3v3[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g13_led_p_3v3[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g13_led_p_3v3[0]}]
set_property PACKAGE_PIN G8 [get_ports {g13_led_p_3v3[2]}]
set_property PACKAGE_PIN G11 [get_ports {g13_led_p_3v3[1]}]
set_property PACKAGE_PIN H10 [get_ports {g13_led_p_3v3[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mgmt0_led_p_3v3[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mgmt0_led_p_3v3[0]}]
set_property PACKAGE_PIN G13 [get_ports {mgmt0_led_p_3v3[1]}]
set_property PACKAGE_PIN F13 [get_ports {mgmt0_led_p_3v3[0]}]
set_property PACKAGE_PIN D9 [get_ports mcu_irq]
set_property IOSTANDARD LVCMOS33 [get_ports mcu_irq]
set_property PACKAGE_PIN C9 [get_ports mcu_sck]
set_property IOSTANDARD LVCMOS33 [get_ports mcu_sck]
set_property PACKAGE_PIN B8 [get_ports mcu_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports mcu_cs_n]

set_property IOSTANDARD LVCMOS33 [get_ports {sfp_led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sfp_led[0]}]
set_property PACKAGE_PIN B11 [get_ports {sfp_led[1]}]
set_property PACKAGE_PIN A11 [get_ports {sfp_led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mcu_dq[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mcu_dq[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mcu_dq[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mcu_dq[0]}]
set_property PACKAGE_PIN E9 [get_ports {mcu_dq[3]}]
set_property PACKAGE_PIN E8 [get_ports {mcu_dq[2]}]
set_property PACKAGE_PIN A8 [get_ports {mcu_dq[1]}]
set_property PACKAGE_PIN C8 [get_ports {mcu_dq[0]}]
set_property PACKAGE_PIN R2 [get_ports mgmt0_mdio]
set_property IOSTANDARD LVCMOS18 [get_ports mgmt0_mdio]
set_property PACKAGE_PIN AA4 [get_ports mgmt0_rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports mgmt0_rst_n]
set_property PACKAGE_PIN T4 [get_ports mgmt0_rx_clk]
set_property IOSTANDARD LVCMOS18 [get_ports mgmt0_rx_clk]
set_property PACKAGE_PIN U1 [get_ports mgmt0_rx_dv]
set_property IOSTANDARD LVCMOS18 [get_ports mgmt0_rx_dv]
set_property PACKAGE_PIN Y2 [get_ports mgmt0_tx_clk]
set_property IOSTANDARD LVDCI_18 [get_ports mgmt0_tx_clk]
set_property PACKAGE_PIN Y1 [get_ports mgmt0_tx_en]
set_property IOSTANDARD LVDCI_18 [get_ports mgmt0_tx_en]
set_property PACKAGE_PIN T1 [get_ports mgmt0_mdc]
set_property IOSTANDARD LVCMOS18 [get_ports mgmt0_mdc]
set_property PACKAGE_PIN R3 [get_ports clk_125mhz_p]
set_property IOSTANDARD LVCMOS18 [get_ports {mgmt0_led_n_1v8[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {mgmt0_led_n_1v8[0]}]
set_property PACKAGE_PIN AB3 [get_ports {mgmt0_led_n_1v8[1]}]
set_property PACKAGE_PIN AA3 [get_ports {mgmt0_led_n_1v8[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {mgmt0_rxd[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {mgmt0_rxd[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {mgmt0_rxd[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {mgmt0_rxd[0]}]
set_property PACKAGE_PIN W2 [get_ports {mgmt0_rxd[3]}]
set_property PACKAGE_PIN W1 [get_ports {mgmt0_rxd[2]}]
set_property PACKAGE_PIN V2 [get_ports {mgmt0_rxd[1]}]
set_property PACKAGE_PIN U2 [get_ports {mgmt0_rxd[0]}]
set_property IOSTANDARD LVDCI_18 [get_ports {mgmt0_txd[3]}]
set_property IOSTANDARD LVDCI_18 [get_ports {mgmt0_txd[2]}]
set_property IOSTANDARD LVDCI_18 [get_ports {mgmt0_txd[1]}]
set_property IOSTANDARD LVDCI_18 [get_ports {mgmt0_txd[0]}]
set_property PACKAGE_PIN AA1 [get_ports {mgmt0_txd[3]}]
set_property PACKAGE_PIN Y3 [get_ports {mgmt0_txd[2]}]
set_property PACKAGE_PIN AB1 [get_ports {mgmt0_txd[1]}]

set_property PACKAGE_PIN AB2 [get_ports {mgmt0_txd[0]}]
set_property PACKAGE_PIN G3 [get_ports {qsgmii_rx_n[2]}]
set_property PACKAGE_PIN G4 [get_ports {qsgmii_rx_p[2]}]
set_property PACKAGE_PIN E3 [get_ports {qsgmii_rx_n[1]}]
set_property PACKAGE_PIN E4 [get_ports {qsgmii_rx_p[1]}]
set_property PACKAGE_PIN C3 [get_ports {qsgmii_rx_n[0]}]
set_property PACKAGE_PIN C4 [get_ports {qsgmii_rx_p[0]}]
set_property PACKAGE_PIN D6 [get_ports gtx_refclk_156m25_p]
set_property PACKAGE_PIN D5 [get_ports gtx_refclk_156m25_n]
set_property PACKAGE_PIN F6 [get_ports gtx_refclk_200m_p]
set_property PACKAGE_PIN F5 [get_ports gtx_refclk_200m_n]
set_property PACKAGE_PIN B5 [get_ports sfp_rx_n]
set_property PACKAGE_PIN B6 [get_ports sfp_rx_p]
set_property PACKAGE_PIN A3 [get_ports sfp_tx_n]
set_property PACKAGE_PIN A4 [get_ports sfp_tx_p]
set_property IOSTANDARD LVCMOS18 [get_ports {g12_led_p_1v8[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {g12_led_p_1v8[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {g12_led_p_1v8[0]}]
set_property PACKAGE_PIN AB6 [get_ports {g12_led_p_1v8[2]}]
set_property PACKAGE_PIN W7 [get_ports {g12_led_p_1v8[1]}]
set_property PACKAGE_PIN AB5 [get_ports {g12_led_p_1v8[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {g12_gpio[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {g12_gpio[0]}]
set_property PACKAGE_PIN AA8 [get_ports {g12_gpio[1]}]
set_property PACKAGE_PIN AB8 [get_ports {g12_gpio[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {g13_gpio[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {g13_gpio[0]}]
set_property PACKAGE_PIN AA13 [get_ports {g13_gpio[1]}]
set_property PACKAGE_PIN AB13 [get_ports {g13_gpio[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {g13_led_p_1v8[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {g13_led_p_1v8[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {g13_led_p_1v8[0]}]
set_property PACKAGE_PIN AA11 [get_ports {g13_led_p_1v8[2]}]
set_property PACKAGE_PIN AA10 [get_ports {g13_led_p_1v8[1]}]
set_property PACKAGE_PIN AA9 [get_ports {g13_led_p_1v8[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports dp_mdio]
set_property IOSTANDARD LVCMOS18 [get_ports dp_mdc]
set_property PACKAGE_PIN AB12 [get_ports dp_mdc]
set_property PACKAGE_PIN Y12 [get_ports dp_mdio]
set_property PACKAGE_PIN AA6 [get_ports g12_int_n]
set_property IOSTANDARD LVCMOS18 [get_ports g12_int_n]
set_property IOSTANDARD LVCMOS18 [get_ports g12_rst_n]
set_property PACKAGE_PIN AB7 [get_ports g12_rst_n]
set_property PACKAGE_PIN U10 [get_ports g12_sgmii_rx_p]
set_property PACKAGE_PIN W9 [get_ports g12_sgmii_rxclk_p]
set_property PACKAGE_PIN W11 [get_ports g12_sgmii_tx_p]
set_property PACKAGE_PIN AB10 [get_ports g13_int_n]
set_property IOSTANDARD LVCMOS18 [get_ports g13_int_n]
set_property PACKAGE_PIN AB11 [get_ports g13_rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports g13_rst_n]
set_property PACKAGE_PIN U8 [get_ports g13_sgmii_rx_p]
set_property PACKAGE_PIN Y8 [get_ports g13_sgmii_rxclk_p]
set_property PACKAGE_PIN W6 [get_ports g13_sgmii_tx_p]
set_property PACKAGE_PIN R7 [get_ports vsc_fast_status]
set_property IOSTANDARD LVCMOS18 [get_ports vsc_fast_status]
set_property PACKAGE_PIN T8 [get_ports vsc_mdc]
set_property IOSTANDARD LVCMOS18 [get_ports vsc_mdc]
set_property PACKAGE_PIN R6 [get_ports vsc_mdint]
set_property IOSTANDARD LVCMOS18 [get_ports vsc_mdint]
set_property PACKAGE_PIN U7 [get_ports vsc_mdio]
set_property PACKAGE_PIN U6 [get_ports vsc_mdio_oe]
set_property IOSTANDARD LVCMOS18 [get_ports vsc_mdio]
set_property IOSTANDARD LVCMOS18 [get_ports vsc_mdio_oe]

set_property IOSTANDARD DIFF_HSTL_I_DCI_18 [get_ports g13_sgmii_rxclk_p]
set_property IOSTANDARD DIFF_HSTL_I_DCI_18 [get_ports g12_sgmii_rxclk_p]

set_property IOSTANDARD LVDS [get_ports clk_125mhz_p]
set_property IOSTANDARD LVDS [get_ports clk_125mhz_n]

set_property IOSTANDARD DIFF_HSTL_I_DCI_18 [get_ports g13_sgmii_rx_p]
set_property IOSTANDARD DIFF_HSTL_I_DCI_18 [get_ports g13_sgmii_rx_n]
set_property IOSTANDARD DIFF_HSTL_I_DCI_18 [get_ports g12_sgmii_rx_p]
set_property IOSTANDARD DIFF_HSTL_I_DCI_18 [get_ports g12_sgmii_rx_n]
set_property IOSTANDARD LVDS [get_ports g12_sgmii_tx_p]

set_property PACKAGE_PIN D11 [get_ports sfp_rx_los]
set_property IOSTANDARD LVCMOS33 [get_ports sfp_rx_los]

set_property IOSTANDARD DIFF_SSTL18_I [get_ports qdr_cq_p]
set_property IOSTANDARD DIFF_SSTL18_I [get_ports qdr_k_p]

########################################################################################################################
# External clock inputs

create_clock -period 1.600 -name g12_sgmii_rxclk_p -waveform {0.000 0.800} [get_ports g12_sgmii_rxclk_p]
create_clock -period 1.600 -name g13_sgmii_rxclk_p -waveform {0.000 0.800} [get_ports g13_sgmii_rxclk_p]

create_clock -period 8.000 -name clk_125mhz_p -waveform {0.000 4.000} [get_ports clk_125mhz_p]

create_clock -period 8.000 -name mgmt0_rx_clk -waveform {0.000 4.000} [get_ports mgmt0_rx_clk]
create_clock -period 2.222 -name qdr_cq_p -waveform {0.000 1.111} [get_ports qdr_cq_p]
create_generated_clock -name qdr_k_p -source [get_pins qdr/ram_clk_oddr/C] -divide_by 1 [get_ports qdr_k_p]

create_clock -period 6.400 -name gtx_refclk_156m25_p -waveform {0.000 3.200} [get_ports gtx_refclk_156m25_p]
create_clock -period 5.000 -name gtx_refclk_200m_p -waveform {0.000 2.500} [get_ports gtx_refclk_200m_p]

set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets sgmii_rxclk0]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets sgmii_rxclk1]

########################################################################################################################
# CDC

set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg}] -to [get_clocks clk_312p5mhz_raw] 2.500

set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg}] -to [get_clocks {clk_125mhz_p clk_125mhz_raw}] 2.500

set_clock_groups -asynchronous -group [get_clocks mgmt0_rx_clk] -group [get_clocks clk_125mhz_raw]
set_clock_groups -asynchronous -group [get_clocks mgmt0_rx_clk] -group [get_clocks clk_312p5mhz_raw]
set_clock_groups -asynchronous -group [get_clocks clk_125mhz_raw] -group [get_clocks mgmt0_rx_clk]
set_clock_groups -asynchronous -group [get_clocks clk_312p5mhz_raw] -group [get_clocks mgmt0_rx_clk]

set_max_delay -from [get_clocks *clk_125mhz_raw*] -through [get_cells -hierarchical -filter { NAME =~  "*sync*" && NAME =~  "*dout0_reg*" }] -to [get_clocks *clk_312p5mhz*] 2.500
set_max_delay -from [get_clocks *clk_312p5mhz*] -through [get_cells -hierarchical -filter { NAME =~  "*sync*" && NAME =~  "*dout0_reg*" }] -to [get_clocks *clk_125mhz*] 2.500

set_max_delay -from [get_clocks *clk_312p5mhz*] -through [get_cells -hierarchical *storage_reg*] -to [get_cells -hierarchical *portb_dout_raw_reg*] 2.500

set _xlnx_shared_i0 [get_cells -hierarchical *reg_a_ff*]
set_max_delay -from [get_clocks *clk_125mhz_raw*] -through $_xlnx_shared_i0 -to [get_clocks *clk_312p5mhz*] 2.500
set_max_delay -from [get_clocks *clk_312p5mhz*] -through $_xlnx_shared_i0 -to [get_clocks *clk_125mhz_raw*] 2.500

set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg}] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg}] -to [get_clocks {clk_125mhz_p clk_125mhz_raw}] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg port_g12/bridge/sync_perf/sync_en/sync/dout0_reg port_g12/bridge/sync_rst_stat/dout0_reg port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg port_g13/bridge/sync_perf/sync_en/sync/dout0_reg port_g13/bridge/sync_rst_stat/dout0_reg port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg}] -to [get_clocks {clk_312p5mhz_io_raw clk_312p5mhz_raw}] 2.500
set_max_delay -from [get_clocks {clk_312p5mhz_io_raw clk_312p5mhz_raw}] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg port_g12/bridge/sync_perf/sync_en/sync/dout0_reg port_g12/bridge/sync_rst_stat/dout0_reg port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg port_g13/bridge/sync_perf/sync_en/sync/dout0_reg port_g13/bridge/sync_rst_stat/dout0_reg port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg}] -to [get_clocks {clk_125mhz_p clk_125mhz_raw}] 2.500

set_max_delay -from [get_cells -hierarchical *samples_*_2x*] -to [get_cells -hierarchical *samples_*_sync*] 2.000

set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks clk_qcapture_raw]
set_clock_groups -asynchronous -group [get_clocks clk_qcapture_raw] -group [get_clocks clk_ram_ctl_raw]

set_false_path -from [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -to [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK]
set_false_path -from [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -to [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK]
set_false_path -from [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -to [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK]

set_clock_groups -asynchronous -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK] -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK] -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK] -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]

########################################################################################################################
# Floorplanning: clock synthesis blocks

# Main clock PLL should be in close proximity to the SGMII logic since that's the highest frequency,
# tightest timing stuff
set_property LOC MMCME2_ADV_X1Y1 [get_cells clk_system/main_mmcm]

# We don't need dedicated routing for the 125 MHz system clock input,
# since nothing is synchronous to it
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk_system/sysclk_in]

########################################################################################################################
# Floorplanning: RAM

create_pblock pblock_ram
add_cells_to_pblock [get_pblocks pblock_ram] [get_cells -quiet [list qdr]]
resize_pblock [get_pblocks pblock_ram] -add {SLICE_X0Y199:SLICE_X33Y50}
resize_pblock [get_pblocks pblock_ram] -add {DSP48_X0Y20:DSP48_X1Y79}
resize_pblock [get_pblocks pblock_ram] -add {RAMB18_X0Y20:RAMB18_X1Y79}
resize_pblock [get_pblocks pblock_ram] -add {RAMB36_X0Y10:RAMB36_X1Y39}

########################################################################################################################
# Floorplanning: SGMII g13

create_pblock pblock_sgmii
add_cells_to_pblock [get_pblocks pblock_sgmii] [get_cells -quiet [list port_g12 port_g13]]
resize_pblock [get_pblocks pblock_sgmii] -add {CLOCKREGION_X1Y1:CLOCKREGION_X1Y1}

set_property LOC SLICE_X109Y84 [get_cells {port_g13/bridge/cdr/samples_hi_reg[0]}]
set_property LOC SLICE_X109Y84 [get_cells {port_g13/bridge/cdr/samples_hi_reg[1]}]
set_property LOC SLICE_X109Y84 [get_cells {port_g13/bridge/cdr/samples_hi_reg[2]}]
set_property LOC SLICE_X109Y84 [get_cells {port_g13/bridge/cdr/samples_hi_reg[3]}]

set_property LOC SLICE_X109Y83 [get_cells {port_g13/bridge/cdr/samples_hi_reg[7]}]
set_property LOC SLICE_X109Y83 [get_cells {port_g13/bridge/cdr/samples_hi_reg[6]}]
set_property LOC SLICE_X109Y83 [get_cells {port_g13/bridge/cdr/samples_hi_reg[5]}]
set_property LOC SLICE_X109Y83 [get_cells {port_g13/bridge/cdr/samples_hi_reg[4]}]

set_property LOC SLICE_X109Y82 [get_cells {port_g13/bridge/cdr/samples_lo_reg[0]}]
set_property LOC SLICE_X109Y82 [get_cells {port_g13/bridge/cdr/samples_lo_reg[1]}]
set_property LOC SLICE_X109Y82 [get_cells {port_g13/bridge/cdr/samples_lo_reg[2]}]
set_property LOC SLICE_X109Y82 [get_cells {port_g13/bridge/cdr/samples_lo_reg[3]}]

set_property LOC SLICE_X109Y81 [get_cells {port_g13/bridge/cdr/samples_lo_reg[5]}]

set_property LOC SLICE_X108Y84 [get_cells {port_g13/bridge/cdr/samples_hi_2x_reg[0]}]
set_property LOC SLICE_X108Y84 [get_cells {port_g13/bridge/cdr/samples_hi_2x_reg[1]}]
set_property LOC SLICE_X108Y84 [get_cells {port_g13/bridge/cdr/samples_hi_2x_reg[2]}]
set_property LOC SLICE_X108Y84 [get_cells {port_g13/bridge/cdr/samples_hi_2x_reg[3]}]

set_property LOC SLICE_X108Y83 [get_cells {port_g13/bridge/cdr/samples_hi_2x_reg[7]}]
set_property LOC SLICE_X108Y83 [get_cells {port_g13/bridge/cdr/samples_hi_2x_reg[6]}]
set_property LOC SLICE_X108Y83 [get_cells {port_g13/bridge/cdr/samples_hi_2x_reg[5]}]
set_property LOC SLICE_X108Y83 [get_cells {port_g13/bridge/cdr/samples_hi_2x_reg[4]}]

set_property LOC SLICE_X108Y82 [get_cells {port_g13/bridge/cdr/samples_lo_2x_reg[0]}]
set_property LOC SLICE_X108Y82 [get_cells {port_g13/bridge/cdr/samples_lo_2x_reg[1]}]
set_property LOC SLICE_X108Y82 [get_cells {port_g13/bridge/cdr/samples_lo_2x_reg[2]}]
set_property LOC SLICE_X108Y82 [get_cells {port_g13/bridge/cdr/samples_lo_2x_reg[3]}]

set_property LOC SLICE_X108Y81 [get_cells {port_g13/bridge/cdr/samples_lo_2x_reg[7]}]
set_property LOC SLICE_X108Y81 [get_cells {port_g13/bridge/cdr/samples_lo_2x_reg[6]}]
set_property LOC SLICE_X108Y81 [get_cells {port_g13/bridge/cdr/samples_lo_2x_reg[5]}]
set_property LOC SLICE_X108Y81 [get_cells {port_g13/bridge/cdr/samples_lo_2x_reg[4]}]

set_property LOC SLICE_X107Y84 [get_cells {port_g13/bridge/cdr/samples_hi_sync_reg[0]}]
set_property LOC SLICE_X107Y84 [get_cells {port_g13/bridge/cdr/samples_hi_sync_reg[1]}]
set_property LOC SLICE_X107Y84 [get_cells {port_g13/bridge/cdr/samples_hi_sync_reg[2]}]
set_property LOC SLICE_X107Y84 [get_cells {port_g13/bridge/cdr/samples_hi_sync_reg[3]}]

set_property LOC SLICE_X107Y83 [get_cells {port_g13/bridge/cdr/samples_hi_sync_reg[7]}]
set_property LOC SLICE_X107Y83 [get_cells {port_g13/bridge/cdr/samples_hi_sync_reg[6]}]
set_property LOC SLICE_X107Y83 [get_cells {port_g13/bridge/cdr/samples_hi_sync_reg[5]}]
set_property LOC SLICE_X107Y83 [get_cells {port_g13/bridge/cdr/samples_hi_sync_reg[4]}]

set_property LOC SLICE_X107Y82 [get_cells {port_g13/bridge/cdr/samples_lo_sync_reg[0]}]
set_property LOC SLICE_X107Y82 [get_cells {port_g13/bridge/cdr/samples_lo_sync_reg[1]}]
set_property LOC SLICE_X107Y82 [get_cells {port_g13/bridge/cdr/samples_lo_sync_reg[2]}]
set_property LOC SLICE_X107Y82 [get_cells {port_g13/bridge/cdr/samples_lo_sync_reg[3]}]

set_property LOC SLICE_X107Y81 [get_cells {port_g13/bridge/cdr/samples_lo_sync_reg[7]}]
set_property LOC SLICE_X107Y81 [get_cells {port_g13/bridge/cdr/samples_lo_sync_reg[6]}]
set_property LOC SLICE_X107Y81 [get_cells {port_g13/bridge/cdr/samples_lo_sync_reg[5]}]
set_property LOC SLICE_X107Y81 [get_cells {port_g13/bridge/cdr/samples_lo_sync_reg[4]}]

########################################################################################################################
# Floorplanning: SGMII g12

set_property LOC SLICE_X109Y74 [get_cells {port_g12/bridge/cdr/samples_hi_reg[0]}]
set_property LOC SLICE_X109Y74 [get_cells {port_g12/bridge/cdr/samples_hi_reg[1]}]
set_property LOC SLICE_X109Y74 [get_cells {port_g12/bridge/cdr/samples_hi_reg[2]}]
set_property LOC SLICE_X109Y74 [get_cells {port_g12/bridge/cdr/samples_hi_reg[3]}]

set_property LOC SLICE_X109Y73 [get_cells {port_g12/bridge/cdr/samples_hi_reg[7]}]
set_property LOC SLICE_X109Y73 [get_cells {port_g12/bridge/cdr/samples_hi_reg[6]}]
set_property LOC SLICE_X109Y73 [get_cells {port_g12/bridge/cdr/samples_hi_reg[5]}]
set_property LOC SLICE_X109Y73 [get_cells {port_g12/bridge/cdr/samples_hi_reg[4]}]

set_property LOC SLICE_X109Y72 [get_cells {port_g12/bridge/cdr/samples_lo_reg[3]}]

set_property LOC SLICE_X109Y71 [get_cells {port_g12/bridge/cdr/samples_lo_reg[6]}]
set_property LOC SLICE_X109Y71 [get_cells {port_g12/bridge/cdr/samples_lo_reg[5]}]

set_property LOC SLICE_X108Y74 [get_cells {port_g12/bridge/cdr/samples_hi_2x_reg[0]}]
set_property LOC SLICE_X108Y74 [get_cells {port_g12/bridge/cdr/samples_hi_2x_reg[1]}]
set_property LOC SLICE_X108Y74 [get_cells {port_g12/bridge/cdr/samples_hi_2x_reg[2]}]
set_property LOC SLICE_X108Y74 [get_cells {port_g12/bridge/cdr/samples_hi_2x_reg[3]}]

set_property LOC SLICE_X108Y73 [get_cells {port_g12/bridge/cdr/samples_hi_2x_reg[7]}]
set_property LOC SLICE_X108Y73 [get_cells {port_g12/bridge/cdr/samples_hi_2x_reg[6]}]
set_property LOC SLICE_X108Y73 [get_cells {port_g12/bridge/cdr/samples_hi_2x_reg[5]}]
set_property LOC SLICE_X108Y73 [get_cells {port_g12/bridge/cdr/samples_hi_2x_reg[4]}]

set_property LOC SLICE_X108Y72 [get_cells {port_g12/bridge/cdr/samples_lo_2x_reg[0]}]
set_property LOC SLICE_X108Y72 [get_cells {port_g12/bridge/cdr/samples_lo_2x_reg[1]}]
set_property LOC SLICE_X108Y72 [get_cells {port_g12/bridge/cdr/samples_lo_2x_reg[2]}]
set_property LOC SLICE_X108Y72 [get_cells {port_g12/bridge/cdr/samples_lo_2x_reg[3]}]

set_property LOC SLICE_X108Y71 [get_cells {port_g12/bridge/cdr/samples_lo_2x_reg[7]}]
set_property LOC SLICE_X108Y71 [get_cells {port_g12/bridge/cdr/samples_lo_2x_reg[6]}]
set_property LOC SLICE_X108Y71 [get_cells {port_g12/bridge/cdr/samples_lo_2x_reg[5]}]
set_property LOC SLICE_X108Y71 [get_cells {port_g12/bridge/cdr/samples_lo_2x_reg[4]}]

set_property LOC SLICE_X107Y74 [get_cells {port_g12/bridge/cdr/samples_hi_sync_reg[0]}]
set_property LOC SLICE_X107Y74 [get_cells {port_g12/bridge/cdr/samples_hi_sync_reg[1]}]
set_property LOC SLICE_X107Y74 [get_cells {port_g12/bridge/cdr/samples_hi_sync_reg[2]}]
set_property LOC SLICE_X107Y74 [get_cells {port_g12/bridge/cdr/samples_hi_sync_reg[3]}]

set_property LOC SLICE_X107Y73 [get_cells {port_g12/bridge/cdr/samples_hi_sync_reg[7]}]
set_property LOC SLICE_X107Y73 [get_cells {port_g12/bridge/cdr/samples_hi_sync_reg[6]}]
set_property LOC SLICE_X107Y73 [get_cells {port_g12/bridge/cdr/samples_hi_sync_reg[5]}]
set_property LOC SLICE_X107Y73 [get_cells {port_g12/bridge/cdr/samples_hi_sync_reg[4]}]

set_property LOC SLICE_X107Y72 [get_cells {port_g12/bridge/cdr/samples_lo_sync_reg[0]}]
set_property LOC SLICE_X107Y72 [get_cells {port_g12/bridge/cdr/samples_lo_sync_reg[1]}]
set_property LOC SLICE_X107Y72 [get_cells {port_g12/bridge/cdr/samples_lo_sync_reg[2]}]
set_property LOC SLICE_X107Y72 [get_cells {port_g12/bridge/cdr/samples_lo_sync_reg[3]}]

set_property LOC SLICE_X107Y71 [get_cells {port_g12/bridge/cdr/samples_lo_sync_reg[7]}]
set_property LOC SLICE_X107Y71 [get_cells {port_g12/bridge/cdr/samples_lo_sync_reg[6]}]
set_property LOC SLICE_X107Y71 [get_cells {port_g12/bridge/cdr/samples_lo_sync_reg[5]}]
set_property LOC SLICE_X107Y71 [get_cells {port_g12/bridge/cdr/samples_lo_sync_reg[4]}]

########################################################################################################################
# Floorplanning: RGMII mgmt0

create_pblock pblock_rgmii
add_cells_to_pblock [get_pblocks pblock_rgmii] [get_cells -quiet [list port_mgmt0]]
resize_pblock [get_pblocks pblock_rgmii] -add {SLICE_X88Y100:SLICE_X109Y149}
resize_pblock [get_pblocks pblock_rgmii] -add {DSP48_X5Y40:DSP48_X5Y59}
resize_pblock [get_pblocks pblock_rgmii] -add {RAMB18_X6Y40:RAMB18_X6Y59}
resize_pblock [get_pblocks pblock_rgmii] -add {RAMB36_X6Y20:RAMB36_X6Y29}

#######################################################################################################################
# Floorplanning: QSGMII

create_pblock pblock_qsgmii
add_cells_to_pblock [get_pblocks pblock_qsgmii] [get_cells -quiet [list port_g0_g11 {qsgmii[0].quad} {qsgmii[1].quad} {qsgmii[2].quad}]]
resize_pblock [get_pblocks pblock_qsgmii] -add {CLOCKREGION_X1Y3:CLOCKREGION_X1Y4}

#######################################################################################################################
# Floorplanning: SFP+ xg0

create_pblock pblock_10g
add_cells_to_pblock [get_pblocks pblock_10g] [get_cells -quiet [list port_xg0 xg_transceiver]]
resize_pblock [get_pblocks pblock_10g] -add {SLICE_X56Y170:SLICE_X101Y224}
resize_pblock [get_pblocks pblock_10g] -add {DSP48_X3Y68:DSP48_X5Y89}
resize_pblock [get_pblocks pblock_10g] -add {RAMB18_X3Y68:RAMB18_X5Y89}
resize_pblock [get_pblocks pblock_10g] -add {RAMB36_X3Y34:RAMB36_X5Y44}

########################################################################################################################
# Configuration mode

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

########################################################################################################################
# Clock domain crossing

set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg}] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg}] -to [get_clocks {clk_125mhz_p clk_125mhz_raw}] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg port_g12/bridge/sync_perf/sync_en/sync/dout0_reg port_g12/bridge/sync_rst_stat/dout0_reg port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg port_g13/bridge/sync_perf/sync_en/sync/dout0_reg port_g13/bridge/sync_rst_stat/dout0_reg port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg}] -to [get_clocks {clk_312p5mhz_io_raw clk_312p5mhz_raw}] 2.500
set_max_delay -from [get_clocks {clk_312p5mhz_io_raw clk_312p5mhz_raw}] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg port_g12/bridge/sync_perf/sync_en/sync/dout0_reg port_g12/bridge/sync_rst_stat/dout0_reg port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg port_g13/bridge/sync_perf/sync_en/sync/dout0_reg port_g13/bridge/sync_rst_stat/dout0_reg port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg}] -to [get_clocks {clk_125mhz_p clk_125mhz_raw}] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg}] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg}] -to [get_clocks {clk_125mhz_p clk_125mhz_raw}] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg port_g12/bridge/sync_perf/sync_en/sync/dout0_reg port_g12/bridge/sync_rst_stat/dout0_reg port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg port_g13/bridge/sync_perf/sync_en/sync/dout0_reg port_g13/bridge/sync_rst_stat/dout0_reg port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg}] -to [get_clocks {clk_312p5mhz_io_raw clk_312p5mhz_raw}] 2.500
set_max_delay -from [get_clocks {clk_312p5mhz_io_raw clk_312p5mhz_raw}] -through [get_cells {mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg port_g12/bridge/sync_perf/sync_en/sync/dout0_reg port_g12/bridge/sync_rst_stat/dout0_reg port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg port_g13/bridge/sync_perf/sync_en/sync/dout0_reg port_g13/bridge/sync_rst_stat/dout0_reg port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg}] -to [get_clocks {clk_125mhz_p clk_125mhz_raw}] 2.500

########################################################################################################################
# Debug clocking

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_312p5mhz]