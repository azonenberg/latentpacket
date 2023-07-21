set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} buffer/qdr/fifo/sync_rd_ptr/sync_ack/sync/dout0_reg buffer/qdr/fifo/sync_rd_ptr/sync_en/sync/dout0_reg buffer/qdr/fifo/sync_wr_ptr/sync_ack/sync/dout0_reg buffer/qdr/fifo/sync_wr_ptr/sync_en/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg interfaces/port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg interfaces/port_g12/bridge/sync_perf/sync_en/sync/dout0_reg interfaces/port_g12/bridge/sync_rst_stat/dout0_reg interfaces/port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg interfaces/port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg interfaces/port_g13/bridge/sync_perf/sync_en/sync/dout0_reg interfaces/port_g13/bridge/sync_rst_stat/dout0_reg interfaces/port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg interfaces/port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_en/sync/dout0_reg} mgmt/regs/sync_crypt_inputs/sync_ack/sync/dout0_reg mgmt/regs/sync_crypt_inputs/sync_en/sync/dout0_reg mgmt/regs/sync_crypt_outputs/sync_ack/sync/dout0_reg mgmt/regs/sync_crypt_outputs/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_cells [list {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} buffer/qdr/fifo/sync_rd_ptr/sync_ack/sync/dout1_reg buffer/qdr/fifo/sync_rd_ptr/sync_en/sync/dout1_reg buffer/qdr/fifo/sync_wr_ptr/sync_ack/sync/dout1_reg buffer/qdr/fifo/sync_wr_ptr/sync_en/sync/dout1_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg interfaces/port_g12/bridge/sync_perf/sync_ack/sync/dout1_reg interfaces/port_g12/bridge/sync_perf/sync_en/sync/dout1_reg interfaces/port_g12/bridge/sync_rst_stat/dout1_reg interfaces/port_g12/mac/sync_link_speed/sync_ack/sync/dout1_reg interfaces/port_g12/mac/sync_link_speed/sync_en/sync/dout1_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg interfaces/port_g13/bridge/sync_perf/sync_ack/sync/dout1_reg interfaces/port_g13/bridge/sync_perf/sync_en/sync/dout1_reg interfaces/port_g13/bridge/sync_rst_stat/dout1_reg interfaces/port_g13/mac/sync_link_speed/sync_ack/sync/dout1_reg interfaces/port_g13/mac/sync_link_speed/sync_en/sync/dout1_reg interfaces/port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout1_reg interfaces/port_mgmt0/mac/sync_link_speed/sync_en/sync/dout1_reg interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout1_reg interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout1_reg interfaces/port_xg0/pcs/sync_sfp_los/dout1_reg {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} {mgmt/bridge/qspi/genblk1[0].sync_dq/dout1_reg} {mgmt/bridge/qspi/genblk1[1].sync_dq/dout1_reg} {mgmt/bridge/qspi/genblk1[2].sync_dq/dout1_reg} {mgmt/bridge/qspi/genblk1[3].sync_dq/dout1_reg} mgmt/bridge/qspi/sync_cs/dout1_reg mgmt/bridge/qspi/sync_sck/dout1_reg {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_ack/sync/dout1_reg} {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_en/sync/dout1_reg} mgmt/regs/sync_crypt_inputs/sync_ack/sync/dout1_reg mgmt/regs/sync_crypt_inputs/sync_en/sync/dout1_reg mgmt/regs/sync_crypt_outputs/sync_ack/sync/dout1_reg mgmt/regs/sync_crypt_outputs/sync_en/sync/dout1_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout1_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout1_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout1_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout1_reg mgmt/rx_fifo/sync_fifo_rst/dout1_reg]] 2.500
set_max_delay -from [get_clocks clk_ram_ctl_raw] -through [get_cells [list mgmt/rx_fifo/sync_fifo_rst/dout0_reg {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} buffer/qdr/fifo/sync_rd_ptr/sync_ack/sync/dout0_reg buffer/qdr/fifo/sync_rd_ptr/sync_en/sync/dout0_reg buffer/qdr/fifo/sync_wr_ptr/sync_ack/sync/dout0_reg buffer/qdr/fifo/sync_wr_ptr/sync_en/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg interfaces/port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg interfaces/port_g12/bridge/sync_perf/sync_en/sync/dout0_reg interfaces/port_g12/bridge/sync_rst_stat/dout0_reg interfaces/port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg interfaces/port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg interfaces/port_g13/bridge/sync_perf/sync_en/sync/dout0_reg interfaces/port_g13/bridge/sync_rst_stat/dout0_reg interfaces/port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg interfaces/port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_en/sync/dout0_reg} mgmt/regs/sync_crypt_inputs/sync_ack/sync/dout0_reg mgmt/regs/sync_crypt_inputs/sync_en/sync/dout0_reg mgmt/regs/sync_crypt_outputs/sync_ack/sync/dout0_reg mgmt/regs/sync_crypt_outputs/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg]] -to [get_clocks clk_crypt_raw] 2.500
set_max_delay -from [get_clocks clk_crypt_raw] -through [get_cells [list mgmt/rx_fifo/sync_fifo_rst/dout0_reg {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} buffer/qdr/fifo/sync_rd_ptr/sync_ack/sync/dout0_reg buffer/qdr/fifo/sync_rd_ptr/sync_en/sync/dout0_reg buffer/qdr/fifo/sync_wr_ptr/sync_ack/sync/dout0_reg buffer/qdr/fifo/sync_wr_ptr/sync_en/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg interfaces/port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg interfaces/port_g12/bridge/sync_perf/sync_en/sync/dout0_reg interfaces/port_g12/bridge/sync_rst_stat/dout0_reg interfaces/port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg interfaces/port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg interfaces/port_g13/bridge/sync_perf/sync_en/sync/dout0_reg interfaces/port_g13/bridge/sync_rst_stat/dout0_reg interfaces/port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg interfaces/port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_ack/sync/dout0_reg} {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_en/sync/dout0_reg} mgmt/regs/sync_crypt_inputs/sync_ack/sync/dout0_reg mgmt/regs/sync_crypt_inputs/sync_en/sync/dout0_reg mgmt/regs/sync_crypt_outputs/sync_ack/sync/dout0_reg mgmt/regs/sync_crypt_outputs/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg]] -to [get_clocks clk_ram_ctl_raw] 2.500
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

