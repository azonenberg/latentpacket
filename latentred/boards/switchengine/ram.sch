EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 5 6
Title "LATENTRED Switch Engine"
Date "2019-09-09"
Rev "0.1"
Comp "Antikernel Labs"
Comment1 "QDR-II+ SRAM"
Comment2 "Andrew D. Zonenberg"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L memory-azonenberg:QDRII+_SRAM_36BIT U?
U 1 1 5D78F9C5
P 4200 6300
F 0 "U?" H 4200 6200 60  0000 L CNN
F 1 "CY7C2245KV18-450BZKI" H 4200 6100 60  0000 L CNN
F 2 "" H 4200 6300 60  0000 C CNN
F 3 "" H 4200 6300 60  0000 C CNN
	1    4200 6300
	1    0    0    -1  
$EndComp
$Comp
L memory-azonenberg:QDRII+_SRAM_36BIT U?
U 2 1 5D794EA0
P 8850 6150
F 0 "U?" H 8850 6050 60  0000 L CNN
F 1 "CY7C2245KV18-450BZKI" H 8850 5950 60  0000 L CNN
F 2 "" H 8850 6150 60  0000 C CNN
F 3 "" H 8850 6150 60  0000 C CNN
	2    8850 6150
	1    0    0    -1  
$EndComp
$Comp
L memory-azonenberg:QDRII+_SRAM_36BIT U?
U 3 1 5D79766A
P 11400 6150
F 0 "U?" H 11400 6050 60  0000 L CNN
F 1 "CY7C2245KV18-450BZKI" H 11400 5950 60  0000 L CNN
F 2 "" H 11400 6150 60  0000 C CNN
F 3 "" H 11400 6150 60  0000 C CNN
	3    11400 6150
	1    0    0    -1  
$EndComp
$Comp
L memory-azonenberg:QDRII+_SRAM_36BIT U?
U 4 1 5D79BC70
P 14050 6150
F 0 "U?" H 14050 6050 60  0000 L CNN
F 1 "CY7C2245KV18-450BZKI" H 14050 5950 60  0000 L CNN
F 2 "" H 14050 6150 60  0000 C CNN
F 3 "" H 14050 6150 60  0000 C CNN
	4    14050 6150
	1    0    0    -1  
$EndComp
$Comp
L xilinx-azonenberg:XC7KxT-FBG484 U?
U 3 1 5D7AACCB
P 2450 7000
F 0 "U?" H 2450 6900 60  0000 L CNN
F 1 "XC7KxT-FBG484" H 2450 6800 60  0000 L CNN
F 2 "" H 2450 6700 60  0000 C CNN
F 3 "" H 2450 6700 60  0000 C CNN
	3    2450 7000
	-1   0    0    -1  
$EndComp
Text Label 2650 2200 0    50   ~ 0
QDR_D0
Text Label 2650 2300 0    50   ~ 0
QDR_D1
Text Label 2650 2400 0    50   ~ 0
QDR_D2
Text Label 2650 2500 0    50   ~ 0
QDR_D3
Text Label 2650 2800 0    50   ~ 0
QDR_D4
Text Label 2650 2900 0    50   ~ 0
QDR_D5
Text Label 2650 3000 0    50   ~ 0
QDR_D6
Text Label 2650 3100 0    50   ~ 0
QDR_D7
Text Label 2650 3200 0    50   ~ 0
QDR_D8
NoConn ~ 2650 2700
NoConn ~ 2650 2600
Text Label 7000 2300 2    50   ~ 0
QDR_WPS_N
Text Label 4000 2100 2    50   ~ 0
QDR_WPS_N
NoConn ~ 2650 2100
Text Label 2650 6000 0    50   ~ 0
QDR_CLK_P
Text Label 2650 6100 0    50   ~ 0
QDR_CLK_N
Text Label 4000 2800 2    50   ~ 0
QDR_D0
Text Label 4000 2900 2    50   ~ 0
QDR_D1
Text Label 4000 3000 2    50   ~ 0
QDR_D2
Text Label 4000 3100 2    50   ~ 0
QDR_D3
Text Label 4000 3200 2    50   ~ 0
QDR_D4
Text Label 4000 3300 2    50   ~ 0
QDR_D5
Text Label 4000 3400 2    50   ~ 0
QDR_D6
Text Label 4000 3500 2    50   ~ 0
QDR_D7
Text Label 4000 3600 2    50   ~ 0
QDR_D8
Text Label 4000 2300 2    50   ~ 0
QDR_BWS0_N
Text Label 4000 2400 2    50   ~ 0
QDR_BWS1_N
Text Label 4000 2500 2    50   ~ 0
QDR_BWS2_N
Text Label 4000 2600 2    50   ~ 0
QDR_BWS3_N
Text Label 7000 2400 2    50   ~ 0
QDR_BWS0_N
Text Label 7000 2500 2    50   ~ 0
QDR_BWS1_N
Text Label 7000 2600 2    50   ~ 0
QDR_BWS2_N
Text Label 7000 2700 2    50   ~ 0
QDR_BWS3_N
$EndSCHEMATC
