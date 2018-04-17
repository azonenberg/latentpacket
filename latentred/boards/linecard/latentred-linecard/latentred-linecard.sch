EESchema Schematic File Version 4
LIBS:latentred-linecard-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "LATENTRED 8-port 10/100/1000 Base-T Line Card"
Date "2018-04-17"
Rev "0.1"
Comp "Andrew D. Zonenberg"
Comment1 "Top Level"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 800  800  700  1600
U 5AD420D0
F0 "Power Supply" 50
F1 "psu.sch" 50
F2 "5V0" I R 1500 900 50 
F3 "GND" I R 1500 1400 50 
F4 "1V0_EN" I R 1500 1600 50 
F5 "1V8_EN" I R 1500 1700 50 
F6 "2V5_EN" I R 1500 1800 50 
F7 "PGOOD" O R 1500 2000 50 
F8 "I2C_SDA" B R 1500 2300 50 
F9 "I2C_SCL" I R 1500 2200 50 
F10 "3V3" O R 1500 1000 50 
F11 "1V0" O R 1500 1300 50 
F12 "2V5" O R 1500 1100 50 
F13 "1V8" O R 1500 1200 50 
$EndSheet
$Sheet
S 3000 800  1450 4150
U 5AD420DA
F0 "PHYs" 50
F1 "phys.sch" 50
F2 "MGMT_MDIO" B R 4450 900 50 
F3 "MGMT_MDC" I R 4450 1000 50 
F4 "GND" I L 3000 1400 50 
F5 "1V0" I L 3000 1300 50 
F6 "1V8" I L 3000 1200 50 
F7 "2V5" I L 3000 1100 50 
F8 "JTAG_TDI" I R 4450 1200 50 
F9 "JTAG_TDO" O R 4450 1300 50 
F10 "JTAG_TMS" I R 4450 1400 50 
F11 "JTAG_TCK" I R 4450 1500 50 
F12 "PHY_RST_N" I R 4450 1700 50 
F13 "SGMII0_TX_P" I R 4450 2650 50 
F14 "SGMII0_TX_N" I R 4450 2750 50 
F15 "SGMII1_TX_P" I R 4450 2950 50 
F16 "SGMII1_TX_N" I R 4450 3050 50 
F17 "SGMII2_TX_P" I R 4450 3250 50 
F18 "SGMII2_TX_N" I R 4450 3350 50 
F19 "SGMII3_TX_P" I R 4450 3550 50 
F20 "SGMII3_TX_N" I R 4450 3650 50 
F21 "SGMII4_TX_P" I R 4450 3850 50 
F22 "SGMII4_TX_N" I R 4450 3950 50 
F23 "SGMII5_TX_P" I R 4450 4150 50 
F24 "SGMII5_TX_N" I R 4450 4250 50 
F25 "SGMII6_TX_P" I R 4450 4450 50 
F26 "SGMII6_TX_N" I R 4450 4550 50 
F27 "SGMII7_TX_P" I R 4450 4750 50 
F28 "SGMII7_TX_N" I R 4450 4850 50 
F29 "SGMII0_RX_P" O L 3000 2650 50 
F30 "SGMII0_RX_N" O L 3000 2750 50 
F31 "SGMII1_RX_P" O L 3000 2950 50 
F32 "SGMII1_RX_N" O L 3000 3050 50 
F33 "SGMII2_RX_P" O L 3000 3250 50 
F34 "SGMII2_RX_N" O L 3000 3350 50 
F35 "SGMII3_RX_P" O L 3000 3550 50 
F36 "SGMII3_RX_N" O L 3000 3650 50 
F37 "SGMII4_RX_P" O L 3000 3850 50 
F38 "SGMII4_RX_N" O L 3000 3950 50 
F39 "SGMII5_RX_P" O L 3000 4150 50 
F40 "SGMII5_RX_N" O L 3000 4250 50 
F41 "SGMII6_RX_P" O L 3000 4450 50 
F42 "SGMII6_RX_N" O L 3000 4550 50 
F43 "SGMII7_RX_P" I L 3000 4750 50 
F44 "SGMII7_RX_N" I L 3000 4850 50 
$EndSheet
Text Notes 1500 5700 0    50   ~ 0
TODO: I2C pullups
$Comp
L special-azonenberg:CONN_LATENTRED_LINECARD_DEVICE J1
U 1 1 5AF659DD
P 5750 4950
F 0 "J1" H 6400 9265 50  0000 C CNN
F 1 "CONN_LATENTRED_LINECARD_DEVICE" H 6400 9174 50  0000 C CNN
F 2 "" H 5750 4750 50  0001 C CNN
F 3 "" H 5750 4750 50  0001 C CNN
	1    5750 4950
	1    0    0    -1  
$EndComp
Text Label 5550 1100 2    50   ~ 0
5V0
Wire Wire Line
	5550 1100 5650 1100
Text Label 5550 1200 2    50   ~ 0
5V0
Text Label 5550 1300 2    50   ~ 0
GND
Text Label 5550 1400 2    50   ~ 0
GND
Wire Wire Line
	5550 1400 5650 1400