set_property PULLUP true [get_ports {fan_tach[1]}]
set_property PULLUP true [get_ports {fan_tach[0]}]

########################################################################################################################
# External clock inputs

create_clock -period 1.600 -name g12_sgmii_rxclk_p -waveform {0.000 0.800} [get_ports g12_sgmii_rxclk_p]
create_clock -period 1.600 -name g13_sgmii_rxclk_p -waveform {0.000 0.800} [get_ports g13_sgmii_rxclk_p]

create_clock -period 8.000 -name clk_125mhz_p -waveform {0.000 4.000} [get_ports clk_125mhz_p]

create_clock -period 8.000 -name mgmt0_rx_clk -waveform {0.000 4.000} [get_ports mgmt0_rx_clk]
create_clock -period 2.222 -name qdr_cq_p -waveform {0.000 1.111} [get_ports qdr_cq_p]
create_generated_clock -name qdr_k_p -source [get_pins buffer/qdr/ram_clk_oddr/C] -divide_by 1 [get_ports qdr_k_p]

create_clock -period 6.400 -name gtx_refclk_156m25_p -waveform {0.000 3.200} [get_ports gtx_refclk_156m25_p]
create_clock -period 5.000 -name gtx_refclk_200m_p -waveform {0.000 2.500} [get_ports gtx_refclk_200m_p]

#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets interfaces/sgmii_rxclk0]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets interfaces/sgmii_rxclk1]

########################################################################################################################
# CDC

set_max_delay -from [get_clocks *clk_312p5mhz*] -through [get_cells -hierarchical *storage_reg*] -to [get_cells -hierarchical *portb_dout_raw_reg*] 2.500
set _xlnx_shared_i0 [get_cells -hierarchical *dout0_reg*]
set_max_delay -from [get_clocks *clk_312p5mhz*] -through $_xlnx_shared_i0 -to [get_cells -hierarchical *dout1_reg*] 2.500

set _xlnx_shared_i1 [get_cells -hierarchical *reg_a_ff*]
set_max_delay -from [get_clocks *clk_125mhz_raw*] -through $_xlnx_shared_i1 -to [get_clocks *clk_312p5mhz*] 2.500
set_max_delay -from [get_clocks *clk_312p5mhz*] -through $_xlnx_shared_i1 -to [get_clocks *clk_125mhz_raw*] 2.500

set_max_delay -from [get_cells -hierarchical *samples_*_2x*] -to [get_cells -hierarchical *samples_*_sync*] 2.000

