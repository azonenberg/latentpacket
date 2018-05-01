EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Ethernet Magnetic EMC Characterization Board"
Date "2018-04-30"
Rev "0.1"
Comp "Andrew D. Zonenberg"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L special-azonenberg:BOURNS_PT6120EL L1
U 1 1 5AE6D5A4
P 2300 2300
F 0 "L1" H 2700 3875 50  0000 C CNN
F 1 "BOURNS_PT6120EL" H 2700 3784 50  0000 C CNN
F 2 "azonenberg_pcb:BOURNS_PT61020EL" H 2350 2250 50  0001 C CNN
F 3 "" H 2350 2250 50  0001 C CNN
	1    2300 2300
	1    0    0    -1  
$EndComp
$Comp
L special-azonenberg:STEWART_SS_74500_024 J1
U 1 1 5AE6D5D8
P 4500 2800
F 0 "J1" H 5177 3501 50  0000 L CNN
F 1 "STEWART_SS_74500_024" H 4500 2750 50  0000 L CNN
F 2 "azonenberg_pcb:CONN_STEWART_SS_74500_024" H 4500 2800 50  0001 C CNN
F 3 "" H 4500 2800 50  0001 C CNN
	1    4500 2800
	1    0    0    -1  
$EndComp
$Comp
L special-azonenberg:STEWART_SS_74500_024 J1
U 9 1 5AE6D6B2
P 14650 9050
F 0 "J1" H 15327 9746 50  0000 L CNN
F 1 "STEWART_SS_74500_024" H 14650 9000 50  0000 L CNN
F 2 "azonenberg_pcb:CONN_STEWART_SS_74500_024" H 14650 9050 50  0001 C CNN
F 3 "" H 14650 9050 50  0001 C CNN
	9    14650 9050
	1    0    0    -1  
$EndComp
$Comp
L device:C C2
U 1 1 5AE6D75D
P 14150 9000
F 0 "C2" V 13898 9000 50  0000 C CNN
F 1 "4.7 uF" V 13989 9000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_CAP_NOSILK" H 14188 8850 50  0001 C CNN
F 3 "" H 14150 9000 50  0001 C CNN
	1    14150 9000
	0    1    1    0   
$EndComp
Wire Wire Line
	14300 9000 14400 9000
Text Label 14000 9000 2    50   ~ 0
GND
$Comp
L device:C C3
U 1 1 5AE6D8F5
P 14150 9400
F 0 "C3" V 13898 9400 50  0000 C CNN
F 1 "4.7 uF" V 13989 9400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_CAP_NOSILK" H 14188 9250 50  0001 C CNN
F 3 "" H 14150 9400 50  0001 C CNN
	1    14150 9400
	0    1    1    0   
$EndComp
Wire Wire Line
	14000 9000 14000 9400
Wire Wire Line
	14300 9400 14300 9000
Connection ~ 14300 9000
NoConn ~ 4400 2450
NoConn ~ 4400 2550
NoConn ~ 4400 2650
NoConn ~ 4400 2750
Text Notes 2300 2450 0    50   ~ 0
AGGRESSOR port - just loopback\nWe're not using port D so swap for easier routing
Wire Wire Line
	2200 1550 1700 1550
Wire Wire Line
	1700 1550 1700 1750
Wire Wire Line
	1700 1750 2200 1750
Wire Wire Line
	2200 1650 1800 1650
Wire Wire Line
	1800 1650 1800 1850
Wire Wire Line
	1800 1850 2200 1850
$Comp
L device:R R1
U 1 1 5AE6E26B
P 1650 1950
F 0 "R1" V 1600 1800 50  0000 C CNN
F 1 "100" V 1650 1950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 1580 1950 50  0001 C CNN
F 3 "" H 1650 1950 50  0001 C CNN
	1    1650 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 1950 1800 1950
Wire Wire Line
	1500 1950 1500 2050
Wire Wire Line
	1500 2050 2200 2050
$Comp
L device:R R2
U 1 1 5AE6E952
P 1650 2150
F 0 "R2" V 1600 2000 50  0000 C CNN
F 1 "100" V 1650 2150 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 1580 2150 50  0001 C CNN
F 3 "" H 1650 2150 50  0001 C CNN
	1    1650 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 2150 1500 2250
Wire Wire Line
	1500 2250 2200 2250
Wire Wire Line
	1800 2150 2200 2150
$Comp
L special-azonenberg:STEWART_SS_74500_024 J1
U 2 1 5AE6F0D3
P 14550 3200
F 0 "J1" H 15227 3901 50  0000 L CNN
F 1 "STEWART_SS_74500_024" H 14550 3150 50  0000 L CNN
F 2 "azonenberg_pcb:CONN_STEWART_SS_74500_024" H 14550 3200 50  0001 C CNN
F 3 "" H 14550 3200 50  0001 C CNN
	2    14550 3200
	1    0    0    -1  
$EndComp
$Comp
L special-azonenberg:BOURNS_PT6120EL L2
U 1 1 5AE6F7DC
P 12700 2700
F 0 "L2" H 13100 4275 50  0000 C CNN
F 1 "BOURNS_PT6120EL" H 13100 4184 50  0000 C CNN
F 2 "azonenberg_pcb:BOURNS_PT61020EL" H 12750 2650 50  0001 C CNN
F 3 "" H 12750 2650 50  0001 C CNN
	1    12700 2700
	1    0    0    -1  
$EndComp
NoConn ~ 14450 2850
NoConn ~ 14450 2950
NoConn ~ 14450 3050
NoConn ~ 14450 3150
$Comp
L device:R R3
U 1 1 5AE73331
P 3450 950
F 0 "R3" V 3400 1200 50  0000 C CNN
F 1 "75" V 3450 950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3380 950 50  0001 C CNN
F 3 "" H 3450 950 50  0001 C CNN
	1    3450 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 950  3200 950 
$Comp
L device:R R4
U 1 1 5AE73A3C
P 3450 1050
F 0 "R4" V 3450 1300 50  0000 C CNN
F 1 "75" V 3450 1050 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3380 1050 50  0001 C CNN
F 3 "" H 3450 1050 50  0001 C CNN
	1    3450 1050
	0    1    1    0   
$EndComp
$Comp
L device:R R5
U 1 1 5AE73A62
P 3450 1150
F 0 "R5" V 3450 1400 50  0000 C CNN
F 1 "75" V 3450 1150 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3380 1150 50  0001 C CNN
F 3 "" H 3450 1150 50  0001 C CNN
	1    3450 1150
	0    1    1    0   
$EndComp
$Comp
L device:R R6
U 1 1 5AE73A8A
P 3450 1250
F 0 "R6" V 3450 1500 50  0000 C CNN
F 1 "75" V 3450 1250 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3380 1250 50  0001 C CNN
F 3 "" H 3450 1250 50  0001 C CNN
	1    3450 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 1250 3300 1250
