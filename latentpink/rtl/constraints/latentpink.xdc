set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list {buffer/infifo/cdcs[0].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/data_mem/storage_reg_0_i_3} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/data_mem/storage_reg_0_i_7__9} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_16} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_17} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9} \
          {buffer/infifo/cdcs[0].cdc/untagger/storage_reg_0_63_0_2_i_1} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/data_mem/storage_reg_0_i_3__5} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/data_mem/storage_reg_0_i_6__17} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__4} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__5} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__5} \
          {buffer/infifo/cdcs[10].cdc/untagger/storage_reg_0_63_0_2_i_1__5} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/data_mem/storage_reg_0_i_3__6} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/data_mem/storage_reg_0_i_6__14} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/data_mem/storage_reg_0_i_6__16} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__0} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__5} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__6} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__6} \
          {buffer/infifo/cdcs[11].cdc/untagger/storage_reg_0_63_0_2_i_1__6} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/data_mem/storage_reg_0_i_3__7} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__1} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__6} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__7} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__7} \
          {buffer/infifo/cdcs[12].cdc/untagger/storage_reg_0_63_0_2_i_1__7} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/data_mem/storage_reg_0_i_3__8} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__2} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__7} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__8} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__8} \
          {buffer/infifo/cdcs[13].cdc/untagger/storage_reg_0_63_0_2_i_1__8} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/data_mem/storage_reg_0_i_3__9} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__3} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__8} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__9} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__9} \
          {buffer/infifo/cdcs[14].cdc/untagger/storage_reg_0_63_0_2_i_1__9} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/data_mem/storage_reg_0_i_3__0} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/data_mem/storage_reg_0_i_6__18} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_16__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__0} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__0} \
          {buffer/infifo/cdcs[1].cdc/untagger/storage_reg_0_63_0_2_i_1__0} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__13} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__13} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__13} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__13} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__13} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__13} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__28} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__28} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__28} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__28} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__28} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__13} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__13} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__13} \
          {buffer/infifo/cdcs[2].cdc/untagger/storage_reg_0_63_0_2_i_1__13} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/data_mem/storage_reg_0_i_3__20} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/data_mem/storage_reg_0_i_3__21} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/data_mem/storage_reg_0_i_3__22} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/data_mem/storage_reg_0_i_3__23} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__12} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__12} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__12} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__12} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__12} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__12} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__27} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__27} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__27} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__27} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__27} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__12} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__12} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__12} \
          {buffer/infifo/cdcs[3].cdc/untagger/storage_reg_0_63_0_2_i_1__12} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__11} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__11} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__11} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__11} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__11} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__11} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__26} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__26} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__26} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__26} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__26} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__11} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__11} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__11} \
          {buffer/infifo/cdcs[4].cdc/untagger/storage_reg_0_63_0_2_i_1__11} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/data_mem/storage_reg_0_i_3__1} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_16__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__0} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__1} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__1} \
          {buffer/infifo/cdcs[5].cdc/untagger/storage_reg_0_63_0_2_i_1__1} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/data_mem/storage_reg_0_i_3__2} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_16__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__1} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__2} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__2} \
          {buffer/infifo/cdcs[6].cdc/untagger/storage_reg_0_63_0_2_i_1__2} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/data_mem/storage_reg_0_i_3__3} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/data_mem/storage_reg_0_i_6__19} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_16__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__2} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__3} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__3} \
          {buffer/infifo/cdcs[7].cdc/untagger/storage_reg_0_63_0_2_i_1__3} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__10} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__10} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__10} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__10} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__10} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__10} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__25} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__25} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__25} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__25} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__25} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__10} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__10} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__10} \
          {buffer/infifo/cdcs[8].cdc/untagger/storage_reg_0_63_0_2_i_1__10} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/data_mem/storage_reg_0} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/data_mem/storage_reg_0_i_3__4} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/data_mem/storage_reg_0_i_6__15} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/data_mem/storage_reg_1} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_12_14} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_15_17} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_18_20} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_21_22} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_9_11} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_16__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__3} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__4} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__4} \
          {buffer/infifo/cdcs[9].cdc/untagger/storage_reg_0_63_0_2_i_1__4} \
          {buffer/infifo/metafifo[0].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[0].fifo/mem/storage_reg_0_i_1__10} \
          {buffer/infifo/metafifo[0].fifo/mem/storage_reg_0_i_2__10} \
          {buffer/infifo/metafifo[0].fifo/mem/storage_reg_0_i_3__10} \
          {buffer/infifo/metafifo[0].fifo/mem/storage_reg_0_i_4__10} \
          {buffer/infifo/metafifo[0].fifo/mem/storage_reg_0_i_5__10} \
          {buffer/infifo/metafifo[0].fifo/mem/storage_reg_0_i_6__4} \
          {buffer/infifo/metafifo[0].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[0].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[10].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[10].fifo/mem/storage_reg_0_i_1__15} \
          {buffer/infifo/metafifo[10].fifo/mem/storage_reg_0_i_2__15} \
          {buffer/infifo/metafifo[10].fifo/mem/storage_reg_0_i_3__15} \
          {buffer/infifo/metafifo[10].fifo/mem/storage_reg_0_i_4__15} \
          {buffer/infifo/metafifo[10].fifo/mem/storage_reg_0_i_5__15} \
          {buffer/infifo/metafifo[10].fifo/mem/storage_reg_0_i_6__9} \
          {buffer/infifo/metafifo[10].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[10].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[11].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[11].fifo/mem/storage_reg_0_i_1__16} \
          {buffer/infifo/metafifo[11].fifo/mem/storage_reg_0_i_2__16} \
          {buffer/infifo/metafifo[11].fifo/mem/storage_reg_0_i_3__16} \
          {buffer/infifo/metafifo[11].fifo/mem/storage_reg_0_i_4__16} \
          {buffer/infifo/metafifo[11].fifo/mem/storage_reg_0_i_5__16} \
          {buffer/infifo/metafifo[11].fifo/mem/storage_reg_0_i_6__10} \
          {buffer/infifo/metafifo[11].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[11].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[12].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[12].fifo/mem/storage_reg_0_i_1__17} \
          {buffer/infifo/metafifo[12].fifo/mem/storage_reg_0_i_2__17} \
          {buffer/infifo/metafifo[12].fifo/mem/storage_reg_0_i_3__17} \
          {buffer/infifo/metafifo[12].fifo/mem/storage_reg_0_i_4__17} \
          {buffer/infifo/metafifo[12].fifo/mem/storage_reg_0_i_5__17} \
          {buffer/infifo/metafifo[12].fifo/mem/storage_reg_0_i_6__11} \
          {buffer/infifo/metafifo[12].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[12].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[13].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[13].fifo/mem/storage_reg_0_i_1__18} \
          {buffer/infifo/metafifo[13].fifo/mem/storage_reg_0_i_2__18} \
          {buffer/infifo/metafifo[13].fifo/mem/storage_reg_0_i_3__18} \
          {buffer/infifo/metafifo[13].fifo/mem/storage_reg_0_i_4__18} \
          {buffer/infifo/metafifo[13].fifo/mem/storage_reg_0_i_5__18} \
          {buffer/infifo/metafifo[13].fifo/mem/storage_reg_0_i_6__12} \
          {buffer/infifo/metafifo[13].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[13].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[14].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[14].fifo/mem/storage_reg_0_i_1__19} \
          {buffer/infifo/metafifo[14].fifo/mem/storage_reg_0_i_2__19} \
          {buffer/infifo/metafifo[14].fifo/mem/storage_reg_0_i_3__19} \
          {buffer/infifo/metafifo[14].fifo/mem/storage_reg_0_i_4__19} \
          {buffer/infifo/metafifo[14].fifo/mem/storage_reg_0_i_5__19} \
          {buffer/infifo/metafifo[14].fifo/mem/storage_reg_0_i_6__13} \
          {buffer/infifo/metafifo[14].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[14].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[1].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[1].fifo/mem/storage_reg_0_i_1__11} \
          {buffer/infifo/metafifo[1].fifo/mem/storage_reg_0_i_2__11} \
          {buffer/infifo/metafifo[1].fifo/mem/storage_reg_0_i_3__11} \
          {buffer/infifo/metafifo[1].fifo/mem/storage_reg_0_i_4__11} \
          {buffer/infifo/metafifo[1].fifo/mem/storage_reg_0_i_5__11} \
          {buffer/infifo/metafifo[1].fifo/mem/storage_reg_0_i_6__5} \
          {buffer/infifo/metafifo[1].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[1].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[2].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[2].fifo/mem/storage_reg_0_i_1__24} \
          {buffer/infifo/metafifo[2].fifo/mem/storage_reg_0_i_2__24} \
          {buffer/infifo/metafifo[2].fifo/mem/storage_reg_0_i_3__28} \
          {buffer/infifo/metafifo[2].fifo/mem/storage_reg_0_i_4__24} \
          {buffer/infifo/metafifo[2].fifo/mem/storage_reg_0_i_5__24} \
          {buffer/infifo/metafifo[2].fifo/mem/storage_reg_0_i_6__24} \
          {buffer/infifo/metafifo[2].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[2].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[3].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[3].fifo/mem/storage_reg_0_i_1__23} \
          {buffer/infifo/metafifo[3].fifo/mem/storage_reg_0_i_2__23} \
          {buffer/infifo/metafifo[3].fifo/mem/storage_reg_0_i_3__27} \
          {buffer/infifo/metafifo[3].fifo/mem/storage_reg_0_i_4__23} \
          {buffer/infifo/metafifo[3].fifo/mem/storage_reg_0_i_5__23} \
          {buffer/infifo/metafifo[3].fifo/mem/storage_reg_0_i_6__23} \
          {buffer/infifo/metafifo[3].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[3].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[4].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[4].fifo/mem/storage_reg_0_i_1__22} \
          {buffer/infifo/metafifo[4].fifo/mem/storage_reg_0_i_2__22} \
          {buffer/infifo/metafifo[4].fifo/mem/storage_reg_0_i_3__26} \
          {buffer/infifo/metafifo[4].fifo/mem/storage_reg_0_i_4__22} \
          {buffer/infifo/metafifo[4].fifo/mem/storage_reg_0_i_5__22} \
          {buffer/infifo/metafifo[4].fifo/mem/storage_reg_0_i_6__22} \
          {buffer/infifo/metafifo[4].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[4].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[5].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[5].fifo/mem/storage_reg_0_i_1__21} \
          {buffer/infifo/metafifo[5].fifo/mem/storage_reg_0_i_2__21} \
          {buffer/infifo/metafifo[5].fifo/mem/storage_reg_0_i_3__25} \
          {buffer/infifo/metafifo[5].fifo/mem/storage_reg_0_i_4__21} \
          {buffer/infifo/metafifo[5].fifo/mem/storage_reg_0_i_5__21} \
          {buffer/infifo/metafifo[5].fifo/mem/storage_reg_0_i_6__21} \
          {buffer/infifo/metafifo[5].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[5].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[6].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[6].fifo/mem/storage_reg_0_i_1__12} \
          {buffer/infifo/metafifo[6].fifo/mem/storage_reg_0_i_2__12} \
          {buffer/infifo/metafifo[6].fifo/mem/storage_reg_0_i_3__12} \
          {buffer/infifo/metafifo[6].fifo/mem/storage_reg_0_i_4__12} \
          {buffer/infifo/metafifo[6].fifo/mem/storage_reg_0_i_5__12} \
          {buffer/infifo/metafifo[6].fifo/mem/storage_reg_0_i_6__6} \
          {buffer/infifo/metafifo[6].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[6].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[7].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[7].fifo/mem/storage_reg_0_i_1__13} \
          {buffer/infifo/metafifo[7].fifo/mem/storage_reg_0_i_2__13} \
          {buffer/infifo/metafifo[7].fifo/mem/storage_reg_0_i_3__13} \
          {buffer/infifo/metafifo[7].fifo/mem/storage_reg_0_i_4__13} \
          {buffer/infifo/metafifo[7].fifo/mem/storage_reg_0_i_5__13} \
          {buffer/infifo/metafifo[7].fifo/mem/storage_reg_0_i_6__7} \
          {buffer/infifo/metafifo[7].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[7].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[8].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[8].fifo/mem/storage_reg_0_i_1__20} \
          {buffer/infifo/metafifo[8].fifo/mem/storage_reg_0_i_2__20} \
          {buffer/infifo/metafifo[8].fifo/mem/storage_reg_0_i_3__24} \
          {buffer/infifo/metafifo[8].fifo/mem/storage_reg_0_i_4__20} \
          {buffer/infifo/metafifo[8].fifo/mem/storage_reg_0_i_5__20} \
          {buffer/infifo/metafifo[8].fifo/mem/storage_reg_0_i_6__20} \
          {buffer/infifo/metafifo[8].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[8].fifo/mem/storage_reg_2} \
          {buffer/infifo/metafifo[9].fifo/mem/storage_reg_0} \
          {buffer/infifo/metafifo[9].fifo/mem/storage_reg_0_i_1__14} \
          {buffer/infifo/metafifo[9].fifo/mem/storage_reg_0_i_2__14} \
          {buffer/infifo/metafifo[9].fifo/mem/storage_reg_0_i_3__14} \
          {buffer/infifo/metafifo[9].fifo/mem/storage_reg_0_i_4__14} \
          {buffer/infifo/metafifo[9].fifo/mem/storage_reg_0_i_5__14} \
          {buffer/infifo/metafifo[9].fifo/mem/storage_reg_0_i_6__8} \
          {buffer/infifo/metafifo[9].fifo/mem/storage_reg_1} \
          {buffer/infifo/metafifo[9].fifo/mem/storage_reg_2} \
          buffer/infifo/prefetch_fifo/mem/storage_reg_0 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_1 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_10 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_11 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_12 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_13 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_14 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_15 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_16 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_17 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_18 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_19 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_2 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_20 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_21 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_22 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_23 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_24 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_25 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_26 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_27 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_28 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_29 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_3 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_30 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_31 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_32 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_33 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_34 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_35 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_36 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_37 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_38 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_39 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_4 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_40 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_41 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_42 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_43 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_44 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_45 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_46 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_47 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_48 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_49 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_5 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_50 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_51 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_52 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_53 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_54 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_55 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_56 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_57 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_58 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_6 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_7 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_8 \
          buffer/infifo/prefetch_fifo/mem/storage_reg_1_i_9 \
          buffer/infifo/tagfifo/mem/storage_reg_0_31_0_3 \
          buffer/infifo/tagfifo/mem/storage_reg_0_31_0_3_i_1 \
          buffer/infifo/tagfifo/mem/storage_reg_0_31_0_3_i_2 \
          buffer/infifo/tagfifo/mem/storage_reg_0_31_0_3_i_3 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_0_5 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_102_107 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_108_113 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_114_119 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_120_125 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_126_131 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_12_17 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_132_137 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_138_143 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_18_23 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_24_29 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_30_35 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_36_41 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_42_47 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_48_53 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_54_59 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_60_65 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_66_71 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_6_11 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_72_77 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_78_83 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_84_89 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_90_95 \
          buffer/qdr/fifo/fifomem/storage_reg_0_31_96_101 \
          {fwd/mactable/sets[0].mem/storage_reg_0} \
          {fwd/mactable/sets[0].mem/storage_reg_0_i_42} \
          {fwd/mactable/sets[0].mem/storage_reg_0_i_86} \
          {fwd/mactable/sets[0].mem/storage_reg_1} \
          {fwd/mactable/sets[0].mem/storage_reg_2} \
          {fwd/mactable/sets[0].mem/storage_reg_3} \
          {fwd/mactable/sets[0].mem/storage_reg_3_i_13} \
          {fwd/mactable/sets[0].mem/storage_reg_3_i_2} \
          {fwd/mactable/sets[1].mem/storage_reg_0} \
          {fwd/mactable/sets[1].mem/storage_reg_0_i_1__2} \
          {fwd/mactable/sets[1].mem/storage_reg_0_i_2__0} \
          {fwd/mactable/sets[1].mem/storage_reg_1} \
          {fwd/mactable/sets[1].mem/storage_reg_2} \
          {fwd/mactable/sets[1].mem/storage_reg_3} \
          {fwd/mactable/sets[2].mem/storage_reg_0} \
          {fwd/mactable/sets[2].mem/storage_reg_0_i_1__1} \
          {fwd/mactable/sets[2].mem/storage_reg_0_i_2__1} \
          {fwd/mactable/sets[2].mem/storage_reg_1} \
          {fwd/mactable/sets[2].mem/storage_reg_2} \
          {fwd/mactable/sets[2].mem/storage_reg_3} \
          {fwd/mactable/sets[3].mem/storage_reg_0} \
          {fwd/mactable/sets[3].mem/storage_reg_0_i_1__0} \
          {fwd/mactable/sets[3].mem/storage_reg_0_i_2__2} \
          {fwd/mactable/sets[3].mem/storage_reg_0_i_89} \
          {fwd/mactable/sets[3].mem/storage_reg_1} \
          {fwd/mactable/sets[3].mem/storage_reg_2} \
          {fwd/mactable/sets[3].mem/storage_reg_3} \
          {fwd/mactable/sets[4].mem/storage_reg_0} \
          {fwd/mactable/sets[4].mem/storage_reg_0_i_1__6} \
          {fwd/mactable/sets[4].mem/storage_reg_0_i_2__3} \
          {fwd/mactable/sets[4].mem/storage_reg_0_i_88} \
          {fwd/mactable/sets[4].mem/storage_reg_1} \
          {fwd/mactable/sets[4].mem/storage_reg_2} \
          {fwd/mactable/sets[4].mem/storage_reg_3} \
          {fwd/mactable/sets[5].mem/storage_reg_0} \
          {fwd/mactable/sets[5].mem/storage_reg_0_i_1__5} \
          {fwd/mactable/sets[5].mem/storage_reg_0_i_2__4} \
          {fwd/mactable/sets[5].mem/storage_reg_0_i_3__3} \
          {fwd/mactable/sets[5].mem/storage_reg_1} \
          {fwd/mactable/sets[5].mem/storage_reg_2} \
          {fwd/mactable/sets[5].mem/storage_reg_3} \
          {fwd/mactable/sets[6].mem/storage_reg_0} \
          {fwd/mactable/sets[6].mem/storage_reg_0_i_1__4} \
          {fwd/mactable/sets[6].mem/storage_reg_0_i_2__5} \
          {fwd/mactable/sets[6].mem/storage_reg_0_i_3__2} \
          {fwd/mactable/sets[6].mem/storage_reg_1} \
          {fwd/mactable/sets[6].mem/storage_reg_2} \
          {fwd/mactable/sets[6].mem/storage_reg_3} \
          {fwd/mactable/sets[7].mem/storage_reg_0} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_1} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_10} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_11} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_12} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_13} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_14} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_15} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_16} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_17} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_18} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_19} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_1__3} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_2} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_20} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_21} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_22} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_23} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_24} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_25} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_26} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_27} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_28} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_29} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_2__6} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_3} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_30} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_31} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_32} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_33} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_34} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_35} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_36} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_37} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_38} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_39} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_3__0} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_3__1} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_4} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_40} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_41} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_43} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_44} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_45} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_46} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_47} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_48} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_49} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_5} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_50} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_51} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_52} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_53} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_54} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_55} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_56} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_57} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_58} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_59} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_6} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_60} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_61} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_62} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_63} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_64} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_65} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_66} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_67} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_68} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_69} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_7} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_70} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_71} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_72} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_73} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_74} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_75} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_76} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_77} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_78} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_79} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_8} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_80} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_81} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_82} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_83} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_84} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_85} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_87} \
          {fwd/mactable/sets[7].mem/storage_reg_0_i_9} \
          {fwd/mactable/sets[7].mem/storage_reg_1} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_1} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_10} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_11} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_12} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_13} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_14} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_15} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_16} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_17} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_18} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_19} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_2} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_20} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_21} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_22} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_23} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_24} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_25} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_26} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_27} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_28} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_29} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_3} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_30} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_31} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_32} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_33} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_34} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_35} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_36} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_4} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_5} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_6} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_7} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_8} \
          {fwd/mactable/sets[7].mem/storage_reg_1_i_9} \
          {fwd/mactable/sets[7].mem/storage_reg_2} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_1} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_10} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_11} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_12} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_13} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_14} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_15} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_16} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_17} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_18} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_19} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_2} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_20} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_21} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_22} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_23} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_24} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_25} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_26} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_27} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_28} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_29} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_3} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_30} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_31} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_32} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_33} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_34} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_35} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_36} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_37} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_38} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_39} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_4} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_40} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_41} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_42} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_43} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_44} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_45} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_46} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_47} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_48} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_49} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_5} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_50} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_51} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_52} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_53} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_54} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_55} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_56} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_57} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_58} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_59} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_6} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_7} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_8} \
          {fwd/mactable/sets[7].mem/storage_reg_2_i_9} \
          {fwd/mactable/sets[7].mem/storage_reg_3} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_1} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_10} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_11} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_12} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_14} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_15} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_16} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_17} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_18} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_19} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_20} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_21} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_22} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_23} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_3} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_4} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_5} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_6} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_7} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_8} \
          {fwd/mactable/sets[7].mem/storage_reg_3_i_9} \
          interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/storage_reg_0_31_0_5 \
          interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/storage_reg_0_31_6_9 \
          interfaces/port_g12/bridge/rx_decoder/storage_reg_0_31_0_5_i_1__11 \
          interfaces/port_g12/mac/tx_fifo/mem/storage_reg \
          interfaces/port_g12/mac/tx_fifo/mem/storage_reg_i_1__11 \
          interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/storage_reg_0_31_0_5 \
          interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/storage_reg_0_31_6_9 \
          interfaces/port_g13/bridge/rx_decoder/storage_reg_0_31_0_5_i_1__12 \
          interfaces/port_g13/mac/tx_fifo/mem/storage_reg \
          interfaces/port_g13/mac/tx_fifo/mem/storage_reg_i_1__12 \
          interfaces/port_mgmt0/mac/tx_fifo/mem/storage_reg \
          interfaces/port_mgmt0/mac/tx_fifo/mem/storage_reg_i_1__14 \
          interfaces/port_xg0/pcs/tx_elastic/mem/storage_reg \
          interfaces/port_xg0/pcs/tx_elastic/mem/storage_reg_i_1__13 \
          interfaces/port_xg0/pcs/tx_elastic/mem/storage_reg_i_2 \
          interfaces/port_xg0/pcs/tx_elastic/mem/storage_reg_i_3 \
          interfaces/port_xg0/pcs/tx_elastic/mem/storage_reg_i_4 \
          interfaces/port_xg0/pcs/tx_elastic/mem/storage_reg_i_5 \
          interfaces/port_xg0/pcs/tx_elastic/mem/storage_reg_i_6 \
          interfaces/port_xg0/pcs/tx_elastic/mem/storage_reg_i_7 \
          interfaces/port_xg0/pcs/tx_elastic/mem/storage_reg_i_8 \
          {interfaces/qsgmii[0].quad/lanes[0].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].mac/tx_fifo/mem/storage_reg_i_1} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/tx_fifo/mem/storage_reg_i_1__0} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/tx_fifo/mem/storage_reg_i_1__1} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/tx_fifo/mem/storage_reg_i_1__2} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[0].quad/quadsplit/storage_reg_0_31_0_5_i_1} \
          {interfaces/qsgmii[0].quad/quadsplit/storage_reg_0_31_0_5_i_1__0} \
          {interfaces/qsgmii[0].quad/quadsplit/storage_reg_0_31_0_5_i_1__1} \
          {interfaces/qsgmii[0].quad/quadsplit/storage_reg_0_31_0_5_i_1__2} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/tx_fifo/mem/storage_reg_i_1__3} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/tx_fifo/mem/storage_reg_i_1__4} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/tx_fifo/mem/storage_reg_i_1__5} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/tx_fifo/mem/storage_reg_i_1__6} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[1].quad/quadsplit/storage_reg_0_31_0_5_i_1__3} \
          {interfaces/qsgmii[1].quad/quadsplit/storage_reg_0_31_0_5_i_1__4} \
          {interfaces/qsgmii[1].quad/quadsplit/storage_reg_0_31_0_5_i_1__5} \
          {interfaces/qsgmii[1].quad/quadsplit/storage_reg_0_31_0_5_i_1__6} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/tx_fifo/mem/storage_reg_i_1__7} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/tx_fifo/mem/storage_reg_i_1__8} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/tx_fifo/mem/storage_reg_i_1__9} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/tx_fifo/mem/storage_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/tx_fifo/mem/storage_reg_i_1__10} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {interfaces/qsgmii[2].quad/quadsplit/storage_reg_0_31_0_5_i_1__10} \
          {interfaces/qsgmii[2].quad/quadsplit/storage_reg_0_31_0_5_i_1__7} \
          {interfaces/qsgmii[2].quad/quadsplit/storage_reg_0_31_0_5_i_1__8} \
          {interfaces/qsgmii[2].quad/quadsplit/storage_reg_0_31_0_5_i_1__9} \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_1 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_10 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_11 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_12 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_13 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_2 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_3 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_4 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_5 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_6 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_7 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_8 \
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_9]] -to [get_cells [list {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[100]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[101]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[102]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[103]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[104]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[105]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[106]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[107]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[108]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[109]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[10]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[110]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[111]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[112]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[113]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[114]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[115]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[116]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[117]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[118]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[119]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[11]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[120]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[121]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[122]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[123]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[124]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[125]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[126]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[127]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[128]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[129]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[12]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[130]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[131]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[132]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[133]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[134]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[135]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[136]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[137]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[138]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[139]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[13]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[140]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[141]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[142]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[143]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[14]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[15]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[16]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[17]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[18]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[19]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[1]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[20]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[21]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[22]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[23]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[24]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[25]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[26]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[27]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[28]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[29]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[2]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[30]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[31]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[32]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[33]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[34]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[35]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[36]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[37]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[38]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[39]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[3]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[40]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[41]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[42]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[43]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[44]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[45]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[46]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[47]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[48]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[49]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[4]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[50]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[51]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[52]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[53]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[54]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[55]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[56]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[57]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[58]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[59]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[5]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[60]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[61]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[62]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[63]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[64]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[65]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[66]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[67]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[68]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[69]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[6]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[70]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[71]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[73]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[74]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[75]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[76]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[77]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[78]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[79]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[7]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[80]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[81]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[82]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[83]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[84]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[85]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[86]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[87]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[88]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[89]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[8]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[90]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[91]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[92]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[93]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[94]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[95]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[96]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[97]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[98]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[99]} \
          {buffer/qdr/fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]}]] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          buffer/qdr/fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          buffer/qdr/fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_rst_stat/dout0_reg \
          interfaces/port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_rst_stat/dout0_reg \
          interfaces/port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg \
          {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_en/sync/dout0_reg} \
          mgmt/regs/sync_crypt_inputs/sync_ack/sync/dout0_reg \
          mgmt/regs/sync_crypt_inputs/sync_en/sync/dout0_reg \
          mgmt/regs/sync_crypt_outputs/sync_ack/sync/dout0_reg \
          mgmt/regs/sync_crypt_outputs/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_cells [list {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          buffer/qdr/fifo/sync_rd_ptr/sync_ack/sync/dout1_reg \
          buffer/qdr/fifo/sync_rd_ptr/sync_en/sync/dout1_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_ack/sync/dout1_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_en/sync/dout1_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg \
          interfaces/port_g12/bridge/sync_perf/sync_ack/sync/dout1_reg \
          interfaces/port_g12/bridge/sync_perf/sync_en/sync/dout1_reg \
          interfaces/port_g12/bridge/sync_rst_stat/dout1_reg \
          interfaces/port_g12/mac/sync_link_speed/sync_ack/sync/dout1_reg \
          interfaces/port_g12/mac/sync_link_speed/sync_en/sync/dout1_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg \
          interfaces/port_g13/bridge/sync_perf/sync_ack/sync/dout1_reg \
          interfaces/port_g13/bridge/sync_perf/sync_en/sync/dout1_reg \
          interfaces/port_g13/bridge/sync_rst_stat/dout1_reg \
          interfaces/port_g13/mac/sync_link_speed/sync_ack/sync/dout1_reg \
          interfaces/port_g13/mac/sync_link_speed/sync_en/sync/dout1_reg \
          interfaces/port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout1_reg \
          interfaces/port_mgmt0/mac/sync_link_speed/sync_en/sync/dout1_reg \
          interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout1_reg \
          interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout1_reg \
          interfaces/port_xg0/pcs/sync_sfp_los/dout1_reg \
          {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout1_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout1_reg} \
          {mgmt/bridge/qspi/genblk1[0].sync_dq/dout1_reg} \
          {mgmt/bridge/qspi/genblk1[1].sync_dq/dout1_reg} \
          {mgmt/bridge/qspi/genblk1[2].sync_dq/dout1_reg} \
          {mgmt/bridge/qspi/genblk1[3].sync_dq/dout1_reg} \
          mgmt/bridge/qspi/sync_cs/dout1_reg \
          mgmt/bridge/qspi/sync_sck/dout1_reg \
          {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_en/sync/dout1_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_ack/sync/dout1_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_en/sync/dout1_reg} \
          mgmt/regs/sync_crypt_inputs/sync_ack/sync/dout1_reg \
          mgmt/regs/sync_crypt_inputs/sync_en/sync/dout1_reg \
          mgmt/regs/sync_crypt_outputs/sync_ack/sync/dout1_reg \
          mgmt/regs/sync_crypt_outputs/sync_en/sync/dout1_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout1_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout1_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout1_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout1_reg \
          mgmt/rx_fifo/sync_fifo_rst/dout1_reg]] 2.500