set_max_delay -from [get_clocks *clk_ram_ctl_raw*] -through $_xlnx_shared_i1 -to [get_clocks *clk_crypt_raw*] 2.500
set_max_delay -from [get_clocks *clk_crypt_raw*] -through $_xlnx_shared_i1 -to [get_clocks *clk_ram_ctl_raw*] 2.500

set_max_delay -from [get_clocks *clk_ram_ctl_raw*] -through $_xlnx_shared_i0 -to [get_clocks *clk_crypt_raw*] 2.500
set_max_delay -from [get_clocks *clk_crypt_raw*] -through $_xlnx_shared_i0 -to [get_clocks *clk_ram_ctl_raw*] 2.500

set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks clk_qcapture_raw]
set_clock_groups -asynchronous -group [get_clocks clk_qcapture_raw] -group [get_clocks clk_ram_ctl_raw]

set_false_path -from [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -to [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK]
set_false_path -from [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -to [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK]
set_false_path -from [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -to [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK]

set_clock_groups -asynchronous -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK] -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK] -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/TXOUTCLK] -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]

set_clock_groups -asynchronous -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -group [get_clocks clk_ram_ctl_raw]
set_clock_groups -asynchronous -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -group [get_clocks clk_ram_ctl_raw]
set_clock_groups -asynchronous -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -group [get_clocks clk_ram_ctl_raw]
set_clock_groups -asynchronous -group [get_clocks interfaces/xg_transceiver/inst/sfp_wizard_i/gt0_sfp_wizard_i/gtxe2_i/RXOUTCLK] -group [get_clocks clk_ram_ctl_raw]

set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks interfaces/port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks interfaces/xg_transceiver/inst/sfp_wizard_i/gt0_sfp_wizard_i/gtxe2_i/RXOUTCLK]

set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[1].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[1].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[0].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[0].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[2].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[2].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[3].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[3].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[7].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[7].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[6].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[6].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[5].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[5].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[4].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[4].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[8].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[8].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[11].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[11].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[9].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[9].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[10].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[10].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[14].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {buffer/infifo/cdcs[14].cdc/sync_rst/rst_out_n_reg}]

set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells {mgmt/rx_fifo/sync_fifo_rst/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg}] -to [get_clocks clk_312p5mhz_raw] 2.500

set_clock_groups -asynchronous -group [get_clocks mgmt0_rx_clk] -group [get_clocks clk_ram_ctl_raw]
set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks mgmt0_rx_clk]

########################################################################################################################
# Floorplanning: input FIFO

create_pblock pblock_sgmii_cdc
resize_pblock [get_pblocks pblock_sgmii_cdc] -add {SLICE_X56Y100:SLICE_X73Y124}
resize_pblock [get_pblocks pblock_sgmii_cdc] -add {DSP48_X3Y40:DSP48_X3Y49}
resize_pblock [get_pblocks pblock_sgmii_cdc] -add {RAMB18_X3Y40:RAMB18_X3Y49}
resize_pblock [get_pblocks pblock_sgmii_cdc] -add {RAMB36_X3Y20:RAMB36_X3Y24}
set_property IS_SOFT FALSE [get_pblocks pblock_sgmii_cdc]
add_cells_to_pblock [get_pblocks pblock_sgmii_cdc] [get_cells -quiet [list {buffer/infifo/cdcs[12].cdc} {buffer/infifo/cdcs[13].cdc}]]

create_pblock pblock_xg0_cdc
resize_pblock [get_pblocks pblock_xg0_cdc] -add {SLICE_X20Y150:SLICE_X101Y199}
resize_pblock [get_pblocks pblock_xg0_cdc] -add {DSP48_X1Y60:DSP48_X5Y79}
resize_pblock [get_pblocks pblock_xg0_cdc] -add {RAMB18_X1Y60:RAMB18_X5Y79}
resize_pblock [get_pblocks pblock_xg0_cdc] -add {RAMB36_X1Y30:RAMB36_X5Y39}
set_property IS_SOFT FALSE [get_pblocks pblock_xg0_cdc]
add_cells_to_pblock [get_pblocks pblock_xg0_cdc] [get_cells -quiet [list {buffer/infifo/cdcs[14].cdc}]]