Wire Wire Line
	3300 1150 3200 1150
Wire Wire Line
	3200 1050 3300 1050
Text Label 14400 8650 2    50   ~ 0
SHLD
Wire Wire Line
	14400 8650 14400 9000
Connection ~ 14400 9000
Wire Wire Line
	14400 9000 14550 9000
Text Label 4150 950  0    50   ~ 0
SHLD
$Comp
L device:C C1
U 1 1 5AE75683
P 3900 950
F 0 "C1" V 3648 950 50  0000 C CNN
F 1 "0.01 uF" V 3739 950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 3938 800 50  0001 C CNN
F 3 "" H 3900 950 50  0001 C CNN
	1    3900 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 950  4050 950 
Wire Wire Line
	3750 950  3600 950 
Wire Wire Line
	3600 950  3600 1050
Connection ~ 3600 950 
Wire Wire Line
	3600 1050 3600 1150
Connection ~ 3600 1050
Wire Wire Line
	3600 1150 3600 1250
Connection ~ 3600 1150
Text Notes 3850 1300 0    50   ~ 0
Don't worry about 2 kV rating, this is an EMC\ncharacterization rig that should never be\nhooked up to an actual LAN
$Comp
L device:R R11
U 1 1 5AE788CB
P 13850 1350
F 0 "R11" V 13800 1600 50  0000 C CNN
F 1 "75" V 13850 1350 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 13780 1350 50  0001 C CNN
F 3 "" H 13850 1350 50  0001 C CNN
	1    13850 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	13700 1350 13600 1350
$Comp
L device:R R12
U 1 1 5AE788D2
P 13850 1450
F 0 "R12" V 13850 1700 50  0000 C CNN
F 1 "75" V 13850 1450 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 13780 1450 50  0001 C CNN
F 3 "" H 13850 1450 50  0001 C CNN
	1    13850 1450
	0    1    1    0   
$EndComp
$Comp
L device:R R13
U 1 1 5AE788D8
P 13850 1550
F 0 "R13" V 13850 1800 50  0000 C CNN
F 1 "75" V 13850 1550 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 13780 1550 50  0001 C CNN
F 3 "" H 13850 1550 50  0001 C CNN
	1    13850 1550
	0    1    1    0   
$EndComp
$Comp
L device:R R14
U 1 1 5AE788DE
P 13850 1650
F 0 "R14" V 13850 1900 50  0000 C CNN
F 1 "75" V 13850 1650 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 13780 1650 50  0001 C CNN
F 3 "" H 13850 1650 50  0001 C CNN
	1    13850 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	13600 1650 13700 1650
Wire Wire Line
	13700 1550 13600 1550
Wire Wire Line
	13600 1450 13700 1450
Text Label 14550 1350 0    50   ~ 0
SHLD
$Comp
L device:C C8
U 1 1 5AE788E8
P 14300 1350
F 0 "C8" V 14048 1350 50  0000 C CNN
F 1 "0.01 uF" V 14139 1350 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 14338 1200 50  0001 C CNN
F 3 "" H 14300 1350 50  0001 C CNN
	1    14300 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	14550 1350 14450 1350
Wire Wire Line
	14150 1350 14000 1350
Wire Wire Line
	14000 1350 14000 1450
Connection ~ 14000 1350
Wire Wire Line
	14000 1450 14000 1550
Connection ~ 14000 1450
Wire Wire Line
	14000 1550 14000 1650
Connection ~ 14000 1550
$Comp
L device:C C7
U 1 1 5AE7977D
P 12400 1200
F 0 "C7" H 12515 1246 50  0000 L CNN
F 1 "0.1 uF" H 12515 1155 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 12438 1050 50  0001 C CNN
F 3 "" H 12400 1200 50  0001 C CNN
	1    12400 1200
	1    0    0    -1  
$EndComp
Text Label 12500 1050 0    50   ~ 0
GND
Wire Wire Line
	12500 1050 12400 1050
$Comp
L device:C C6
U 1 1 5AE7A5BF
P 12000 1300
F 0 "C6" H 12115 1346 50  0000 L CNN
F 1 "0.1 uF" H 12115 1255 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 12038 1150 50  0001 C CNN
F 3 "" H 12000 1300 50  0001 C CNN
	1    12000 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	12600 1350 12400 1350
Wire Wire Line
	12600 1450 12000 1450
$Comp
L device:C C5
U 1 1 5AE7DE88
P 11600 1400
F 0 "C5" H 11715 1446 50  0000 L CNN
F 1 "0.1 uF" H 11715 1355 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 11638 1250 50  0001 C CNN
F 3 "" H 11600 1400 50  0001 C CNN
	1    11600 1400
	1    0    0    -1  
$EndComp
$Comp
L device:C C4
U 1 1 5AE800FE
P 11150 1500
F 0 "C4" H 11265 1546 50  0000 L CNN
F 1 "0.1 uF" H 11265 1455 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 11188 1350 50  0001 C CNN
F 3 "" H 11150 1500 50  0001 C CNN
	1    11150 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	12600 1650 11150 1650
Wire Wire Line
	11150 1350 11150 1050
Connection ~ 12400 1050
Wire Wire Line
	12000 1150 12000 1050
Wire Wire Line
	11150 1050 11600 1050
Connection ~ 12000 1050
Wire Wire Line
	12000 1050 12400 1050
Wire Wire Line
	11600 1250 11600 1050
Connection ~ 11600 1050
Wire Wire Line
	11600 1050 12000 1050
Wire Wire Line
	11600 1550 12600 1550
$Comp
L device:R R7
U 1 1 5AE85607
P 12250 1950
F 0 "R7" V 12200 1800 50  0000 C CNN
F 1 "100" V 12250 1950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 12180 1950 50  0001 C CNN
F 3 "" H 12250 1950 50  0001 C CNN
	1    12250 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	12600 1950 12400 1950
Wire Wire Line
	12100 1950 11950 1950
Wire Wire Line
	11950 1950 11950 2050
Wire Wire Line
	11950 2050 12600 2050
$Comp
L device:R R8
U 1 1 5AE89239
P 12250 2150
F 0 "R8" V 12200 2000 50  0000 C CNN
F 1 "100" V 12250 2150 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 12180 2150 50  0001 C CNN
F 3 "" H 12250 2150 50  0001 C CNN
	1    12250 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	12100 2150 11950 2150
Wire Wire Line
	11950 2150 11950 2250
Wire Wire Line
	11950 2250 12600 2250
Wire Wire Line
	12400 2150 12600 2150