Wire Wire Line
	5650 1300 5550 1300
Wire Wire Line
	5550 1200 5650 1200
Text Label 7250 1100 0    50   ~ 0
5V0
Wire Wire Line
	7150 1100 7250 1100
Text Label 7250 1200 0    50   ~ 0
5V0
Wire Wire Line
	7250 1200 7150 1200
Text Label 7250 1300 0    50   ~ 0
GND
Wire Wire Line
	7250 1300 7150 1300
Text Label 7250 1400 0    50   ~ 0
GND
Wire Wire Line
	7250 1400 7150 1400
Text Label 1600 2000 0    50   ~ 0
PSU_PGOOD
Wire Wire Line
	1600 2000 1500 2000
Text Label 1600 2200 0    50   ~ 0
I2C_SCL
Text Label 1600 2300 0    50   ~ 0
I2C_SDA
Wire Wire Line
	1600 2300 1500 2300
Wire Wire Line
	1600 2200 1500 2200
Text Label 1600 1400 0    50   ~ 0
GND
Text Label 1600 900  0    50   ~ 0
5V0
Wire Wire Line
	1600 900  1500 900 
Text Label 5550 900  2    50   ~ 0
GND
Wire Wire Line
	5550 900  5650 900 
Text Label 5550 1900 2    50   ~ 0
I2C_SDA
Text Label 5550 2000 2    50   ~ 0
I2C_SCL
Wire Wire Line
	5550 1900 5650 1900
Wire Wire Line
	5650 2000 5550 2000
Text Label 1600 1600 0    50   ~ 0
1V0_EN
Text Label 1600 1700 0    50   ~ 0
1V8_EN
Text Label 1600 1800 0    50   ~ 0
2V5_EN
Wire Wire Line
	1600 1800 1500 1800
Wire Wire Line
	1600 1700 1500 1700
Wire Wire Line
	1500 1600 1600 1600
Text Label 7250 1700 0    50   ~ 0
1V0_EN
Text Label 7250 1800 0    50   ~ 0
1V8_EN
Text Label 7250 1900 0    50   ~ 0
2V5_EN
Wire Wire Line
	7250 1900 7150 1900
Wire Wire Line
	7250 1800 7150 1800
Wire Wire Line
	7150 1700 7250 1700
Text Label 7250 1600 0    50   ~ 0
PSU_PGOOD
Wire Wire Line
	7250 1600 7150 1600
Text Label 1600 1000 0    50   ~ 0
3V3
Wire Wire Line
	1600 1000 1500 1000
Text Notes 1500 5800 0    50   ~ 0
TODO: pulldowns on *_EN inputs
Text Label 4550 900  0    50   ~ 0
MGMT_MDIO
Text Label 4550 1000 0    50   ~ 0
MGMT_MDC
Wire Wire Line
	4550 900  4450 900 
Wire Wire Line
	4450 1000 4550 1000
Text Label 5550 1600 2    50   ~ 0
MGMT_MDIO
Text Label 5550 1700 2    50   ~ 0
MGMT_MDC
Wire Wire Line
	5550 1700 5650 1700
Wire Wire Line
	5650 1600 5550 1600
Text Label 5550 2200 2    50   ~ 0
PHY_RST_N
Wire Wire Line
	5550 2200 5650 2200
Text Label 4550 1700 0    50   ~ 0
PHY_RST_N
Wire Wire Line
	4550 1700 4450 1700
Text Label 4550 1200 0    50   ~ 0
JTAG_TDI
Text Label 4550 1300 0    50   ~ 0
JTAG_TDO
Text Label 4550 1400 0    50   ~ 0
JTAG_TMS
Text Label 4550 1500 0    50   ~ 0
JTAG_TCK
Wire Wire Line
	4550 1500 4450 1500
Wire Wire Line
	4450 1400 4550 1400
Wire Wire Line
	4550 1300 4450 1300
Wire Wire Line
	4450 1200 4550 1200
Text Label 7250 2100 0    50   ~ 0
JTAG_TDI
Text Label 7250 2200 0    50   ~ 0
JTAG_TDO
Text Label 7250 2300 0    50   ~ 0
JTAG_TMS
Text Label 7250 2400 0    50   ~ 0
JTAG_TCK
Wire Wire Line
	7250 2400 7150 2400
Wire Wire Line
	7150 2300 7250 2300
Wire Wire Line
	7250 2200 7150 2200
Wire Wire Line
	7150 2100 7250 2100
Wire Wire Line
	1500 1100 3000 1100
Wire Wire Line
	1500 1200 3000 1200
Wire Wire Line
	1500 1300 3000 1300
Wire Wire Line
	1500 1400 3000 1400
Wire Wire Line
	4450 4850 5650 4850
Wire Wire Line
	5650 4750 4450 4750
Wire Wire Line
	4450 4550 5650 4550
Wire Wire Line
	4450 4450 5650 4450