create_pblock pblock_qsgmii_cdc2
resize_pblock [get_pblocks pblock_qsgmii_cdc2] -add {CLOCKREGION_X0Y3:CLOCKREGION_X1Y3}
set_property IS_SOFT FALSE [get_pblocks pblock_qsgmii_cdc2]
add_cells_to_pblock [get_pblocks pblock_qsgmii_cdc2] [get_cells -quiet [list {buffer/infifo/cdcs[0].cdc} {buffer/infifo/cdcs[10].cdc} {buffer/infifo/cdcs[11].cdc} {buffer/infifo/cdcs[1].cdc} {buffer/infifo/cdcs[2].cdc} {buffer/infifo/cdcs[3].cdc} {buffer/infifo/cdcs[4].cdc} {buffer/infifo/cdcs[5].cdc} {buffer/infifo/cdcs[6].cdc} {buffer/infifo/cdcs[7].cdc} {buffer/infifo/cdcs[8].cdc} {buffer/infifo/cdcs[9].cdc}]]

########################################################################################################################
# Floorplanning: clock synthesis blocks

# SGMII clock PLL should be in close proximity to the SGMII logic since that's the highest frequency,
# tightest timing stuff
set_property LOC MMCME2_ADV_X1Y1 [get_cells clk_system/sgmii_mmcm]

# Floorplan the BUFH for some reason becasuse this isn't assigned to the right spot automatically??
# (seems CLOCK_REGION cannot be applied to 7 series BUFH's?)
set_property LOC BUFHCE_X1Y12 [get_cells clk_system/buf_400mhz]

# RGMII clock PLL goes above it
set_property LOC MMCME2_ADV_X1Y2 [get_cells clk_system/rgmii_mmcm]

# We don't need dedicated routing for the 125 MHz system clock input,
# since nothing is synchronous to it
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk_system/sysclk_in]

########################################################################################################################
# Floorplanning: RAM

create_pblock pblock_ram
resize_pblock [get_pblocks pblock_ram] -add {SLICE_X0Y50:SLICE_X23Y199}
resize_pblock [get_pblocks pblock_ram] -add {DSP48_X0Y20:DSP48_X1Y79}
resize_pblock [get_pblocks pblock_ram] -add {RAMB18_X0Y20:RAMB18_X1Y79}
resize_pblock [get_pblocks pblock_ram] -add {RAMB36_X0Y10:RAMB36_X1Y39}
add_cells_to_pblock [get_pblocks pblock_ram] [get_cells -quiet [list buffer/infifo/decc_hi buffer/infifo/decc_lo buffer/infifo/ecc_hi buffer/infifo/ecc_lo]]

########################################################################################################################
# Floorplanning: SGMII g13

create_pblock pblock_sgmii
resize_pblock [get_pblocks pblock_sgmii] -add {SLICE_X92Y50:SLICE_X109Y99}
resize_pblock [get_pblocks pblock_sgmii] -add {DSP48_X5Y20:DSP48_X5Y39}
resize_pblock [get_pblocks pblock_sgmii] -add {RAMB18_X6Y20:RAMB18_X6Y39}
resize_pblock [get_pblocks pblock_sgmii] -add {RAMB36_X6Y10:RAMB36_X6Y19}
set_property IS_SOFT FALSE [get_pblocks pblock_sgmii]
add_cells_to_pblock [get_pblocks pblock_sgmii] [get_cells -quiet [list interfaces/port_g12 interfaces/port_g13]]

set_property LOC SLICE_X109Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_reg[0]}]
set_property LOC SLICE_X109Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_reg[1]}]
set_property LOC SLICE_X109Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_reg[2]}]
set_property LOC SLICE_X109Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_reg[3]}]

set_property LOC SLICE_X109Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_reg[7]}]
set_property LOC SLICE_X109Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_reg[6]}]
set_property LOC SLICE_X109Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_reg[5]}]
set_property LOC SLICE_X109Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_reg[4]}]

set_property LOC SLICE_X109Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_reg[0]}]
set_property LOC SLICE_X109Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_reg[1]}]
set_property LOC SLICE_X109Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_reg[2]}]
set_property LOC SLICE_X109Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_reg[3]}]

set_property LOC SLICE_X109Y81 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_reg[5]}]

set_property LOC SLICE_X108Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_2x_reg[0]}]
set_property LOC SLICE_X108Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_2x_reg[1]}]
set_property LOC SLICE_X108Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_2x_reg[2]}]
set_property LOC SLICE_X108Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_2x_reg[3]}]

set_property LOC SLICE_X108Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_2x_reg[7]}]
set_property LOC SLICE_X108Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_2x_reg[6]}]
set_property LOC SLICE_X108Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_2x_reg[5]}]
set_property LOC SLICE_X108Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_2x_reg[4]}]

set_property LOC SLICE_X108Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_2x_reg[0]}]
set_property LOC SLICE_X108Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_2x_reg[1]}]
set_property LOC SLICE_X108Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_2x_reg[2]}]
set_property LOC SLICE_X108Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_2x_reg[3]}]