$Comp
L device:R R9
U 1 1 5AE8C0DB
P 12250 2350
F 0 "R9" V 12200 2200 50  0000 C CNN
F 1 "100" V 12250 2350 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 12180 2350 50  0001 C CNN
F 3 "" H 12250 2350 50  0001 C CNN
	1    12250 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	12100 2350 11950 2350
Wire Wire Line
	11950 2350 11950 2450
Wire Wire Line
	11950 2450 12600 2450
Wire Wire Line
	12400 2350 12600 2350
$Comp
L device:R R10
U 1 1 5AE8DB4F
P 12250 2550
F 0 "R10" V 12200 2400 50  0000 C CNN
F 1 "100" V 12250 2550 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 12180 2550 50  0001 C CNN
F 3 "" H 12250 2550 50  0001 C CNN
	1    12250 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	12100 2550 11950 2550
Wire Wire Line
	11950 2550 11950 2650
Wire Wire Line
	11950 2650 12600 2650
Wire Wire Line
	12400 2550 12600 2550
Text Label 12550 1950 2    50   ~ 0
A_P
Text Label 12550 2050 2    50   ~ 0
A_N
Text Label 12550 2150 2    50   ~ 0
B_P
Text Label 12550 2250 2    50   ~ 0
B_N
Text Label 12550 2350 2    50   ~ 0
C_P
Text Label 12550 2450 2    50   ~ 0
C_N
Text Label 12550 2650 2    50   ~ 0
D_P
Text Label 12550 2550 2    50   ~ 0
D_N
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5AE9012F
P 700 9900
F 0 "J2" H 655 10138 50  0000 C CNN
F 1 "SMA" H 655 10047 50  0000 C CNN
F 2 "azonenberg_pcb:CONN_SMA_EDGE_SAMTEC_SMA_J_P_H_ST_EM1" H 700 9900 50  0001 C CNN
F 3 "" H 700 9900 50  0001 C CNN
	1    700  9900
	-1   0    0    -1  
$EndComp
Text Label 1250 9900 0    50   ~ 0
A_P
Wire Wire Line
	950  9900 850  9900
Text Label 950  10100 0    50   ~ 0
GND
Wire Wire Line
	950  10100 700  10100
$Comp
L Connector:Conn_Coaxial J3
U 1 1 5AE9428E
P 700 10500
F 0 "J3" H 655 10738 50  0000 C CNN
F 1 "SMA" H 655 10647 50  0000 C CNN
F 2 "azonenberg_pcb:CONN_SMA_EDGE_SAMTEC_SMA_J_P_H_ST_EM1" H 700 10500 50  0001 C CNN
F 3 "" H 700 10500 50  0001 C CNN
	1    700  10500
	-1   0    0    -1  
$EndComp
Text Label 1250 10500 0    50   ~ 0
A_N
Wire Wire Line
	950  10500 850  10500
Text Label 950  10700 0    50   ~ 0
GND
Wire Wire Line
	950  10700 700  10700
$Comp
L Connector:Conn_Coaxial J4
U 1 1 5AE964FC
P 1600 9900
F 0 "J4" H 1555 10138 50  0000 C CNN
F 1 "SMA" H 1555 10047 50  0000 C CNN
F 2 "azonenberg_pcb:CONN_SMA_EDGE_SAMTEC_SMA_J_P_H_ST_EM1" H 1600 9900 50  0001 C CNN
F 3 "" H 1600 9900 50  0001 C CNN
	1    1600 9900
	-1   0    0    -1  
$EndComp
Text Label 2150 9900 0    50   ~ 0
B_P
Wire Wire Line
	1850 9900 1750 9900
Text Label 1850 10100 0    50   ~ 0
GND
Wire Wire Line
	1850 10100 1600 10100
$Comp
L Connector:Conn_Coaxial J5
U 1 1 5AE96506
P 1600 10500
F 0 "J5" H 1555 10738 50  0000 C CNN
F 1 "SMA" H 1555 10647 50  0000 C CNN
F 2 "azonenberg_pcb:CONN_SMA_EDGE_SAMTEC_SMA_J_P_H_ST_EM1" H 1600 10500 50  0001 C CNN
F 3 "" H 1600 10500 50  0001 C CNN
	1    1600 10500
	-1   0    0    -1  
$EndComp
Text Label 2150 10500 0    50   ~ 0
B_N
Wire Wire Line
	1850 10500 1750 10500
Text Label 1850 10700 0    50   ~ 0
GND
Wire Wire Line
	1850 10700 1600 10700
$Comp
L Connector:Conn_Coaxial J6
U 1 1 5AE98C7A
P 2500 9900
F 0 "J6" H 2455 10138 50  0000 C CNN
F 1 "SMA" H 2455 10047 50  0000 C CNN
F 2 "azonenberg_pcb:CONN_SMA_EDGE_SAMTEC_SMA_J_P_H_ST_EM1" H 2500 9900 50  0001 C CNN
F 3 "" H 2500 9900 50  0001 C CNN
	1    2500 9900
	-1   0    0    -1  
$EndComp
Text Label 3050 9900 0    50   ~ 0
C_P
Wire Wire Line
	2750 9900 2650 9900
Text Label 2750 10100 0    50   ~ 0
GND
Wire Wire Line
	2750 10100 2500 10100
$Comp
L Connector:Conn_Coaxial J7
U 1 1 5AE98C84
P 2500 10500
F 0 "J7" H 2455 10738 50  0000 C CNN
F 1 "SMA" H 2455 10647 50  0000 C CNN
F 2 "azonenberg_pcb:CONN_SMA_EDGE_SAMTEC_SMA_J_P_H_ST_EM1" H 2500 10500 50  0001 C CNN
F 3 "" H 2500 10500 50  0001 C CNN
	1    2500 10500
	-1   0    0    -1  
$EndComp
Text Label 3050 10500 0    50   ~ 0
C_N
Wire Wire Line
	2750 10500 2650 10500
Text Label 2750 10700 0    50   ~ 0
GND
Wire Wire Line
	2750 10700 2500 10700
$Comp
L Connector:Conn_Coaxial J8
U 1 1 5AE98C8E
P 3400 9900
F 0 "J8" H 3355 10138 50  0000 C CNN
F 1 "SMA" H 3355 10047 50  0000 C CNN
F 2 "azonenberg_pcb:CONN_SMA_EDGE_SAMTEC_SMA_J_P_H_ST_EM1" H 3400 9900 50  0001 C CNN
F 3 "" H 3400 9900 50  0001 C CNN
	1    3400 9900
	-1   0    0    -1  
$EndComp
Text Label 3950 9900 0    50   ~ 0
D_P
Wire Wire Line
	3650 9900 3550 9900
Text Label 3650 10100 0    50   ~ 0
GND
Wire Wire Line
	3650 10100 3400 10100