set_max_delay -from [get_clocks clk_ram_ctl_raw] -through [get_cells [list mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          buffer/qdr/fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          buffer/qdr/fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_rst_stat/dout0_reg \
          interfaces/port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_rst_stat/dout0_reg \
          interfaces/port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg \
          {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_en/sync/dout0_reg} \
          mgmt/regs/sync_crypt_inputs/sync_ack/sync/dout0_reg \
          mgmt/regs/sync_crypt_inputs/sync_en/sync/dout0_reg \
          mgmt/regs/sync_crypt_outputs/sync_ack/sync/dout0_reg \
          mgmt/regs/sync_crypt_outputs/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg]] -to [get_clocks clk_crypt_raw] 2.500
set_max_delay -from [get_clocks clk_crypt_raw] -through [get_cells [list mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          buffer/qdr/fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          buffer/qdr/fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_rst_stat/dout0_reg \
          interfaces/port_g12/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_rst_stat/dout0_reg \
          interfaces/port_g13/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_mgmt0/mac/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_ack/sync/dout0_reg \
          interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg \
          {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[0].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[10].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[11].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[12].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[13].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[14].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[1].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[2].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[3].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[4].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[5].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[6].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[7].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[8].sync_rx_vlan/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_tagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_untagged_allowed/sync_en/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_ack/sync/dout0_reg} \
          {mgmt/regs/portsyncs[9].sync_rx_vlan/sync_en/sync/dout0_reg} \
          mgmt/regs/sync_crypt_inputs/sync_ack/sync/dout0_reg \
          mgmt/regs/sync_crypt_inputs/sync_en/sync/dout0_reg \
          mgmt/regs/sync_crypt_outputs/sync_ack/sync/dout0_reg \
          mgmt/regs/sync_crypt_outputs/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg]] -to [get_clocks clk_ram_ctl_raw] 2.500
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
create_generated_clock -name qdr_k_p -source [get_pins buffer/qdr/ram_clk_oddr/C] -divide_by 1 [get_ports qdr_k_p]