set_property LOC SLICE_X108Y81 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_2x_reg[7]}]
set_property LOC SLICE_X108Y81 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_2x_reg[6]}]
set_property LOC SLICE_X108Y81 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_2x_reg[5]}]
set_property LOC SLICE_X108Y81 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_2x_reg[4]}]

set_property LOC SLICE_X107Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_sync_reg[0]}]
set_property LOC SLICE_X107Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_sync_reg[1]}]
set_property LOC SLICE_X107Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_sync_reg[2]}]
set_property LOC SLICE_X107Y84 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_sync_reg[3]}]

set_property LOC SLICE_X107Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_sync_reg[7]}]
set_property LOC SLICE_X107Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_sync_reg[6]}]
set_property LOC SLICE_X107Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_sync_reg[5]}]
set_property LOC SLICE_X107Y83 [get_cells {interfaces/port_g13/bridge/cdr/samples_hi_sync_reg[4]}]

set_property LOC SLICE_X107Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_sync_reg[0]}]
set_property LOC SLICE_X107Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_sync_reg[1]}]
set_property LOC SLICE_X107Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_sync_reg[2]}]
set_property LOC SLICE_X107Y82 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_sync_reg[3]}]

set_property LOC SLICE_X107Y81 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_sync_reg[7]}]
set_property LOC SLICE_X107Y81 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_sync_reg[6]}]
set_property LOC SLICE_X107Y81 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_sync_reg[5]}]
set_property LOC SLICE_X107Y81 [get_cells {interfaces/port_g13/bridge/cdr/samples_lo_sync_reg[4]}]

########################################################################################################################
# Floorplanning: SGMII g12

set_property LOC SLICE_X109Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_reg[0]}]
set_property LOC SLICE_X109Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_reg[1]}]
set_property LOC SLICE_X109Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_reg[2]}]
set_property LOC SLICE_X109Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_reg[3]}]

set_property LOC SLICE_X109Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_reg[7]}]
set_property LOC SLICE_X109Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_reg[6]}]
set_property LOC SLICE_X109Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_reg[5]}]
set_property LOC SLICE_X109Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_reg[4]}]

set_property LOC SLICE_X109Y72 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_reg[3]}]

set_property LOC SLICE_X109Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_reg[6]}]
set_property LOC SLICE_X109Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_reg[5]}]

set_property LOC SLICE_X108Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_2x_reg[0]}]
set_property LOC SLICE_X108Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_2x_reg[1]}]
set_property LOC SLICE_X108Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_2x_reg[2]}]
set_property LOC SLICE_X108Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_2x_reg[3]}]

set_property LOC SLICE_X108Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_2x_reg[7]}]
set_property LOC SLICE_X108Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_2x_reg[6]}]
set_property LOC SLICE_X108Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_2x_reg[5]}]
set_property LOC SLICE_X108Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_2x_reg[4]}]

set_property LOC SLICE_X108Y72 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_2x_reg[0]}]
set_property LOC SLICE_X108Y72 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_2x_reg[1]}]
set_property LOC SLICE_X108Y72 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_2x_reg[2]}]
set_property LOC SLICE_X108Y72 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_2x_reg[3]}]

set_property LOC SLICE_X108Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_2x_reg[7]}]
set_property LOC SLICE_X108Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_2x_reg[6]}]
set_property LOC SLICE_X108Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_2x_reg[5]}]
set_property LOC SLICE_X108Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_2x_reg[4]}]

set_property LOC SLICE_X107Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_sync_reg[0]}]
set_property LOC SLICE_X107Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_sync_reg[1]}]
set_property LOC SLICE_X107Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_sync_reg[2]}]
set_property LOC SLICE_X107Y74 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_sync_reg[3]}]

set_property LOC SLICE_X107Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_sync_reg[7]}]
set_property LOC SLICE_X107Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_sync_reg[6]}]
set_property LOC SLICE_X107Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_sync_reg[5]}]
set_property LOC SLICE_X107Y73 [get_cells {interfaces/port_g12/bridge/cdr/samples_hi_sync_reg[4]}]

set_property LOC SLICE_X107Y72 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_sync_reg[0]}]
set_property LOC SLICE_X107Y72 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_sync_reg[1]}]
set_property LOC SLICE_X107Y72 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_sync_reg[2]}]
set_property LOC SLICE_X107Y72 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_sync_reg[3]}]