$Comp
L Connector:Conn_Coaxial J9
U 1 1 5AE98C98
P 3400 10500
F 0 "J9" H 3355 10738 50  0000 C CNN
F 1 "SMA" H 3355 10647 50  0000 C CNN
F 2 "azonenberg_pcb:CONN_SMA_EDGE_SAMTEC_SMA_J_P_H_ST_EM1" H 3400 10500 50  0001 C CNN
F 3 "" H 3400 10500 50  0001 C CNN
	1    3400 10500
	-1   0    0    -1  
$EndComp
Text Label 3950 10500 0    50   ~ 0
D_N
Wire Wire Line
	3650 10500 3550 10500
Text Label 3650 10700 0    50   ~ 0
GND
Wire Wire Line
	3650 10700 3400 10700
$Comp
L device:C C12
U 1 1 5AE9EFF4
P 2000 800
F 0 "C12" H 2115 846 50  0000 L CNN
F 1 "0.1 uF" H 2115 755 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 2038 650 50  0001 C CNN
F 3 "" H 2000 800 50  0001 C CNN
	1    2000 800 
	1    0    0    -1  
$EndComp
Text Label 2100 650  0    50   ~ 0
GND
Wire Wire Line
	2100 650  2000 650 
$Comp
L device:C C11
U 1 1 5AE9EFFC
P 1600 900
F 0 "C11" H 1715 946 50  0000 L CNN
F 1 "0.1 uF" H 1715 855 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 1638 750 50  0001 C CNN
F 3 "" H 1600 900 50  0001 C CNN
	1    1600 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 950  2000 950 
Wire Wire Line
	2200 1050 1600 1050
$Comp
L device:C C10
U 1 1 5AE9F004
P 1200 1000
F 0 "C10" H 1315 1046 50  0000 L CNN
F 1 "0.1 uF" H 1315 955 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 1238 850 50  0001 C CNN
F 3 "" H 1200 1000 50  0001 C CNN
	1    1200 1000
	1    0    0    -1  
$EndComp
$Comp
L device:C C9
U 1 1 5AE9F00A
P 750 1100
F 0 "C9" H 865 1146 50  0000 L CNN
F 1 "0.1 uF" H 865 1055 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 788 950 50  0001 C CNN
F 3 "" H 750 1100 50  0001 C CNN
	1    750  1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1250 750  1250
Wire Wire Line
	750  950  750  650 
Connection ~ 2000 650 
Wire Wire Line
	1600 750  1600 650 
Wire Wire Line
	750  650  1200 650 
Connection ~ 1600 650 
Wire Wire Line
	1600 650  2000 650 
Wire Wire Line
	1200 850  1200 650 
Connection ~ 1200 650 
Wire Wire Line
	1200 650  1600 650 
Wire Wire Line
	1200 1150 2200 1150
Text Notes 12700 2950 0    50   ~ 0
VICTIM port\nTerminations plus test points\nSwap A/B/C/D pairs for easier routing
$Comp
L Connector:Conn_01x01 MH3
U 1 1 5AEA7E91
P 13150 8350
F 0 "MH3" H 13230 8392 50  0000 L CNN
F 1 "Conn_01x01" H 13230 8301 50  0000 L CNN
F 2 "azonenberg_pcb:MECHANICAL_CLEARANCEHOLE_4_40" H 13150 8350 50  0001 C CNN
F 3 "~" H 13150 8350 50  0001 C CNN
	1    13150 8350
	1    0    0    -1  
$EndComp
NoConn ~ 12950 8350
$Comp
L Connector:Conn_01x01 MH4
U 1 1 5AEABD4A
P 13150 8600
F 0 "MH4" H 13230 8642 50  0000 L CNN
F 1 "Conn_01x01" H 13230 8551 50  0000 L CNN
F 2 "azonenberg_pcb:MECHANICAL_CLEARANCEHOLE_4_40" H 13150 8600 50  0001 C CNN
F 3 "~" H 13150 8600 50  0001 C CNN
	1    13150 8600
	1    0    0    -1  
$EndComp
NoConn ~ 12950 8600
$Comp
L Connector:Conn_01x01 MH1
U 1 1 5AEB3845
P 13150 7850
F 0 "MH1" H 13230 7892 50  0000 L CNN
F 1 "Conn_01x01" H 13230 7801 50  0000 L CNN
F 2 "azonenberg_pcb:MECHANICAL_CLEARANCEHOLE_4_40" H 13150 7850 50  0001 C CNN
F 3 "~" H 13150 7850 50  0001 C CNN
	1    13150 7850
	1    0    0    -1  
$EndComp
NoConn ~ 12950 7850
$Comp
L Connector:Conn_01x01 MH2
U 1 1 5AEB384C
P 13150 8100
F 0 "MH2" H 13230 8142 50  0000 L CNN
F 1 "Conn_01x01" H 13230 8051 50  0000 L CNN
F 2 "azonenberg_pcb:MECHANICAL_CLEARANCEHOLE_4_40" H 13150 8100 50  0001 C CNN
F 3 "~" H 13150 8100 50  0001 C CNN
	1    13150 8100
	1    0    0    -1  
$EndComp
NoConn ~ 12950 8100
Text Label 4400 1550 2    50   ~ 0
AGG_A_P
Text Label 4400 1650 2    50   ~ 0
AGG_A_N
Text Label 4400 1750 2    50   ~ 0
AGG_B_P
Text Label 4400 1850 2    50   ~ 0
AGG_B_N
Text Label 4400 2050 2    50   ~ 0
AGG_C_N
Text Label 4400 1950 2    50   ~ 0
AGG_C_P
Text Label 4400 2150 2    50   ~ 0
AGG_D_P
Text Label 4400 2250 2    50   ~ 0
AGG_D_N
Text Label 13600 1950 0    50   ~ 0
VIC_A_P
Text Label 13600 2050 0    50   ~ 0
VIC_A_N
Text Label 13600 2150 0    50   ~ 0
VIC_B_P
Text Label 13600 2250 0    50   ~ 0
VIC_B_N
Text Label 13600 2350 0    50   ~ 0
VIC_C_P
Text Label 13600 2450 0    50   ~ 0
VIC_C_N
Text Label 13600 2650 0    50   ~ 0
VIC_D_P
Text Label 13600 2550 0    50   ~ 0
VIC_D_N
Text Label 14450 1950 2    50   ~ 0
VIC_A_P
Text Label 14450 2050 2    50   ~ 0
VIC_A_N
Text Label 14450 2150 2    50   ~ 0
VIC_B_P
Text Label 14450 2250 2    50   ~ 0
VIC_B_N
Text Label 14450 2350 2    50   ~ 0
VIC_C_P
Text Label 14450 2450 2    50   ~ 0
VIC_C_N
Text Label 14450 2550 2    50   ~ 0
VIC_D_P
Text Label 14450 2650 2    50   ~ 0
VIC_D_N
Text Label 3200 1550 0    50   ~ 0
AGG_A_P
Text Label 3200 1650 0    50   ~ 0
AGG_A_N
Text Label 3200 1750 0    50   ~ 0
AGG_B_P
Text Label 3200 1850 0    50   ~ 0
AGG_B_N
Text Label 3200 2050 0    50   ~ 0
AGG_C_N
Text Label 3200 1950 0    50   ~ 0
AGG_C_P
Text Label 3200 2250 0    50   ~ 0
AGG_D_P
Text Label 3200 2150 0    50   ~ 0
AGG_D_N
$Comp
L device:R R15
U 1 1 5AF27585
P 1100 9900
F 0 "R15" V 1050 9750 50  0000 C CNN
F 1 "953" V 1100 9900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 1030 9900 50  0001 C CNN
F 3 "" H 1100 9900 50  0001 C CNN
	1    1100 9900
	0    1    1    0   
