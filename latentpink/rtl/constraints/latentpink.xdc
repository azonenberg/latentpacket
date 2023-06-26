set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list {infifo/cdcs[0].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[0].cdc/data_fifo/data_mem/storage_reg_0_i_3} \
          {infifo/cdcs[0].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9} \
          {infifo/cdcs[10].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[10].cdc/data_fifo/data_mem/storage_reg_0_i_3__9} \
          {infifo/cdcs[10].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__9} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__9} \
          {infifo/cdcs[11].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[11].cdc/data_fifo/data_mem/storage_reg_0_i_3__10} \
          {infifo/cdcs[11].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__10} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__10} \
          {infifo/cdcs[12].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[12].cdc/data_fifo/data_mem/storage_reg_0_i_3__11} \
          {infifo/cdcs[12].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__11} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__11} \
          {infifo/cdcs[13].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[13].cdc/data_fifo/data_mem/storage_reg_0_i_3__12} \
          {infifo/cdcs[13].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__12} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__12} \
          {infifo/cdcs[14].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[14].cdc/data_fifo/data_mem/storage_reg_0_i_3__13} \
          {infifo/cdcs[14].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__13} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__13} \
          {infifo/cdcs[1].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[1].cdc/data_fifo/data_mem/storage_reg_0_i_3__0} \
          {infifo/cdcs[1].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__0} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__0} \
          {infifo/cdcs[2].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[2].cdc/data_fifo/data_mem/storage_reg_0_i_3__1} \
          {infifo/cdcs[2].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__1} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__1} \
          {infifo/cdcs[3].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[3].cdc/data_fifo/data_mem/storage_reg_0_i_3__2} \
          {infifo/cdcs[3].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__2} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__2} \
          {infifo/cdcs[4].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[4].cdc/data_fifo/data_mem/storage_reg_0_i_3__3} \
          {infifo/cdcs[4].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__3} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__3} \
          {infifo/cdcs[5].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[5].cdc/data_fifo/data_mem/storage_reg_0_i_3__4} \
          {infifo/cdcs[5].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__4} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__4} \
          {infifo/cdcs[6].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[6].cdc/data_fifo/data_mem/storage_reg_0_i_3__5} \
          {infifo/cdcs[6].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__5} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__5} \
          {infifo/cdcs[7].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[7].cdc/data_fifo/data_mem/storage_reg_0_i_3__6} \
          {infifo/cdcs[7].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__6} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__6} \
          {infifo/cdcs[8].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[8].cdc/data_fifo/data_mem/storage_reg_0_i_3__7} \
          {infifo/cdcs[8].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__7} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__7} \
          {infifo/cdcs[9].cdc/data_fifo/data_mem/storage_reg_0} \
          {infifo/cdcs[9].cdc/data_fifo/data_mem/storage_reg_0_i_3__8} \
          {infifo/cdcs[9].cdc/data_fifo/data_mem/storage_reg_1} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_0_2} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_3_5} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_6_8} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/storage_reg_0_63_9_10} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_10__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_11__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_12__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_13__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_14__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_15__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_1__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_2__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_4__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_5__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_6__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_7__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_8__8} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/storage_reg_0_i_9__8} \
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
          mgmt/rx_fifo/rx_cdc_fifo/data_mem/storage_reg_i_9 \
          port_g12/bridge/pcs/rx_fifo/fifomem/storage_reg_0_31_0_5 \
          port_g12/bridge/pcs/rx_fifo/fifomem/storage_reg_0_31_6_9 \
          port_g12/bridge/rx_decoder/storage_reg_0_31_0_5_i_1__11 \
          port_g12/mac/storage_reg_0_63_0_2_i_1__12 \
          port_g13/bridge/pcs/rx_fifo/fifomem/storage_reg_0_31_0_5 \
          port_g13/bridge/pcs/rx_fifo/fifomem/storage_reg_0_31_6_9 \
          port_g13/bridge/rx_decoder/storage_reg_0_31_0_5_i_1__12 \
          port_g13/mac/storage_reg_0_63_0_2_i_1__13 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_0_63_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_0_63_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_0_63_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_0_63_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1024_1087_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1024_1087_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1024_1087_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1024_1087_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1088_1151_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1088_1151_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1088_1151_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1088_1151_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1152_1215_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1152_1215_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1152_1215_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1152_1215_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1216_1279_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1216_1279_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1216_1279_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1216_1279_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1280_1343_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1280_1343_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1280_1343_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1280_1343_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_128_191_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_128_191_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_128_191_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_128_191_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1344_1407_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1344_1407_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1344_1407_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1344_1407_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1408_1471_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1408_1471_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1408_1471_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1408_1471_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1472_1535_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1472_1535_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1472_1535_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1472_1535_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1536_1599_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1536_1599_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1536_1599_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1536_1599_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1600_1663_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1600_1663_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1600_1663_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1600_1663_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1664_1727_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1664_1727_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1664_1727_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1664_1727_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1728_1791_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1728_1791_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1728_1791_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1728_1791_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1792_1855_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1792_1855_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1792_1855_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1792_1855_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1856_1919_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1856_1919_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1856_1919_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1856_1919_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1920_1983_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1920_1983_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1920_1983_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1920_1983_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_192_255_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_192_255_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_192_255_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_192_255_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1984_2047_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1984_2047_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1984_2047_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_1984_2047_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_256_319_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_256_319_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_256_319_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_256_319_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_320_383_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_320_383_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_320_383_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_320_383_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_384_447_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_384_447_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_384_447_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_384_447_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_448_511_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_448_511_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_448_511_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_448_511_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_512_575_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_512_575_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_512_575_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_512_575_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_576_639_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_576_639_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_576_639_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_576_639_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_640_703_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_640_703_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_640_703_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_640_703_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_64_127_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_64_127_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_64_127_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_64_127_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_704_767_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_704_767_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_704_767_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_704_767_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_768_831_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_768_831_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_768_831_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_768_831_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_832_895_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_832_895_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_832_895_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_832_895_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_896_959_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_896_959_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_896_959_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_896_959_6_7 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_960_1023_0_2 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_960_1023_0_2_i_1 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_960_1023_3_5 \
          port_mgmt0/mac/tx_fifo/mem/storage_reg_960_1023_6_7 \
          port_xg0/mac/storage_reg_0_63_0_2_i_1__14 \
          port_xg0/pcs/tx_elastic/mem/storage_reg \
          port_xg0/pcs/tx_elastic/mem/storage_reg_i_1 \
          port_xg0/pcs/tx_elastic/mem/storage_reg_i_2 \
          port_xg0/pcs/tx_elastic/mem/storage_reg_i_3 \
          port_xg0/pcs/tx_elastic/mem/storage_reg_i_4 \
          port_xg0/pcs/tx_elastic/mem/storage_reg_i_5 \
          port_xg0/pcs/tx_elastic/mem/storage_reg_i_6 \
          port_xg0/pcs/tx_elastic/mem/storage_reg_i_7 \
          port_xg0/pcs/tx_elastic/mem/storage_reg_i_8 \
          qdr/fifo/fifomem/storage_reg_0_31_0_5 \
          qdr/fifo/fifomem/storage_reg_0_31_102_107 \
          qdr/fifo/fifomem/storage_reg_0_31_108_113 \
          qdr/fifo/fifomem/storage_reg_0_31_114_119 \
          qdr/fifo/fifomem/storage_reg_0_31_120_125 \
          qdr/fifo/fifomem/storage_reg_0_31_126_131 \
          qdr/fifo/fifomem/storage_reg_0_31_12_17 \
          qdr/fifo/fifomem/storage_reg_0_31_132_137 \
          qdr/fifo/fifomem/storage_reg_0_31_138_143 \
          qdr/fifo/fifomem/storage_reg_0_31_18_23 \
          qdr/fifo/fifomem/storage_reg_0_31_24_29 \
          qdr/fifo/fifomem/storage_reg_0_31_30_35 \
          qdr/fifo/fifomem/storage_reg_0_31_36_41 \
          qdr/fifo/fifomem/storage_reg_0_31_42_47 \
          qdr/fifo/fifomem/storage_reg_0_31_48_53 \
          qdr/fifo/fifomem/storage_reg_0_31_54_59 \
          qdr/fifo/fifomem/storage_reg_0_31_60_65 \
          qdr/fifo/fifomem/storage_reg_0_31_66_71 \
          qdr/fifo/fifomem/storage_reg_0_31_6_11 \
          qdr/fifo/fifomem/storage_reg_0_31_72_77 \
          qdr/fifo/fifomem/storage_reg_0_31_78_83 \
          qdr/fifo/fifomem/storage_reg_0_31_84_89 \
          qdr/fifo/fifomem/storage_reg_0_31_90_95 \
          qdr/fifo/fifomem/storage_reg_0_31_96_101 \
          {qsgmii[0].quad/lanes[0].mac/storage_reg_0_63_0_2_i_1__0} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[0].quad/lanes[1].mac/storage_reg_0_63_0_2_i_1__1} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[0].quad/lanes[2].mac/storage_reg_0_63_0_2_i_1__2} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[0].quad/lanes[3].mac/storage_reg_0_63_0_2_i_1__3} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[0].quad/quadsplit/storage_reg_0_31_0_5_i_1} \
          {qsgmii[0].quad/quadsplit/storage_reg_0_31_0_5_i_1__0} \
          {qsgmii[0].quad/quadsplit/storage_reg_0_31_0_5_i_1__1} \
          {qsgmii[0].quad/quadsplit/storage_reg_0_31_0_5_i_1__2} \
          {qsgmii[1].quad/lanes[0].mac/storage_reg_0_63_0_2_i_1__4} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[1].quad/lanes[1].mac/storage_reg_0_63_0_2_i_1__5} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[1].quad/lanes[2].mac/storage_reg_0_63_0_2_i_1__6} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[1].quad/lanes[3].mac/storage_reg_0_63_0_2_i_1__7} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[1].quad/quadsplit/storage_reg_0_31_0_5_i_1__3} \
          {qsgmii[1].quad/quadsplit/storage_reg_0_31_0_5_i_1__4} \
          {qsgmii[1].quad/quadsplit/storage_reg_0_31_0_5_i_1__5} \
          {qsgmii[1].quad/quadsplit/storage_reg_0_31_0_5_i_1__6} \
          {qsgmii[2].quad/lanes[0].mac/storage_reg_0_63_0_2_i_1__8} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[2].quad/lanes[1].mac/storage_reg_0_63_0_2_i_1__9} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[2].quad/lanes[2].mac/storage_reg_0_63_0_2_i_1__10} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[2].quad/lanes[3].mac/storage_reg_0_63_0_2_i_1__11} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_0_5} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/storage_reg_0_31_6_9} \
          {qsgmii[2].quad/quadsplit/storage_reg_0_31_0_5_i_1__10} \
          {qsgmii[2].quad/quadsplit/storage_reg_0_31_0_5_i_1__7} \
          {qsgmii[2].quad/quadsplit/storage_reg_0_31_0_5_i_1__8} \
          {qsgmii[2].quad/quadsplit/storage_reg_0_31_0_5_i_1__9}]] -to [get_cells [list {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[0].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[10].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[11].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[12].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[13].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[14].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[1].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[2].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[3].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[4].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[5].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[6].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[7].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[8].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[0]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[10]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[1]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[2]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[3]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[4]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[5]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[6]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[7]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[8]} \
          {infifo/cdcs[9].cdc/header_fifo/fifomem/portb_dout_raw_reg[9]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {port_g12/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {port_g13/bridge/pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[0]} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[0]_i_2} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[0]_i_3} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[0]_i_4} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[0]_i_5} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[1]} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[1]_i_2} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[1]_i_3} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[1]_i_4} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[1]_i_5} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[2]} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[2]_i_2} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[2]_i_3} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[2]_i_4} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[2]_i_5} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[3]} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[3]_i_2} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[3]_i_3} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[3]_i_4} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[3]_i_5} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[4]} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[4]_i_2} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[4]_i_3} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[4]_i_4} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[4]_i_5} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[5]} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[5]_i_2} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[5]_i_3} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[5]_i_4} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[5]_i_5} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[6]} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[6]_i_2} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[6]_i_3} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[6]_i_4} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[6]_i_5} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[7]} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[7]_i_2} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[7]_i_3} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[7]_i_4} \
          {port_mgmt0/mac/tx_fifo/mem/portb_dout_raw_reg[7]_i_5} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[0]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[100]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[101]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[102]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[103]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[104]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[105]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[106]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[107]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[108]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[109]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[10]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[110]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[111]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[112]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[113]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[114]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[115]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[116]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[117]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[118]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[119]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[11]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[120]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[121]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[122]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[123]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[124]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[125]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[126]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[127]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[128]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[129]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[12]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[130]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[131]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[132]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[133]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[134]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[135]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[136]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[137]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[138]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[139]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[13]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[140]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[141]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[142]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[143]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[14]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[15]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[16]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[17]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[18]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[19]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[1]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[20]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[21]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[22]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[23]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[24]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[25]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[26]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[27]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[28]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[29]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[2]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[30]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[31]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[32]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[33]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[34]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[35]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[36]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[37]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[38]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[39]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[3]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[40]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[41]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[42]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[43]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[44]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[45]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[46]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[47]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[48]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[49]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[4]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[50]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[51]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[52]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[53]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[54]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[55]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[56]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[57]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[58]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[59]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[5]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[60]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[61]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[62]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[63]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[64]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[65]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[66]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[67]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[68]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[69]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[6]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[70]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[71]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[72]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[73]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[74]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[75]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[76]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[77]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[78]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[79]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[7]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[80]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[81]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[82]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[83]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[84]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[85]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[86]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[87]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[88]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[89]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[8]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[90]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[91]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[92]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[93]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[94]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[95]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[96]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[97]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[98]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[99]} \
          {qdr/fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[0].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[0].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[0].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[0].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[1].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[1].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[1].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[1].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[2].quad/lanes[0].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[2].quad/lanes[1].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[2].quad/lanes[2].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[0]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[1]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[2]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[3]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[4]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[5]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[6]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[7]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[8]} \
          {qsgmii[2].quad/lanes[3].pcs/rx_fifo/fifomem/portb_dout_raw_reg[9]}]] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks clk_312p5mhz_raw] 2.500