set_property LOC SLICE_X107Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_sync_reg[7]}]
set_property LOC SLICE_X107Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_sync_reg[6]}]
set_property LOC SLICE_X107Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_sync_reg[5]}]
set_property LOC SLICE_X107Y71 [get_cells {interfaces/port_g12/bridge/cdr/samples_lo_sync_reg[4]}]

########################################################################################################################
# Floorplanning: RGMII mgmt0

create_pblock pblock_rgmii
add_cells_to_pblock [get_pblocks pblock_rgmii] [get_cells -quiet [list mgmt/rx_fifo]]
resize_pblock [get_pblocks pblock_rgmii] -add {SLICE_X102Y100:SLICE_X109Y149}
resize_pblock [get_pblocks pblock_rgmii] -add {RAMB18_X6Y40:RAMB18_X6Y59}
resize_pblock [get_pblocks pblock_rgmii] -add {RAMB36_X6Y20:RAMB36_X6Y29}
set_property IS_SOFT FALSE [get_pblocks pblock_rgmii]


#######################################################################################################################
# Floorplanning: QSGMII

create_pblock pblock_qsgmii
resize_pblock [get_pblocks pblock_qsgmii] -add {SLICE_X36Y150:SLICE_X101Y199}
resize_pblock [get_pblocks pblock_qsgmii] -add {DSP48_X2Y60:DSP48_X5Y79}
resize_pblock [get_pblocks pblock_qsgmii] -add {RAMB18_X2Y60:RAMB18_X5Y79}
resize_pblock [get_pblocks pblock_qsgmii] -add {RAMB36_X2Y30:RAMB36_X5Y39}
set_property IS_SOFT FALSE [get_pblocks pblock_qsgmii]
add_cells_to_pblock [get_pblocks pblock_qsgmii] [get_cells -quiet [list interfaces/port_g0_g11 {interfaces/qsgmii[0].quad} {interfaces/qsgmii[1].quad} {interfaces/qsgmii[2].quad}]]

#######################################################################################################################
# Floorplanning: SFP+ xg0

create_pblock pblock_10g
resize_pblock [get_pblocks pblock_10g] -add {SLICE_X36Y175:SLICE_X101Y209}
resize_pblock [get_pblocks pblock_10g] -add {DSP48_X2Y70:DSP48_X5Y83}
resize_pblock [get_pblocks pblock_10g] -add {RAMB18_X2Y70:RAMB18_X5Y83}
resize_pblock [get_pblocks pblock_10g] -add {RAMB36_X2Y35:RAMB36_X5Y41}
set_property IS_SOFT FALSE [get_pblocks pblock_10g]
add_cells_to_pblock [get_pblocks pblock_10g] [get_cells -quiet [list interfaces/port_xg0 interfaces/xg_transceiver]]

#######################################################################################################################
# Floorplanning: metadata FIFO

create_pblock pblock_metafifo
resize_pblock [get_pblocks pblock_metafifo] -add {SLICE_X0Y100:SLICE_X23Y224}
resize_pblock [get_pblocks pblock_metafifo] -add {DSP48_X0Y40:DSP48_X1Y89}
resize_pblock [get_pblocks pblock_metafifo] -add {RAMB18_X0Y40:RAMB18_X1Y89}
resize_pblock [get_pblocks pblock_metafifo] -add {RAMB36_X0Y20:RAMB36_X1Y44}
set_property IS_SOFT FALSE [get_pblocks pblock_metafifo]
add_cells_to_pblock [get_pblocks pblock_metafifo] [get_cells -quiet [list {buffer/infifo/metafifo[0].fifo} {buffer/infifo/metafifo[10].fifo} {buffer/infifo/metafifo[11].fifo} {buffer/infifo/metafifo[12].fifo} {buffer/infifo/metafifo[13].fifo} {buffer/infifo/metafifo[14].fifo} {buffer/infifo/metafifo[1].fifo} {buffer/infifo/metafifo[2].fifo} {buffer/infifo/metafifo[3].fifo} {buffer/infifo/metafifo[4].fifo} {buffer/infifo/metafifo[5].fifo} {buffer/infifo/metafifo[6].fifo} {buffer/infifo/metafifo[7].fifo} {buffer/infifo/metafifo[8].fifo} {buffer/infifo/metafifo[9].fifo}]]

#######################################################################################################################
# Floorplanning: prefetcher