$EndComp
$Comp
L device:R R16
U 1 1 5AF2A7B5
P 1100 10500
F 0 "R16" V 1050 10350 50  0000 C CNN
F 1 "953" V 1100 10500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 1030 10500 50  0001 C CNN
F 3 "" H 1100 10500 50  0001 C CNN
	1    1100 10500
	0    1    1    0   
$EndComp
$Comp
L device:R R17
U 1 1 5AF301BD
P 2000 9900
F 0 "R17" V 1950 9750 50  0000 C CNN
F 1 "953" V 2000 9900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 1930 9900 50  0001 C CNN
F 3 "" H 2000 9900 50  0001 C CNN
	1    2000 9900
	0    1    1    0   
$EndComp
$Comp
L device:R R18
U 1 1 5AF32F8A
P 2000 10500
F 0 "R18" V 1950 10350 50  0000 C CNN
F 1 "953" V 2000 10500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 1930 10500 50  0001 C CNN
F 3 "" H 2000 10500 50  0001 C CNN
	1    2000 10500
	0    1    1    0   
$EndComp
$Comp
L device:R R19
U 1 1 5AF3B880
P 2900 9900
F 0 "R19" V 2850 9750 50  0000 C CNN
F 1 "953" V 2900 9900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2830 9900 50  0001 C CNN
F 3 "" H 2900 9900 50  0001 C CNN
	1    2900 9900
	0    1    1    0   
$EndComp
$Comp
L device:R R20
U 1 1 5AF3B936
P 2900 10500
F 0 "R20" V 2850 10350 50  0000 C CNN
F 1 "953" V 2900 10500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2830 10500 50  0001 C CNN
F 3 "" H 2900 10500 50  0001 C CNN
	1    2900 10500
	0    1    1    0   
$EndComp
$Comp
L device:R R21
U 1 1 5AF3ED21
P 3800 9900
F 0 "R21" V 3750 9750 50  0000 C CNN
F 1 "953" V 3800 9900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3730 9900 50  0001 C CNN
F 3 "" H 3800 9900 50  0001 C CNN
	1    3800 9900
	0    1    1    0   
$EndComp
$Comp
L device:R R22
U 1 1 5AF3EDBF
P 3800 10500
F 0 "R22" V 3750 10350 50  0000 C CNN
F 1 "953" V 3800 10500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3730 10500 50  0001 C CNN
F 3 "" H 3800 10500 50  0001 C CNN
	1    3800 10500
	0    1    1    0   
$EndComp
Text Notes 1200 3250 0    50   ~ 0
15 dB attenuators for victim signal
Text Notes 13100 7650 0    50   ~ 0
Shield and mechanical
Text Notes 700  10900 0    50   ~ 0
SMA test points for victim port
$Comp
L device:R R23
U 1 1 5AF50187
P 2450 3300
F 0 "R23" V 2500 3450 50  0000 C CNN
F 1 "34.8" V 2450 3300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 3300 50  0001 C CNN
F 3 "" H 2450 3300 50  0001 C CNN
	1    2450 3300
	0    1    1    0   
$EndComp
$Comp
L special-azonenberg:STEWART_SS_74500_024 J1
U 4 1 5AF50318
P 4500 4550
F 0 "J1" H 5177 5251 50  0000 L CNN
F 1 "STEWART_SS_74500_024" H 4500 4500 50  0000 L CNN
F 2 "azonenberg_pcb:CONN_STEWART_SS_74500_024" H 4500 4550 50  0001 C CNN
F 3 "" H 4500 4550 50  0001 C CNN
	4    4500 4550
	1    0    0    -1  
$EndComp
$Comp
L special-azonenberg:STEWART_SS_74500_024 J1
U 3 1 5AF5040E
P 1850 6650
F 0 "J1" H 2527 7351 50  0000 L CNN
F 1 "STEWART_SS_74500_024" H 1850 6600 50  0000 L CNN
F 2 "azonenberg_pcb:CONN_STEWART_SS_74500_024" H 1850 6650 50  0001 C CNN
F 3 "" H 1850 6650 50  0001 C CNN
	3    1850 6650
	-1   0    0    -1  
$EndComp
NoConn ~ 1950 4200
NoConn ~ 1950 4300
NoConn ~ 1950 4400
NoConn ~ 4400 4500
NoConn ~ 4400 4400
NoConn ~ 4400 4300
NoConn ~ 4400 4200
$Comp
L device:R R24
U 1 1 5AF702A8
P 2450 3400
F 0 "R24" V 2300 3550 50  0000 C CNN
F 1 "34.8" V 2450 3400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 3400 50  0001 C CNN
F 3 "" H 2450 3400 50  0001 C CNN
	1    2450 3400
	0    1    1    0   
$EndComp
$Comp
L device:R R25
U 1 1 5AF70682
P 2450 3500
F 0 "R25" V 2500 3650 50  0000 C CNN
F 1 "34.8" V 2450 3500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 3500 50  0001 C CNN
F 3 "" H 2450 3500 50  0001 C CNN
	1    2450 3500
	0    1    1    0   
$EndComp
$Comp
L device:R R26
U 1 1 5AF70688
P 2450 3600
F 0 "R26" V 2300 3750 50  0000 C CNN
F 1 "34.8" V 2450 3600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 3600 50  0001 C CNN
F 3 "" H 2450 3600 50  0001 C CNN
	1    2450 3600
	0    1    1    0   
$EndComp
$Comp
L device:R R27
U 1 1 5AF73490
P 2450 3700
F 0 "R27" V 2500 3850 50  0000 C CNN
F 1 "34.8" V 2450 3700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 3700 50  0001 C CNN
F 3 "" H 2450 3700 50  0001 C CNN
	1    2450 3700
	0    1    1    0   
