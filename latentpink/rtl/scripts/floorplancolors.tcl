unhighlight_objects

# green packet buffering w/ bright green prefetch buffer
highlight_objects -color_index 11 -leaf_cells [get_cells {buffer}]
highlight_objects -color_index 3 -leaf_cells [get_cells -quiet {buffer/infifo/prefetch_fifo}]

# red RAM interface
highlight_objects -color_index 7 -leaf_cells [get_cells {buffer/bist buffer/bistmux buffer/qdr}]
highlight_objects -color_index 7 -leaf_cells [get_cells -quiet [list {buffer/infifo/*ecc*}]]

# blue network interfaces
highlight_objects -color_index 5 -leaf_cells [get_cells {interfaces}]

# performance counters are yellow for now
highlight_objects -color_index 2 -leaf_cells [get_cells [list {interfaces/*_count}]]
highlight_objects -color_index 2 -leaf_cells [get_cells [list {interfaces/*_readout}]]
highlight_objects -color_index 2 -leaf_cells [get_cells [list {interfaces/*.count}]]
highlight_objects -color_index 2 -leaf_cells [get_cells [list {interfaces/*.readout}]]

# purple management
highlight_objects -color_index 13 -leaf_cells [get_cells {mgmt}]

# bright pink exit queues
highlight_objects -color_index 15 -leaf_cells [get_cells {exit}]

# brown forwarding engine
highlight_objects -color_index 14 -leaf_cells [get_cells {fwd}]

# cyan crypto accelerator
highlight_objects -color_index 8 -leaf_cells [get_cells {crypt25519}]

# light pink debug blocks
highlight_objects -color_index 17 -leaf_cells [get_cells {dbg_hub}]
highlight_objects -color_index 17 -leaf_cells [get_cells [list {interfaces/vio_*}]]
highlight_objects -color_index 17 -leaf_cells [get_cells [list mgmt/vio_irq]]