set_property PARENT pblock_metafifo [get_pblocks pblock_prefetch]
set_property PARENT pblock_metafifo [get_pblocks pblock_prefetch]
set_property PARENT pblock_metafifo [get_pblocks pblock_prefetch]
set_property PARENT pblock_metafifo [get_pblocks pblock_prefetch]
set_property PARENT pblock_metafifo [get_pblocks pblock_prefetch]
set_property PARENT pblock_metafifo [get_pblocks pblock_prefetch]
set_property PARENT pblock_metafifo [get_pblocks pblock_prefetch]
set_property PARENT pblock_metafifo [get_pblocks pblock_prefetch]
create_pblock pblock_prefetch
resize_pblock [get_pblocks pblock_prefetch] -add {SLICE_X0Y100:SLICE_X23Y124}
resize_pblock [get_pblocks pblock_prefetch] -add {DSP48_X0Y40:DSP48_X1Y49}
resize_pblock [get_pblocks pblock_prefetch] -add {RAMB18_X0Y40:RAMB18_X1Y49}
resize_pblock [get_pblocks pblock_prefetch] -add {RAMB36_X0Y20:RAMB36_X1Y24}
add_cells_to_pblock [get_pblocks pblock_prefetch] [get_cells -quiet [list buffer/infifo/prefetch_fifo buffer/infifo/tagfifo]]

#######################################################################################################################
# Floorplanning: MAC address table

create_pblock pblock_mactable
resize_pblock [get_pblocks pblock_mactable] -add {SLICE_X0Y45:SLICE_X55Y99}
resize_pblock [get_pblocks pblock_mactable] -add {DSP48_X0Y18:DSP48_X2Y39}
resize_pblock [get_pblocks pblock_mactable] -add {RAMB18_X0Y18:RAMB18_X2Y39}
resize_pblock [get_pblocks pblock_mactable] -add {RAMB36_X0Y9:RAMB36_X2Y19}
set_property IS_SOFT FALSE [get_pblocks pblock_mactable]
add_cells_to_pblock [get_pblocks pblock_mactable] [get_cells -quiet [list fwd]]

#######################################################################################################################
# Floorplanning: QSPI management

create_pblock pblock_qspi
add_cells_to_pblock [get_pblocks pblock_qspi] [get_cells -quiet [list mgmt/bridge]]
resize_pblock [get_pblocks pblock_qspi] -add {SLICE_X0Y200:SLICE_X7Y224}
set_property IS_SOFT FALSE [get_pblocks pblock_qspi]
create_pblock pblock_mgmt
add_cells_to_pblock [get_pblocks pblock_mgmt] [get_cells -quiet [list \
          mgmt/info \
          {mgmt/mgmt_rd_data_ff_reg[0]} \
          {mgmt/mgmt_rd_data_ff_reg[1]} \
          {mgmt/mgmt_rd_data_ff_reg[2]} \
          {mgmt/mgmt_rd_data_ff_reg[3]} \
          {mgmt/mgmt_rd_data_ff_reg[4]} \
          {mgmt/mgmt_rd_data_ff_reg[5]} \
          {mgmt/mgmt_rd_data_ff_reg[6]} \
          {mgmt/mgmt_rd_data_ff_reg[7]} \
          mgmt/mgmt_rd_valid_ff_reg \
          mgmt/regs \
          mgmt/sensors \
          mgmt/tach0 \
          mgmt/tach1]]
resize_pblock [get_pblocks pblock_mgmt] -add {SLICE_X36Y75:SLICE_X55Y174}
resize_pblock [get_pblocks pblock_mgmt] -add {DSP48_X2Y30:DSP48_X2Y69}
resize_pblock [get_pblocks pblock_mgmt] -add {RAMB18_X2Y30:RAMB18_X2Y69}
resize_pblock [get_pblocks pblock_mgmt] -add {RAMB36_X2Y15:RAMB36_X2Y34}
set_property IS_SOFT FALSE [get_pblocks pblock_mgmt]

#######################################################################################################################
# Floorplanning: x25519 crypto accelerator

create_pblock pblock_crypto
add_cells_to_pblock [get_pblocks pblock_crypto] [get_cells -quiet [list crypt25519]]
resize_pblock [get_pblocks pblock_crypto] -add {SLICE_X48Y0:SLICE_X109Y49}
resize_pblock [get_pblocks pblock_crypto] -add {DSP48_X3Y0:DSP48_X5Y19}
resize_pblock [get_pblocks pblock_crypto] -add {RAMB18_X3Y0:RAMB18_X6Y19}
resize_pblock [get_pblocks pblock_crypto] -add {RAMB36_X3Y0:RAMB36_X6Y9}
set_property IS_SOFT FALSE [get_pblocks pblock_crypto]