create_clock -period 6.400 -name gtx_refclk_156m25_p -waveform {0.000 3.200} [get_ports gtx_refclk_156m25_p]
create_clock -period 5.000 -name gtx_refclk_200m_p -waveform {0.000 2.500} [get_ports gtx_refclk_200m_p]

set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets interfaces/sgmii_rxclk0]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets interfaces/sgmii_rxclk1]

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

set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/sync_fifo_rst/dout0_reg \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg \
          {buffer/infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg \
          {buffer/infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[2].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {buffer/infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          buffer/qdr/fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          buffer/qdr/fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          buffer/qdr/fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_perf/sync_ack/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_perf/sync_en/sync/dout0_reg \
          interfaces/port_g12/bridge/sync_rst_stat/dout0_reg \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          interfaces/port_g12/mac/sync_link_speed/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_perf/sync_ack/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_perf/sync_en/sync/dout0_reg \
          interfaces/port_g13/bridge/sync_rst_stat/dout0_reg \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          interfaces/port_g13/mac/sync_link_speed/sync_en/sync/dout0_reg \
          {interfaces/qsgmii[1].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          interfaces/port_mgmt0/mac/sync_link_speed/sync_en/sync/dout0_reg \
          {interfaces/qsgmii[1].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          interfaces/port_mgmt0/rgmii_bridge/sync_link_speed/sync_en/sync/dout0_reg \
          {interfaces/qsgmii[1].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[1].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[2].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[0].quad/lanes[3].pcs/rx_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[2].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].mac/sync_link_speed/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {interfaces/qsgmii[1].quad/lanes[0].pcs/rx_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg}]] -to [get_clocks clk_312p5mhz_raw] 2.500

set_clock_groups -asynchronous -group [get_clocks mgmt0_rx_clk] -group [get_clocks clk_ram_ctl_raw]
set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks mgmt0_rx_clk]

########################################################################################################################
# Floorplanning: input FIFO

create_pblock pblock_infifo_cdc
resize_pblock [get_pblocks pblock_infifo_cdc] -add {SLICE_X56Y50:SLICE_X91Y99}
resize_pblock [get_pblocks pblock_infifo_cdc] -add {DSP48_X3Y20:DSP48_X4Y39}
resize_pblock [get_pblocks pblock_infifo_cdc] -add {RAMB18_X3Y20:RAMB18_X5Y39}
resize_pblock [get_pblocks pblock_infifo_cdc] -add {RAMB36_X3Y10:RAMB36_X5Y19}
set_property IS_SOFT FALSE [get_pblocks pblock_infifo_cdc]

########################################################################################################################
# Floorplanning: clock synthesis blocks

# SGMII clock PLL should be in close proximity to the SGMII logic since that's the highest frequency,
# tightest timing stuff
set_property LOC MMCME2_ADV_X1Y1 [get_cells clk_system/sgmii_mmcm]

# RGMII clock PLL goes above it
set_property LOC MMCME2_ADV_X1Y2 [get_cells clk_system/rgmii_mmcm]

# We don't need dedicated routing for the 125 MHz system clock input,
# since nothing is synchronous to it
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk_system/sysclk_in]

########################################################################################################################
# Floorplanning: RAM

create_pblock pblock_ram
add_cells_to_pblock [get_pblocks pblock_ram] [get_cells -quiet [list buffer/infifo/decc_hi buffer/infifo/decc_lo buffer/infifo/ecc_hi buffer/infifo/ecc_lo]]
resize_pblock [get_pblocks pblock_ram] -add {SLICE_X0Y50:SLICE_X23Y199}
resize_pblock [get_pblocks pblock_ram] -add {DSP48_X0Y20:DSP48_X1Y79}
resize_pblock [get_pblocks pblock_ram] -add {RAMB18_X0Y20:RAMB18_X1Y79}
resize_pblock [get_pblocks pblock_ram] -add {RAMB36_X0Y10:RAMB36_X1Y39}

########################################################################################################################
# Floorplanning: SGMII g13

create_pblock pblock_sgmii
add_cells_to_pblock [get_pblocks pblock_sgmii] [get_cells -quiet [list interfaces/port_g12 interfaces/port_g13]]
resize_pblock [get_pblocks pblock_sgmii] -add {SLICE_X92Y50:SLICE_X109Y99}
resize_pblock [get_pblocks pblock_sgmii] -add {DSP48_X5Y20:DSP48_X5Y39}
resize_pblock [get_pblocks pblock_sgmii] -add {RAMB18_X6Y20:RAMB18_X6Y39}
resize_pblock [get_pblocks pblock_sgmii] -add {RAMB36_X6Y10:RAMB36_X6Y19}
set_property IS_SOFT FALSE [get_pblocks pblock_sgmii]

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
add_cells_to_pblock [get_pblocks pblock_rgmii] [get_cells -quiet [list interfaces/port_mgmt0 mgmt/rx_fifo]]
resize_pblock [get_pblocks pblock_rgmii] -add {SLICE_X102Y100:SLICE_X109Y149}
resize_pblock [get_pblocks pblock_rgmii] -add {RAMB18_X6Y40:RAMB18_X6Y59}
resize_pblock [get_pblocks pblock_rgmii] -add {RAMB36_X6Y20:RAMB36_X6Y29}
set_property IS_SOFT FALSE [get_pblocks pblock_rgmii]


#######################################################################################################################
# Floorplanning: QSGMII

create_pblock pblock_qsgmii
add_cells_to_pblock [get_pblocks pblock_qsgmii] [get_cells -quiet [list interfaces/port_g0_g11 {interfaces/qsgmii[0].quad} {interfaces/qsgmii[1].quad} {interfaces/qsgmii[2].quad}]]
resize_pblock [get_pblocks pblock_qsgmii] -add {CLOCKREGION_X1Y3:CLOCKREGION_X1Y3}
set_property IS_SOFT FALSE [get_pblocks pblock_qsgmii]

#######################################################################################################################
# Floorplanning: SFP+ xg0

create_pblock pblock_10g
add_cells_to_pblock [get_pblocks pblock_10g] [get_cells -quiet [list interfaces/port_xg0 interfaces/xg_transceiver]]
resize_pblock [get_pblocks pblock_10g] -add {SLICE_X56Y180:SLICE_X101Y209}
resize_pblock [get_pblocks pblock_10g] -add {DSP48_X3Y72:DSP48_X5Y83}
resize_pblock [get_pblocks pblock_10g] -add {RAMB18_X3Y72:RAMB18_X5Y83}
resize_pblock [get_pblocks pblock_10g] -add {RAMB36_X3Y36:RAMB36_X5Y41}
set_property IS_SOFT FALSE [get_pblocks pblock_10g]

#######################################################################################################################
# Floorplanning: metadata FIFO

create_pblock pblock_metafifo
add_cells_to_pblock [get_pblocks pblock_metafifo] [get_cells -quiet [list \
          {buffer/infifo/metafifo[0].fifo} \
          {buffer/infifo/metafifo[10].fifo} \
          {buffer/infifo/metafifo[11].fifo} \
          {buffer/infifo/metafifo[12].fifo} \
          {buffer/infifo/metafifo[13].fifo} \
          {buffer/infifo/metafifo[14].fifo} \
          {buffer/infifo/metafifo[1].fifo} \
          {buffer/infifo/metafifo[2].fifo} \
          {buffer/infifo/metafifo[3].fifo} \
          {buffer/infifo/metafifo[4].fifo} \
          {buffer/infifo/metafifo[5].fifo} \
          {buffer/infifo/metafifo[6].fifo} \
          {buffer/infifo/metafifo[7].fifo} \
          {buffer/infifo/metafifo[8].fifo} \
          {buffer/infifo/metafifo[9].fifo}]]
resize_pblock [get_pblocks pblock_metafifo] -add {SLICE_X0Y125:SLICE_X55Y199}
resize_pblock [get_pblocks pblock_metafifo] -add {DSP48_X0Y50:DSP48_X2Y79}
resize_pblock [get_pblocks pblock_metafifo] -add {RAMB18_X0Y50:RAMB18_X2Y79}
resize_pblock [get_pblocks pblock_metafifo] -add {RAMB36_X0Y25:RAMB36_X2Y39}
set_property IS_SOFT FALSE [get_pblocks pblock_metafifo]

#######################################################################################################################
# Floorplanning: prefetcher

create_pblock pblock_prefetch
add_cells_to_pblock [get_pblocks pblock_prefetch] [get_cells -quiet [list buffer/infifo/prefetch_fifo buffer/infifo/tagfifo]]
resize_pblock [get_pblocks pblock_prefetch] -add {SLICE_X0Y100:SLICE_X23Y124}
resize_pblock [get_pblocks pblock_prefetch] -add {DSP48_X0Y40:DSP48_X1Y49}
resize_pblock [get_pblocks pblock_prefetch] -add {RAMB18_X0Y40:RAMB18_X1Y49}
resize_pblock [get_pblocks pblock_prefetch] -add {RAMB36_X0Y20:RAMB36_X1Y24}

#######################################################################################################################
# Floorplanning: MAC address table

create_pblock pblock_mactable
add_cells_to_pblock [get_pblocks pblock_mactable] [get_cells -quiet [list fwd]]
resize_pblock [get_pblocks pblock_mactable] -add {SLICE_X0Y50:SLICE_X55Y104}
resize_pblock [get_pblocks pblock_mactable] -add {DSP48_X0Y20:DSP48_X2Y41}
resize_pblock [get_pblocks pblock_mactable] -add {RAMB18_X0Y20:RAMB18_X2Y41}
resize_pblock [get_pblocks pblock_mactable] -add {RAMB36_X0Y10:RAMB36_X2Y20}
set_property IS_SOFT FALSE [get_pblocks pblock_mactable]

#######################################################################################################################
# Floorplanning: QSPI management

create_pblock pblock_qspi
add_cells_to_pblock [get_pblocks pblock_qspi] [get_cells -quiet [list mgmt/bridge/qspi]]
resize_pblock [get_pblocks pblock_qspi] -add {SLICE_X0Y200:SLICE_X7Y224}
set_property IS_SOFT FALSE [get_pblocks pblock_qspi]
create_pblock pblock_mgmt
add_cells_to_pblock [get_pblocks pblock_mgmt] [get_cells -quiet [list \
          mgmt/bridge/GND \
          mgmt/bridge/VCC \
          {mgmt/bridge/port_is_trunk[0]_i_2} \
          {mgmt/bridge/port_is_trunk[10]_i_2} \
          {mgmt/bridge/port_is_trunk[11]_i_2} \
          {mgmt/bridge/port_is_trunk[12]_i_2} \
          {mgmt/bridge/port_is_trunk[13]_i_2} \
          {mgmt/bridge/port_is_trunk[14]_i_2} \
          {mgmt/bridge/port_is_trunk[14]_i_3} \
          {mgmt/bridge/port_is_trunk[1]_i_2} \
          {mgmt/bridge/port_is_trunk[2]_i_2} \
          {mgmt/bridge/port_is_trunk[3]_i_2} \
          {mgmt/bridge/port_is_trunk[4]_i_2} \
          {mgmt/bridge/port_is_trunk[5]_i_2} \
          {mgmt/bridge/port_is_trunk[6]_i_2} \
          {mgmt/bridge/port_is_trunk[7]_i_2} \
          {mgmt/bridge/port_is_trunk[8]_i_2} \
          {mgmt/bridge/port_is_trunk[9]_i_2} \
          {mgmt/bridge/port_tagmode_updated[0]_i_1} \
          {mgmt/bridge/port_tagmode_updated[10]_i_1} \
          {mgmt/bridge/port_tagmode_updated[11]_i_1} \
          {mgmt/bridge/port_tagmode_updated[12]_i_1} \
          {mgmt/bridge/port_tagmode_updated[13]_i_1} \
          {mgmt/bridge/port_tagmode_updated[14]_i_1} \
          {mgmt/bridge/port_tagmode_updated[1]_i_1} \
          {mgmt/bridge/port_tagmode_updated[2]_i_1} \
          {mgmt/bridge/port_tagmode_updated[3]_i_1} \
          {mgmt/bridge/port_tagmode_updated[4]_i_1} \
          {mgmt/bridge/port_tagmode_updated[5]_i_1} \
          {mgmt/bridge/port_tagmode_updated[6]_i_1} \
          {mgmt/bridge/port_tagmode_updated[7]_i_1} \
          {mgmt/bridge/port_tagmode_updated[8]_i_1} \
          {mgmt/bridge/port_tagmode_updated[9]_i_1} \
          {mgmt/bridge/port_vlan[10][11]_i_2} \
          {mgmt/bridge/port_vlan[11][11]_i_2} \
          {mgmt/bridge/port_vlan[13][11]_i_2} \
          {mgmt/bridge/port_vlan[14][11]_i_2} \
          {mgmt/bridge/port_vlan[14][11]_i_3} \
          {mgmt/bridge/port_vlan[14][11]_i_4} \
          {mgmt/bridge/port_vlan[14][11]_i_5} \
          {mgmt/bridge/port_vlan[14][7]_i_2} \
          {mgmt/bridge/port_vlan[5][11]_i_2} \
          {mgmt/bridge/port_vlan[7][11]_i_2} \
          {mgmt/bridge/port_vlan_updated[0]_i_1} \
          {mgmt/bridge/port_vlan_updated[10]_i_1} \
          {mgmt/bridge/port_vlan_updated[11]_i_1} \
          {mgmt/bridge/port_vlan_updated[12]_i_1} \
          {mgmt/bridge/port_vlan_updated[13]_i_1} \
          {mgmt/bridge/port_vlan_updated[14]_i_2} \
          {mgmt/bridge/port_vlan_updated[1]_i_1} \
          {mgmt/bridge/port_vlan_updated[2]_i_1} \
          {mgmt/bridge/port_vlan_updated[3]_i_1} \
          {mgmt/bridge/port_vlan_updated[4]_i_1} \
          {mgmt/bridge/port_vlan_updated[5]_i_1} \
          {mgmt/bridge/port_vlan_updated[6]_i_1} \
          {mgmt/bridge/port_vlan_updated[7]_i_1} \
          {mgmt/bridge/port_vlan_updated[8]_i_1} \
          {mgmt/bridge/port_vlan_updated[9]_i_1} \
          {mgmt/bridge/rd_addr_reg[0]} \
          {mgmt/bridge/rd_addr_reg[10]} \
          {mgmt/bridge/rd_addr_reg[11]} \
          {mgmt/bridge/rd_addr_reg[12]} \
          {mgmt/bridge/rd_addr_reg[13]} \
          {mgmt/bridge/rd_addr_reg[14]} \
          {mgmt/bridge/rd_addr_reg[15]} \
          {mgmt/bridge/rd_addr_reg[1]} \
          {mgmt/bridge/rd_addr_reg[2]} \
          {mgmt/bridge/rd_addr_reg[3]} \
          {mgmt/bridge/rd_addr_reg[4]} \
          {mgmt/bridge/rd_addr_reg[5]} \
          {mgmt/bridge/rd_addr_reg[6]} \
          {mgmt/bridge/rd_addr_reg[7]} \
          {mgmt/bridge/rd_addr_reg[8]} \
          {mgmt/bridge/rd_addr_reg[9]} \
          {mgmt/bridge/rd_data[0]_i_3} \
          {mgmt/bridge/rd_data[1]_i_3} \
          {mgmt/bridge/rd_data[2]_i_3} \
          {mgmt/bridge/rd_data[3]_i_3} \
          {mgmt/bridge/rd_data[4]_i_3} \
          {mgmt/bridge/rd_data[5]_i_3} \
          {mgmt/bridge/rd_data[6]_i_3} \
          {mgmt/bridge/rd_data[7]_i_12} \
          {mgmt/bridge/rd_data[7]_i_13} \
          {mgmt/bridge/rd_data[7]_i_14} \
          {mgmt/bridge/rd_data[7]_i_15} \
          {mgmt/bridge/rd_data[7]_i_3} \
          {mgmt/bridge/rd_data[7]_i_5} \
          {mgmt/bridge/rd_data[7]_i_9} \
          {mgmt/bridge/rd_data_reg[0]_i_1} \
          {mgmt/bridge/rd_data_reg[1]_i_1} \
          {mgmt/bridge/rd_data_reg[2]_i_1} \
          {mgmt/bridge/rd_data_reg[3]_i_1} \
          {mgmt/bridge/rd_data_reg[4]_i_1} \
          {mgmt/bridge/rd_data_reg[5]_i_1} \
          {mgmt/bridge/rd_data_reg[6]_i_1} \
          {mgmt/bridge/rd_data_reg[7]_i_2} \
          mgmt/bridge/rd_mode_reg \
          mgmt/bridge/reading_i_2 \
          mgmt/bridge/reading_i_3 \
          mgmt/bridge/reading_i_4 \
          mgmt/bridge/reading_i_5 \
          mgmt/bridge/reading_i_6 \
          mgmt/bridge/reading_i_7 \
          mgmt/bridge/reading_i_8 \
          mgmt/bridge/reading_i_9 \
          {mgmt/bridge/wr_addr_reg[0]} \
          {mgmt/bridge/wr_addr_reg[10]} \
          {mgmt/bridge/wr_addr_reg[11]} \
          {mgmt/bridge/wr_addr_reg[12]} \
          {mgmt/bridge/wr_addr_reg[13]} \
          {mgmt/bridge/wr_addr_reg[14]} \
          {mgmt/bridge/wr_addr_reg[15]} \
          {mgmt/bridge/wr_addr_reg[1]} \
          {mgmt/bridge/wr_addr_reg[2]} \
          {mgmt/bridge/wr_addr_reg[3]} \
          {mgmt/bridge/wr_addr_reg[4]} \
          {mgmt/bridge/wr_addr_reg[5]} \
          {mgmt/bridge/wr_addr_reg[6]} \
          {mgmt/bridge/wr_addr_reg[7]} \
          {mgmt/bridge/wr_addr_reg[8]} \
          {mgmt/bridge/wr_addr_reg[9]} \
          mgmt/info \
          mgmt/regs]]
resize_pblock [get_pblocks pblock_mgmt] -add {SLICE_X36Y125:SLICE_X55Y199}
resize_pblock [get_pblocks pblock_mgmt] -add {DSP48_X2Y50:DSP48_X2Y79}
resize_pblock [get_pblocks pblock_mgmt] -add {RAMB18_X2Y50:RAMB18_X2Y79}
resize_pblock [get_pblocks pblock_mgmt] -add {RAMB36_X2Y25:RAMB36_X2Y39}
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








create_pblock pblock_sgmii_cdc
add_cells_to_pblock [get_pblocks pblock_sgmii_cdc] [get_cells -quiet [list {buffer/infifo/cdcs[12].cdc} {buffer/infifo/cdcs[13].cdc}]]
resize_pblock [get_pblocks pblock_sgmii_cdc] -add {SLICE_X92Y75:SLICE_X109Y99}
resize_pblock [get_pblocks pblock_sgmii_cdc] -add {DSP48_X5Y30:DSP48_X5Y39}
resize_pblock [get_pblocks pblock_sgmii_cdc] -add {RAMB18_X6Y30:RAMB18_X6Y39}
resize_pblock [get_pblocks pblock_sgmii_cdc] -add {RAMB36_X6Y15:RAMB36_X6Y19}
set_property IS_SOFT FALSE [get_pblocks pblock_sgmii_cdc]





create_pblock pblock_xg0_cdc
add_cells_to_pblock [get_pblocks pblock_xg0_cdc] [get_cells -quiet [list {buffer/infifo/cdcs[14].cdc}]]
resize_pblock [get_pblocks pblock_xg0_cdc] -add {SLICE_X56Y150:SLICE_X101Y174}
resize_pblock [get_pblocks pblock_xg0_cdc] -add {DSP48_X3Y60:DSP48_X5Y69}
resize_pblock [get_pblocks pblock_xg0_cdc] -add {RAMB18_X3Y60:RAMB18_X4Y69}
resize_pblock [get_pblocks pblock_xg0_cdc] -add {RAMB36_X3Y30:RAMB36_X4Y34}
create_pblock pblock_qsgmii_cdc
add_cells_to_pblock [get_pblocks pblock_qsgmii_cdc] [get_cells -quiet [list \
          {buffer/infifo/cdcs[0].cdc} \
          {buffer/infifo/cdcs[10].cdc} \
          {buffer/infifo/cdcs[11].cdc} \
          {buffer/infifo/cdcs[1].cdc} \
          {buffer/infifo/cdcs[2].cdc} \
          {buffer/infifo/cdcs[3].cdc} \
          {buffer/infifo/cdcs[4].cdc} \
          {buffer/infifo/cdcs[5].cdc} \
          {buffer/infifo/cdcs[6].cdc} \
          {buffer/infifo/cdcs[7].cdc} \
          {buffer/infifo/cdcs[8].cdc} \
          {buffer/infifo/cdcs[9].cdc}]]
resize_pblock [get_pblocks pblock_qsgmii_cdc] -add {SLICE_X56Y100:SLICE_X101Y149}
resize_pblock [get_pblocks pblock_qsgmii_cdc] -add {DSP48_X3Y40:DSP48_X5Y59}
resize_pblock [get_pblocks pblock_qsgmii_cdc] -add {RAMB18_X3Y40:RAMB18_X6Y59}
resize_pblock [get_pblocks pblock_qsgmii_cdc] -add {RAMB36_X3Y20:RAMB36_X6Y29}
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_125mhz]