$EndComp
$Comp
L device:R R28
U 1 1 5AF73496
P 2450 3800
F 0 "R28" V 2300 3950 50  0000 C CNN
F 1 "34.8" V 2450 3800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 3800 50  0001 C CNN
F 3 "" H 2450 3800 50  0001 C CNN
	1    2450 3800
	0    1    1    0   
$EndComp
$Comp
L device:R R29
U 1 1 5AF7349C
P 2450 3900
F 0 "R29" V 2500 4050 50  0000 C CNN
F 1 "34.8" V 2450 3900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 3900 50  0001 C CNN
F 3 "" H 2450 3900 50  0001 C CNN
	1    2450 3900
	0    1    1    0   
$EndComp
$Comp
L device:R R30
U 1 1 5AF734A2
P 2450 4000
F 0 "R30" V 2300 4150 50  0000 C CNN
F 1 "34.8" V 2450 4000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 4000 50  0001 C CNN
F 3 "" H 2450 4000 50  0001 C CNN
	1    2450 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 3300 2300 3300
Wire Wire Line
	1950 3400 2300 3400
Wire Wire Line
	1950 3500 2300 3500
Wire Wire Line
	1950 3600 2300 3600
Wire Wire Line
	1950 3700 2300 3700
Wire Wire Line
	1950 3800 2300 3800
Wire Wire Line
	1950 3900 2300 3900
Wire Wire Line
	1950 4000 2300 4000
Text Label 2000 3300 0    50   ~ 0
A1_A_P
Text Label 2000 3400 0    50   ~ 0
A1_A_N
Text Label 2000 3500 0    50   ~ 0
A1_B_P
Text Label 2000 3600 0    50   ~ 0
A1_B_N
Text Label 2000 3700 0    50   ~ 0
A1_C_P
Text Label 2000 3800 0    50   ~ 0
A1_C_N
Text Label 2000 3900 0    50   ~ 0
A1_D_P
Text Label 2000 4000 0    50   ~ 0
A1_D_N
$Comp
L device:R R47
U 1 1 5AFB1D9C
P 3750 3300
F 0 "R47" V 3800 3450 50  0000 C CNN
F 1 "34.8" V 3750 3300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 3300 50  0001 C CNN
F 3 "" H 3750 3300 50  0001 C CNN
	1    3750 3300
	0    1    1    0   
$EndComp
$Comp
L device:R R48
U 1 1 5AFB1DA2
P 3750 3400
F 0 "R48" V 3600 3550 50  0000 C CNN
F 1 "34.8" V 3750 3400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 3400 50  0001 C CNN
F 3 "" H 3750 3400 50  0001 C CNN
	1    3750 3400
	0    1    1    0   
$EndComp
$Comp
L device:R R49
U 1 1 5AFB1DA8
P 3750 3500
F 0 "R49" V 3800 3650 50  0000 C CNN
F 1 "34.8" V 3750 3500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 3500 50  0001 C CNN
F 3 "" H 3750 3500 50  0001 C CNN
	1    3750 3500
	0    1    1    0   
$EndComp
$Comp
L device:R R50
U 1 1 5AFB1DAE
P 3750 3600
F 0 "R50" V 3600 3750 50  0000 C CNN
F 1 "34.8" V 3750 3600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 3600 50  0001 C CNN
F 3 "" H 3750 3600 50  0001 C CNN
	1    3750 3600
	0    1    1    0   
$EndComp
$Comp
L device:R R51
U 1 1 5AFB1DB4
P 3750 3700
F 0 "R51" V 3800 3850 50  0000 C CNN
F 1 "34.8" V 3750 3700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 3700 50  0001 C CNN
F 3 "" H 3750 3700 50  0001 C CNN
	1    3750 3700
	0    1    1    0   
$EndComp
$Comp
L device:R R52
U 1 1 5AFB1DBA
P 3750 3800
F 0 "R52" V 3600 3950 50  0000 C CNN
F 1 "34.8" V 3750 3800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 3800 50  0001 C CNN
F 3 "" H 3750 3800 50  0001 C CNN
	1    3750 3800
	0    1    1    0   
$EndComp
$Comp
L device:R R53
U 1 1 5AFB1DC0
P 3750 3900
F 0 "R53" V 3800 4050 50  0000 C CNN
F 1 "34.8" V 3750 3900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 3900 50  0001 C CNN
F 3 "" H 3750 3900 50  0001 C CNN
	1    3750 3900
	0    1    1    0   
$EndComp
$Comp
L device:R R54
U 1 1 5AFB1DC6
P 3750 4000
F 0 "R54" V 3600 4150 50  0000 C CNN
F 1 "34.8" V 3750 4000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 4000 50  0001 C CNN
F 3 "" H 3750 4000 50  0001 C CNN
	1    3750 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 4000 4400 4000
Wire Wire Line
	4400 3900 3900 3900
Wire Wire Line
	3900 3800 4400 3800
Wire Wire Line
	4400 3700 3900 3700
Wire Wire Line
	3900 3600 4400 3600
Wire Wire Line
	4400 3500 3900 3500
Wire Wire Line
	3900 3300 4400 3300
Wire Wire Line
	4400 3400 3900 3400
Text Label 3950 3300 0    50   ~ 0
A1X_A_P
Text Label 3950 3400 0    50   ~ 0
A1X_A_N
Text Label 3950 3500 0    50   ~ 0
A1X_B_P
Text Label 3950 3600 0    50   ~ 0
A1X_B_N
Text Label 3950 3700 0    50   ~ 0
A1X_C_P
Text Label 3950 3800 0    50   ~ 0
A1X_C_N
Text Label 3950 3900 0    50   ~ 0
A1X_D_P
Text Label 3950 4000 0    50   ~ 0
A1X_D_N
$Comp
L device:R R39
U 1 1 5AFD9820
P 3050 4350
F 0 "R39" V 3100 4500 50  0000 C CNN
F 1 "36.5" V 3050 4350 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2980 4350 50  0001 C CNN
F 3 "" H 3050 4350 50  0001 C CNN
	1    3050 4350
	0    1    1    0   
$EndComp
$Comp
L device:R R40
U 1 1 5AFD99AD
P 3050 4550
F 0 "R40" V 3100 4700 50  0000 C CNN
F 1 "36.5" V 3050 4550 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2980 4550 50  0001 C CNN
F 3 "" H 3050 4550 50  0001 C CNN
	1    3050 4550
	0    1    1    0   
$EndComp
$Comp
L device:R R41
U 1 1 5AFD9A53
P 3050 4750
F 0 "R41" V 3100 4900 50  0000 C CNN
F 1 "36.5" V 3050 4750 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2980 4750 50  0001 C CNN
F 3 "" H 3050 4750 50  0001 C CNN
	1    3050 4750
	0    1    1    0   