Wire Wire Line
	5650 4250 4450 4250
Wire Wire Line
	4450 4150 5650 4150
Wire Wire Line
	5650 3950 4450 3950
Wire Wire Line
	5650 3850 4450 3850
Wire Wire Line
	5650 3650 4450 3650
Wire Wire Line
	4450 3550 5650 3550
Wire Wire Line
	5650 3350 4450 3350
Wire Wire Line
	4450 3250 5650 3250
Wire Wire Line
	5650 3050 4450 3050
Wire Wire Line
	4450 2950 5650 2950
Wire Wire Line
	5650 2750 4450 2750
Wire Wire Line
	4450 2650 5650 2650
Text Label 2750 2650 2    50   ~ 0
SGMII0_RX_P
Text Label 2750 2750 2    50   ~ 0
SGMII0_RX_N
Wire Wire Line
	2750 2750 3000 2750
Wire Wire Line
	3000 2650 2750 2650
Text Label 2750 2950 2    50   ~ 0
SGMII1_RX_P
Text Label 2750 3050 2    50   ~ 0
SGMII1_RX_N
Wire Wire Line
	2750 3050 3000 3050
Wire Wire Line
	3000 2950 2750 2950
Text Label 2750 3250 2    50   ~ 0
SGMII2_RX_P
Text Label 2750 3350 2    50   ~ 0
SGMII2_RX_N
Wire Wire Line
	2750 3350 3000 3350
Wire Wire Line
	3000 3250 2750 3250
Text Label 2750 3550 2    50   ~ 0
SGMII3_RX_P
Text Label 2750 3650 2    50   ~ 0
SGMII3_RX_N
Wire Wire Line
	2750 3650 3000 3650
Wire Wire Line
	3000 3550 2750 3550
Text Label 2750 3850 2    50   ~ 0
SGMII4_RX_P
Text Label 2750 3950 2    50   ~ 0
SGMII4_RX_N
Wire Wire Line
	2750 3950 3000 3950
Wire Wire Line
	3000 3850 2750 3850
Text Label 2750 4150 2    50   ~ 0
SGMII5_RX_P
Text Label 2750 4250 2    50   ~ 0
SGMII5_RX_N
Wire Wire Line
	2750 4250 3000 4250
Wire Wire Line
	3000 4150 2750 4150
Text Label 2750 4450 2    50   ~ 0
SGMII6_RX_P
Text Label 2750 4550 2    50   ~ 0
SGMII6_RX_N
Wire Wire Line
	2750 4550 3000 4550
Wire Wire Line
	3000 4450 2750 4450
Text Label 2750 4750 2    50   ~ 0
SGMII7_RX_P
Text Label 2750 4850 2    50   ~ 0
SGMII7_RX_N
Wire Wire Line
	2750 4850 3000 4850
Wire Wire Line
	3000 4750 2750 4750
Text Label 7250 2650 0    50   ~ 0
SGMII0_RX_P
Text Label 7250 2750 0    50   ~ 0
SGMII0_RX_N
Text Label 7250 2950 0    50   ~ 0
SGMII1_RX_P
Text Label 7250 3050 0    50   ~ 0
SGMII1_RX_N
Text Label 7250 3250 0    50   ~ 0
SGMII2_RX_P
Text Label 7250 3350 0    50   ~ 0
SGMII2_RX_N
Text Label 7250 3550 0    50   ~ 0
SGMII3_RX_P
Text Label 7250 3650 0    50   ~ 0
SGMII3_RX_N
Text Label 7250 3850 0    50   ~ 0
SGMII4_RX_P
Text Label 7250 3950 0    50   ~ 0
SGMII4_RX_N
Text Label 7250 4150 0    50   ~ 0
SGMII5_RX_P
Text Label 7250 4250 0    50   ~ 0
SGMII5_RX_N
Text Label 7250 4450 0    50   ~ 0
SGMII6_RX_P
Text Label 7250 4550 0    50   ~ 0
SGMII6_RX_N
Text Label 7250 4750 0    50   ~ 0
SGMII7_RX_P
Text Label 7250 4850 0    50   ~ 0
SGMII7_RX_N
Wire Wire Line
	7150 2650 7250 2650
Wire Wire Line
	7250 2750 7150 2750
Wire Wire Line
	7150 2950 7250 2950
Wire Wire Line
	7250 3050 7150 3050
Wire Wire Line
	7250 3250 7150 3250
Wire Wire Line
	7150 3350 7250 3350
Wire Wire Line
	7250 3550 7150 3550
Wire Wire Line
	7250 3650 7150 3650
Wire Wire Line
	7250 3850 7150 3850
Wire Wire Line
	7150 3950 7250 3950
Wire Wire Line
	7250 4150 7150 4150
Wire Wire Line
	7150 4250 7250 4250
Wire Wire Line
	7250 4450 7150 4450
Wire Wire Line
	7150 4550 7250 4550
Wire Wire Line
	7250 4750 7150 4750
Wire Wire Line
	7150 4850 7250 4850
$EndSCHEMATC
