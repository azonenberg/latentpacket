#set preRoutes [get_nets [ list \
#	port_g12/bridge/cdr/samples_hi_2x* \
#	port_g12/bridge/cdr/samples_lo_2x* \
#	port_g13/bridge/cdr/samples_hi_2x* \
#	port_g13/bridge/cdr/samples_lo_2x* ] ]
#route_design -nets [get_nets $preRoutes] -auto_delay