$EndComp
$Comp
L device:R R42
U 1 1 5AFD9AF7
P 3050 4950
F 0 "R42" V 3100 5100 50  0000 C CNN
F 1 "36.5" V 3050 4950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2980 4950 50  0001 C CNN
F 3 "" H 3050 4950 50  0001 C CNN
	1    3050 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 3400 3600 3400
Wire Wire Line
	3600 3500 2600 3500
Wire Wire Line
	2600 3600 3600 3600
Wire Wire Line
	3600 3700 2600 3700
Wire Wire Line
	2600 3800 3600 3800
Wire Wire Line
	3600 4000 2600 4000
Wire Wire Line
	2600 3900 3600 3900
Wire Wire Line
	3600 3300 2600 3300
Text Label 2900 3300 0    50   ~ 0
A1Y_A_P
Text Label 2900 3400 0    50   ~ 0
A1Y_A_N
Text Label 2900 3500 0    50   ~ 0
A1Y_B_P
Text Label 2900 3600 0    50   ~ 0
A1Y_B_N
Text Label 2900 3700 0    50   ~ 0
A1Y_C_P
Text Label 2900 3800 0    50   ~ 0
A1Y_C_N
Text Label 2900 3900 0    50   ~ 0
A1Y_D_P
Text Label 2900 4000 0    50   ~ 0
A1Y_D_N
Text Label 2900 4350 2    50   ~ 0
A1Y_A_P
Text Label 3200 4350 0    50   ~ 0
A1Y_A_N
Text Label 2900 4550 2    50   ~ 0
A1Y_B_P
Text Label 3200 4550 0    50   ~ 0
A1Y_B_N
Text Label 2900 4750 2    50   ~ 0
A1Y_C_P
Text Label 3200 4750 0    50   ~ 0
A1Y_C_N
Text Label 2900 4950 2    50   ~ 0
A1Y_D_P
Text Label 3200 4950 0    50   ~ 0
A1Y_D_N
$Comp
L device:R R31
U 1 1 5B0213BE
P 2450 5400
F 0 "R31" V 2500 5550 50  0000 C CNN
F 1 "34.8" V 2450 5400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 5400 50  0001 C CNN
F 3 "" H 2450 5400 50  0001 C CNN
	1    2450 5400
	0    1    1    0   
$EndComp
$Comp
L special-azonenberg:STEWART_SS_74500_024 J1
U 6 1 5B0213C4
P 4500 6650
F 0 "J1" H 5177 7351 50  0000 L CNN
F 1 "STEWART_SS_74500_024" H 4500 6600 50  0000 L CNN
F 2 "azonenberg_pcb:CONN_STEWART_SS_74500_024" H 4500 6650 50  0001 C CNN
F 3 "" H 4500 6650 50  0001 C CNN
	6    4500 6650
	1    0    0    -1  
$EndComp
$Comp
L special-azonenberg:STEWART_SS_74500_024 J1
U 5 1 5B0213CA
P 1850 4550
F 0 "J1" H 2527 5251 50  0000 L CNN
F 1 "STEWART_SS_74500_024" H 1850 4500 50  0000 L CNN
F 2 "azonenberg_pcb:CONN_STEWART_SS_74500_024" H 1850 4550 50  0001 C CNN
F 3 "" H 1850 4550 50  0001 C CNN
	5    1850 4550
	-1   0    0    -1  
$EndComp
NoConn ~ 1950 6300
NoConn ~ 1950 6400
NoConn ~ 1950 6500
NoConn ~ 4400 6600
NoConn ~ 4400 6500
NoConn ~ 4400 6400
NoConn ~ 4400 6300
$Comp
L device:R R32
U 1 1 5B0213D7
P 2450 5500
F 0 "R32" V 2300 5650 50  0000 C CNN
F 1 "34.8" V 2450 5500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 5500 50  0001 C CNN
F 3 "" H 2450 5500 50  0001 C CNN
	1    2450 5500
	0    1    1    0   
$EndComp
$Comp
L device:R R33
U 1 1 5B0213DD
P 2450 5600
F 0 "R33" V 2500 5750 50  0000 C CNN
F 1 "34.8" V 2450 5600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 5600 50  0001 C CNN
F 3 "" H 2450 5600 50  0001 C CNN
	1    2450 5600
	0    1    1    0   
$EndComp
$Comp
L device:R R34
U 1 1 5B0213E3
P 2450 5700
F 0 "R34" V 2300 5850 50  0000 C CNN
F 1 "34.8" V 2450 5700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 5700 50  0001 C CNN
F 3 "" H 2450 5700 50  0001 C CNN
	1    2450 5700
	0    1    1    0   
$EndComp
$Comp
L device:R R35
U 1 1 5B0213E9
P 2450 5800
F 0 "R35" V 2500 5950 50  0000 C CNN
F 1 "34.8" V 2450 5800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 5800 50  0001 C CNN
F 3 "" H 2450 5800 50  0001 C CNN
	1    2450 5800
	0    1    1    0   
$EndComp
$Comp
L device:R R36
U 1 1 5B0213EF
P 2450 5900
F 0 "R36" V 2300 6050 50  0000 C CNN
F 1 "34.8" V 2450 5900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 5900 50  0001 C CNN
F 3 "" H 2450 5900 50  0001 C CNN
	1    2450 5900
	0    1    1    0   
$EndComp
$Comp
L device:R R37
U 1 1 5B0213F5
P 2450 6000
F 0 "R37" V 2500 6150 50  0000 C CNN
F 1 "34.8" V 2450 6000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 6000 50  0001 C CNN
F 3 "" H 2450 6000 50  0001 C CNN
	1    2450 6000
	0    1    1    0   
$EndComp
$Comp
L device:R R38
U 1 1 5B0213FB
P 2450 6100
F 0 "R38" V 2300 6250 50  0000 C CNN
F 1 "34.8" V 2450 6100 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2380 6100 50  0001 C CNN
F 3 "" H 2450 6100 50  0001 C CNN
	1    2450 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 5400 2300 5400
Wire Wire Line
	1950 5500 2300 5500
Wire Wire Line
	1950 5600 2300 5600
Wire Wire Line
	1950 5700 2300 5700
Wire Wire Line
	1950 5800 2300 5800
Wire Wire Line
	1950 5900 2300 5900
Wire Wire Line
	1950 6000 2300 6000
Wire Wire Line
	1950 6100 2300 6100
Text Label 2000 5400 0    50   ~ 0
A2_A_P
Text Label 2000 5500 0    50   ~ 0
A2_A_N
Text Label 2000 5600 0    50   ~ 0
A2_B_P
Text Label 2000 5700 0    50   ~ 0
A2_B_N
Text Label 2000 5800 0    50   ~ 0
A2_C_P
Text Label 2000 5900 0    50   ~ 0
A2_C_N
Text Label 2000 6000 0    50   ~ 0
A2_D_P
Text Label 2000 6100 0    50   ~ 0
A2_D_N
$Comp
L device:R R55
U 1 1 5B021411
P 3750 5400
F 0 "R55" V 3800 5550 50  0000 C CNN
F 1 "34.8" V 3750 5400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 5400 50  0001 C CNN
F 3 "" H 3750 5400 50  0001 C CNN
	1    3750 5400
	0    1    1    0   