set_max_delay -from [get_clocks clk_312p5mhz_raw] -through [get_cells [list mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_en/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_ack/sync/dout0_reg mgmt/rx_fifo/rx_cdc_fifo/sync_tail/sync_en/sync/dout0_reg mgmt/rx_fifo/sync_fifo_rst/dout0_reg]] -to [get_clocks [list clk_125mhz_p clk_125mhz_raw]] 2.500
set_max_delay -from [get_clocks clk_125mhz_raw] -through [get_cells [list {infifo/cdcs[0].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
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
          {infifo/cdcs[0].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[0].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[10].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[11].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[12].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[13].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[14].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[1].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[2].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[3].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[4].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[5].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[6].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[7].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[8].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/data_fifo/sync_head/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/data_fifo/sync_head/sync_en/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/data_fifo/sync_tail/sync_en/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/header_fifo/sync_rd_ptr/sync_en/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_ack/sync/dout0_reg} \
          {infifo/cdcs[9].cdc/header_fifo/sync_wr_ptr/sync_en/sync/dout0_reg} \
          mgmt/rx_fifo/rx_cdc_fifo/sync_head/sync_ack/sync/dout0_reg \
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

set _xlnx_shared_i0 [get_cells -hierarchical -filter { NAME =~  "*sync*" && NAME =~  "*dout0_reg*" }]
set_max_delay -from [get_clocks *clk_125mhz_raw*] -through $_xlnx_shared_i0 -to [get_clocks *clk_312p5mhz*] 2.500

set_max_delay -from [get_clocks *clk_312p5mhz*] -through [get_cells -hierarchical *storage_reg*] -to [get_cells -hierarchical *portb_dout_raw_reg*] 2.500

set _xlnx_shared_i1 [get_cells -hierarchical *reg_a_ff*]
set_max_delay -from [get_clocks *clk_125mhz_raw*] -through $_xlnx_shared_i1 -to [get_clocks *clk_312p5mhz*] 2.500
set_max_delay -from [get_clocks *clk_312p5mhz*] -through $_xlnx_shared_i1 -to [get_clocks *clk_125mhz_raw*] 2.500

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
add_cells_to_pblock [get_pblocks pblock_ram] [get_cells -quiet [list infifo/ecc_hi infifo/ecc_lo qdr]]
resize_pblock [get_pblocks pblock_ram] -add {SLICE_X0Y50:SLICE_X23Y199}
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


set_property ASYNC_REG true [get_cells {infifo/cdcs[1].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[1].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[0].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[0].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[2].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[2].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[3].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[3].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[7].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[7].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[6].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[6].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[5].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[5].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[4].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[4].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[8].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[8].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[11].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[11].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[9].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[9].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[10].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[10].cdc/sync_rst/rst_out_n_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[14].cdc/sync_rst/ff_0_reg}]
set_property ASYNC_REG true [get_cells {infifo/cdcs[14].cdc/sync_rst/rst_out_n_reg}]
set_clock_groups -asynchronous -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -group [get_clocks clk_ram_ctl_raw]
set_clock_groups -asynchronous -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -group [get_clocks clk_ram_ctl_raw]
set_clock_groups -asynchronous -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK] -group [get_clocks clk_ram_ctl_raw]
set_clock_groups -asynchronous -group [get_clocks xg_transceiver/inst/sfp_wizard_i/gt0_sfp_wizard_i/gtxe2_i/RXOUTCLK] -group [get_clocks clk_ram_ctl_raw]
set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt0_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt1_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks port_g0_g11/inst/qsgmii_transceiver_i/gt2_qsgmii_transceiver_i/gtxe2_i/RXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks clk_ram_ctl_raw] -group [get_clocks xg_transceiver/inst/sfp_wizard_i/gt0_sfp_wizard_i/gtxe2_i/RXOUTCLK]

create_pblock pblock_infifo_cdc
add_cells_to_pblock [get_pblocks pblock_infifo_cdc] [get_cells -quiet [list \
          {infifo/cdcs[0].cdc} \
          {infifo/cdcs[10].cdc} \
          {infifo/cdcs[11].cdc} \
          {infifo/cdcs[12].cdc} \
          {infifo/cdcs[13].cdc} \
          {infifo/cdcs[14].cdc} \
          {infifo/cdcs[1].cdc} \
          {infifo/cdcs[2].cdc} \
          {infifo/cdcs[3].cdc} \
          {infifo/cdcs[4].cdc} \
          {infifo/cdcs[5].cdc} \
          {infifo/cdcs[6].cdc} \
          {infifo/cdcs[7].cdc} \
          {infifo/cdcs[8].cdc} \
          {infifo/cdcs[9].cdc}]]
resize_pblock [get_pblocks pblock_infifo_cdc] -add {CLOCKREGION_X0Y4:CLOCKREGION_X0Y4}
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_312p5mhz]