########################################################################################################################
# I/O timing

#set_input_delay -clock [get_clocks mgmt0_rx_clk] -clock_fall -min -add_delay 1.000 [get_ports {mgmt0_rxd[*]}]
#set_input_delay -clock [get_clocks mgmt0_rx_clk] -clock_fall -max -add_delay 3.000 [get_ports {mgmt0_rxd[*]}]
#set_input_delay -clock [get_clocks mgmt0_rx_clk] -min -add_delay 1.000 [get_ports {mgmt0_rxd[*]}]
#set_input_delay -clock [get_clocks mgmt0_rx_clk] -max -add_delay 3.000 [get_ports {mgmt0_rxd[*]}]
#set_input_delay -clock [get_clocks mgmt0_rx_clk] -clock_fall -min -add_delay 1.000 [get_ports mgmt0_rx_dv]
#set_input_delay -clock [get_clocks mgmt0_rx_clk] -clock_fall -max -add_delay 3.000 [get_ports mgmt0_rx_dv]
#set_input_delay -clock [get_clocks mgmt0_rx_clk] -min -add_delay 1.000 [get_ports mgmt0_rx_dv]
#set_input_delay -clock [get_clocks mgmt0_rx_clk] -max -add_delay 3.000 [get_ports mgmt0_rx_dv]

#set_output_delay -clock [get_clocks clk_125mhz_p] -clock_fall -min -add_delay -1.200 [get_ports {mgmt0_txd[*]}]
#set_output_delay -clock [get_clocks clk_125mhz_p] -clock_fall -max -add_delay 1.200 [get_ports {mgmt0_txd[*]}]
#set_output_delay -clock [get_clocks clk_125mhz_p] -min -add_delay -1.200 [get_ports {mgmt0_txd[*]}]
#set_output_delay -clock [get_clocks clk_125mhz_p] -max -add_delay 1.200 [get_ports {mgmt0_txd[*]}]

# TODO: debug these
#create_clock -period 5.333 -name VIRTUAL_clk_ram_ctl_raw -waveform {0.000 2.667}
#create_clock -period 2.667 -name VIRTUAL_clk_ram_raw -waveform {0.000 1.333}
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -clock_fall -min -add_delay -0.275 [get_ports {qdr_a[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -clock_fall -max -add_delay 0.275 [get_ports {qdr_a[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -min -add_delay -0.275 [get_ports {qdr_a[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -max -add_delay 0.275 [get_ports {qdr_a[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -clock_fall -min -add_delay -0.220 [get_ports {qdr_bws_n[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -clock_fall -max -add_delay 0.220 [get_ports {qdr_bws_n[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -min -add_delay -0.220 [get_ports {qdr_bws_n[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -max -add_delay 0.220 [get_ports {qdr_bws_n[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_raw] -clock_fall -min -add_delay -0.220 [get_ports {qdr_d[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_raw] -clock_fall -max -add_delay 0.220 [get_ports {qdr_d[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_raw] -min -add_delay -0.220 [get_ports {qdr_d[*]}]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_raw] -max -add_delay 0.220 [get_ports {qdr_d[*]}]
#set_output_delay -clock [get_clocks clk_125mhz_p] -clock_fall -min -add_delay -1.200 [get_ports mgmt0_tx_en]
#set_output_delay -clock [get_clocks clk_125mhz_p] -clock_fall -max -add_delay 1.200 [get_ports mgmt0_tx_en]
#set_output_delay -clock [get_clocks clk_125mhz_p] -min -add_delay -1.200 [get_ports mgmt0_tx_en]
#set_output_delay -clock [get_clocks clk_125mhz_p] -max -add_delay 1.200 [get_ports mgmt0_tx_en]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -clock_fall -min -add_delay -0.275 [get_ports qdr_rps_n]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -clock_fall -max -add_delay 0.275 [get_ports qdr_rps_n]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -min -add_delay -0.275 [get_ports qdr_rps_n]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -max -add_delay 0.275 [get_ports qdr_rps_n]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -clock_fall -min -add_delay -0.275 [get_ports qdr_wps_n]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -clock_fall -max -add_delay 0.275 [get_ports qdr_wps_n]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -min -add_delay -0.275 [get_ports qdr_wps_n]
#set_output_delay -clock [get_clocks VIRTUAL_clk_ram_ctl_raw] -max -add_delay 0.275 [get_ports qdr_wps_n]

########################################################################################################################
# Configuration mode

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

########################################################################################################################
# Debug clocking

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_125mhz]