$EndComp
$Comp
L device:R R56
U 1 1 5B021417
P 3750 5500
F 0 "R56" V 3600 5650 50  0000 C CNN
F 1 "34.8" V 3750 5500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 5500 50  0001 C CNN
F 3 "" H 3750 5500 50  0001 C CNN
	1    3750 5500
	0    1    1    0   
$EndComp
$Comp
L device:R R57
U 1 1 5B02141D
P 3750 5600
F 0 "R57" V 3800 5750 50  0000 C CNN
F 1 "34.8" V 3750 5600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 5600 50  0001 C CNN
F 3 "" H 3750 5600 50  0001 C CNN
	1    3750 5600
	0    1    1    0   
$EndComp
$Comp
L device:R R58
U 1 1 5B021423
P 3750 5700
F 0 "R58" V 3600 5850 50  0000 C CNN
F 1 "34.8" V 3750 5700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 5700 50  0001 C CNN
F 3 "" H 3750 5700 50  0001 C CNN
	1    3750 5700
	0    1    1    0   
$EndComp
$Comp
L device:R R59
U 1 1 5B021429
P 3750 5800
F 0 "R59" V 3800 5950 50  0000 C CNN
F 1 "34.8" V 3750 5800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 5800 50  0001 C CNN
F 3 "" H 3750 5800 50  0001 C CNN
	1    3750 5800
	0    1    1    0   
$EndComp
$Comp
L device:R R60
U 1 1 5B02142F
P 3750 5900
F 0 "R60" V 3600 6050 50  0000 C CNN
F 1 "34.8" V 3750 5900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 5900 50  0001 C CNN
F 3 "" H 3750 5900 50  0001 C CNN
	1    3750 5900
	0    1    1    0   
$EndComp
$Comp
L device:R R61
U 1 1 5B021435
P 3750 6000
F 0 "R61" V 3800 6150 50  0000 C CNN
F 1 "34.8" V 3750 6000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 6000 50  0001 C CNN
F 3 "" H 3750 6000 50  0001 C CNN
	1    3750 6000
	0    1    1    0   
$EndComp
$Comp
L device:R R62
U 1 1 5B02143B
P 3750 6100
F 0 "R62" V 3600 6250 50  0000 C CNN
F 1 "34.8" V 3750 6100 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3680 6100 50  0001 C CNN
F 3 "" H 3750 6100 50  0001 C CNN
	1    3750 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 6100 4400 6100
Wire Wire Line
	4400 6000 3900 6000
Wire Wire Line
	3900 5900 4400 5900
Wire Wire Line
	4400 5800 3900 5800
Wire Wire Line
	3900 5700 4400 5700
Wire Wire Line
	4400 5600 3900 5600
Wire Wire Line
	3900 5400 4400 5400
Wire Wire Line
	4400 5500 3900 5500
Text Label 3950 5400 0    50   ~ 0
A2X_A_P
Text Label 3950 5500 0    50   ~ 0
A2X_A_N
Text Label 3950 5600 0    50   ~ 0
A2X_B_P
Text Label 3950 5700 0    50   ~ 0
A2X_B_N
Text Label 3950 5800 0    50   ~ 0
A2X_C_P
Text Label 3950 5900 0    50   ~ 0
A2X_C_N
Text Label 3950 6000 0    50   ~ 0
A2X_D_P
Text Label 3950 6100 0    50   ~ 0
A2X_D_N
$Comp
L device:R R43
U 1 1 5B021451
P 3050 6450
F 0 "R43" V 3100 6600 50  0000 C CNN
F 1 "36.5" V 3050 6450 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2980 6450 50  0001 C CNN
F 3 "" H 3050 6450 50  0001 C CNN
	1    3050 6450
	0    1    1    0   
$EndComp
$Comp
L device:R R44
U 1 1 5B021457
P 3050 6650
F 0 "R44" V 3100 6800 50  0000 C CNN
F 1 "36.5" V 3050 6650 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2980 6650 50  0001 C CNN
F 3 "" H 3050 6650 50  0001 C CNN
	1    3050 6650
	0    1    1    0   
$EndComp
$Comp
L device:R R45
U 1 1 5B02145D
P 3050 6850
F 0 "R45" V 3100 7000 50  0000 C CNN
F 1 "36.5" V 3050 6850 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2980 6850 50  0001 C CNN
F 3 "" H 3050 6850 50  0001 C CNN
	1    3050 6850
	0    1    1    0   
$EndComp
$Comp
L device:R R46
U 1 1 5B021463
P 3050 7050
F 0 "R46" V 3100 7200 50  0000 C CNN
F 1 "36.5" V 3050 7050 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2980 7050 50  0001 C CNN
F 3 "" H 3050 7050 50  0001 C CNN
	1    3050 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 5500 3600 5500
Wire Wire Line
	3600 5600 2600 5600
Wire Wire Line
	2600 5700 3600 5700
Wire Wire Line
	3600 5800 2600 5800
Wire Wire Line
	2600 5900 3600 5900
Wire Wire Line
	3600 6100 2600 6100
Wire Wire Line
	2600 6000 3600 6000
Wire Wire Line
	3600 5400 2600 5400
Text Label 2900 5400 0    50   ~ 0
A2Y_A_P
Text Label 2900 5500 0    50   ~ 0
A2Y_A_N
Text Label 2900 5600 0    50   ~ 0
A2Y_B_P
Text Label 2900 5700 0    50   ~ 0
A2Y_B_N
Text Label 2900 5800 0    50   ~ 0
A2Y_C_P
Text Label 2900 5900 0    50   ~ 0
A2Y_C_N
Text Label 2900 6000 0    50   ~ 0
A2Y_D_P
Text Label 2900 6100 0    50   ~ 0
A2Y_D_N
Text Label 2900 6450 2    50   ~ 0
A2Y_A_P
Text Label 2900 6650 2    50   ~ 0
A2Y_B_P
Text Label 2900 6850 2    50   ~ 0
A2Y_C_P
Text Label 2900 7050 2    50   ~ 0
A2Y_D_P
Text Label 3200 6450 0    50   ~ 0
A2Y_A_N
Text Label 3200 6650 0    50   ~ 0
A2Y_B_N
Text Label 3200 6850 0    50   ~ 0
A2Y_C_N
Text Label 3200 7050 0    50   ~ 0
A2Y_D_N
NoConn ~ 1950 4500
NoConn ~ 1950 6600
$EndSCHEMATC
