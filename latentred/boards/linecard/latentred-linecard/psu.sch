EESchema Schematic File Version 4
LIBS:latentred-linecard-cache
EELAYER 26 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 2 3
Title "LATENTRED 8-port 10/100/1000 Base-T Line Card"
Date "2018-06-05"
Rev "0.1"
Comp "Andrew D. Zonenberg"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power-azonenberg:LTC3374-QFN U2
U 1 1 5AD42248
P 6850 2850
F 0 "U2" H 7777 3158 60  0000 L CNN
F 1 "LTC3374-QFN" H 7777 3052 60  0000 L CNN
F 2 "azonenberg_pcb:QFN_38_0.5MM_5x7MM" H 6850 2850 60  0001 C CNN
F 3 "" H 6850 2850 60  0000 C CNN
	1    6850 2850
	1    0    0    -1  
$EndComp
$Comp
L power-azonenberg:LTC3374-QFN U2
U 2 1 5AD42CB2
P 6850 3450
F 0 "U2" H 7777 3758 60  0000 L CNN
F 1 "LTC3374-QFN" H 7777 3652 60  0000 L CNN
F 2 "azonenberg_pcb:QFN_38_0.5MM_5x7MM" H 6850 3450 60  0001 C CNN
F 3 "" H 6850 3450 60  0000 C CNN
	2    6850 3450
	1    0    0    -1  
$EndComp
$Comp
L power-azonenberg:LTC3374-QFN U2
U 3 1 5AD42D08
P 6850 4050
F 0 "U2" H 7777 4358 60  0000 L CNN
F 1 "LTC3374-QFN" H 7777 4252 60  0000 L CNN
F 2 "azonenberg_pcb:QFN_38_0.5MM_5x7MM" H 6850 4050 60  0001 C CNN
F 3 "" H 6850 4050 60  0000 C CNN
	3    6850 4050
	1    0    0    -1  
$EndComp
$Comp
L power-azonenberg:LTC3374-QFN U2
U 4 1 5AD42D7F
P 6850 5850
F 0 "U2" H 7777 6158 60  0000 L CNN
F 1 "LTC3374-QFN" H 7777 6052 60  0000 L CNN
F 2 "azonenberg_pcb:QFN_38_0.5MM_5x7MM" H 6850 5850 60  0001 C CNN
F 3 "" H 6850 5850 60  0000 C CNN
	4    6850 5850
	1    0    0    -1  
$EndComp
$Comp
L power-azonenberg:LTC3374-QFN U2
U 5 1 5AD42DF1
P 6850 4650
F 0 "U2" H 7777 4958 60  0000 L CNN
F 1 "LTC3374-QFN" H 7777 4852 60  0000 L CNN
F 2 "azonenberg_pcb:QFN_38_0.5MM_5x7MM" H 6850 4650 60  0001 C CNN
F 3 "" H 6850 4650 60  0000 C CNN
	5    6850 4650
	1    0    0    -1  
$EndComp
$Comp
L power-azonenberg:LTC3374-QFN U2
U 6 1 5AD42E61
P 6850 5250
F 0 "U2" H 7777 5558 60  0000 L CNN
F 1 "LTC3374-QFN" H 7777 5452 60  0000 L CNN
F 2 "azonenberg_pcb:QFN_38_0.5MM_5x7MM" H 6850 5250 60  0001 C CNN
F 3 "" H 6850 5250 60  0000 C CNN
	6    6850 5250
	1    0    0    -1  
$EndComp
$Comp
L power-azonenberg:LTC3374-QFN U2
U 7 1 5AD42ED1
P 6850 6450
F 0 "U2" H 7777 6758 60  0000 L CNN
F 1 "LTC3374-QFN" H 7777 6652 60  0000 L CNN
F 2 "azonenberg_pcb:QFN_38_0.5MM_5x7MM" H 6850 6450 60  0001 C CNN
F 3 "" H 6850 6450 60  0000 C CNN
	7    6850 6450
	1    0    0    -1  
$EndComp
$Comp
L power-azonenberg:LTC3374-QFN U2
U 8 1 5AD42F61
P 6850 7050
F 0 "U2" H 7777 7358 60  0000 L CNN
F 1 "LTC3374-QFN" H 7777 7252 60  0000 L CNN
F 2 "azonenberg_pcb:QFN_38_0.5MM_5x7MM" H 6850 7050 60  0001 C CNN
F 3 "" H 6850 7050 60  0000 C CNN
	8    6850 7050
	1    0    0    -1  
$EndComp
$Comp
L power-azonenberg:LTC3374-QFN U2
U 9 1 5AD42FF5
P 6850 2250
F 0 "U2" H 7300 2947 60  0000 C CNN
F 1 "LTC3374-QFN" H 7300 2841 60  0000 C CNN
F 2 "azonenberg_pcb:QFN_38_0.5MM_5x7MM" H 6850 2250 60  0001 C CNN
F 3 "" H 6850 2250 60  0000 C CNN
	9    6850 2250
	1    0    0    -1  
$EndComp
Text Notes 11000 1400 0    50   ~ 0
Required output power: \n* 1.0V @ 0.9A (3 channels)\n* 1.8V @ 0.7A (2 channels)\n* 2.5V @ 0.9A (3 channels)\n* 3.3V @ minimal (few mA) for INA226s\n\nExpect ~~90% SMPS efficiency
Text HLabel 6550 1800 0    50   Input ~ 0
5V0
Text HLabel 6550 2200 0    50   Input ~ 0
GND
Wire Wire Line
	6550 1800 6650 1800
Wire Wire Line
	6650 2200 6550 2200
Text HLabel 6550 2400 0    50   Input ~ 0
1V0_EN
Text HLabel 6550 6000 0    50   Input ~ 0
1V8_EN
Text HLabel 6550 4200 0    50   Input ~ 0
2V5_EN
Wire Wire Line
	6550 4200 6650 4200
Wire Wire Line
	6550 2400 6650 2400
Wire Wire Line
	6550 6000 6650 6000
$Comp
L passive-azonenberg:INDUCTOR_PWROUT L1
U 1 1 5AD4397D
P 5750 2700
F 0 "L1" V 5900 2900 40  0000 C CNN
F 1 "NR6028T2R2N" V 5850 2700 40  0000 C CNN
F 2 "azonenberg_pcb:INDUCTOR_YUDEN_NR6028" H 5750 2700 60  0001 C CNN
F 3 "" H 5750 2700 60  0000 C CNN
	1    5750 2700
	0    -1   -1   0   
$EndComp
Text Label 6550 2500 2    50   ~ 0
5V0
Wire Wire Line
	6550 2500 6650 2500
Text Label 6550 3100 2    50   ~ 0
5V0
Wire Wire Line
	6550 3100 6650 3100
Text Label 6550 3700 2    50   ~ 0
5V0
Wire Wire Line
	6550 3700 6650 3700
Text Label 6550 4300 2    50   ~ 0
5V0
Wire Wire Line
	6550 4300 6650 4300
Text Label 6550 4900 2    50   ~ 0
5V0
Wire Wire Line
	6550 4900 6650 4900
Text Label 6550 6100 2    50   ~ 0
5V0
Wire Wire Line
	6550 6100 6650 6100
Text Label 6550 6700 2    50   ~ 0
5V0
Wire Wire Line
	6550 6700 6650 6700
Text HLabel 9700 1900 2    50   Output ~ 0
PGOOD
Text Label 8200 2000 0    50   ~ 0
GND
Wire Wire Line
	8200 2000 7950 2000
$Comp
L analog-azonenberg:LTC2451 U4
U 1 1 5AD45797
P 12100 9600
F 0 "U4" H 12500 10497 60  0000 C CNN
F 1 "LTC2451" H 12500 10391 60  0000 C CNN
F 2 "azonenberg_pcb:DFN_8_0.5MM_2x3MM" H 12100 9600 60  0001 C CNN
F 3 "" H 12100 9600 60  0001 C CNN
	1    12100 9600
	1    0    0    -1  
$EndComp
Text Label 8200 2100 0    50   ~ 0
5V0
Wire Wire Line
	8200 2100 7950 2100
Text Label 8200 1800 0    50   ~ 0
5V0
Wire Wire Line
	8200 1800 7950 1800
Text Notes 8600 1800 0    50   ~ 0
forced continuous PWM
Text Notes 8600 2100 0    50   ~ 0
internal 2 MHz osc
Text Notes 8600 2000 0    50   ~ 0
not syncing
Text Label 8200 2200 0    50   ~ 0
SMPS_TEMP
Wire Wire Line
	8200 2200 7950 2200
Text HLabel 13350 8950 2    50   BiDi ~ 0
I2C_SDA
Wire Wire Line
	13350 8950 13100 8950
Text HLabel 13350 9050 2    50   Input ~ 0
I2C_SCL
Wire Wire Line
	13350 9050 13100 9050
Text Label 13350 9250 0    50   ~ 0
SMPS_TEMP
Wire Wire Line
	13350 9250 13100 9250
Wire Wire Line
	7950 1900 9600 1900
$Comp
L device:R R13
U 1 1 5AD47307
P 9600 1750
F 0 "R13" H 9670 1796 50  0000 L CNN
F 1 "4.7k" H 9670 1705 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 9530 1750 50  0001 C CNN
F 3 "" H 9600 1750 50  0001 C CNN
	1    9600 1750
	1    0    0    -1  
$EndComp
Connection ~ 9600 1900
Wire Wire Line
	9600 1900 9700 1900
Text Label 9700 1600 0    50   ~ 0
3V3
Wire Wire Line
	9700 1600 9600 1600
Text Label 11750 8950 2    50   ~ 0
3V3
Wire Wire Line
	11750 8950 11900 8950
Text Label 11750 9050 2    50   ~ 0
GND
Wire Wire Line
	11750 9050 11800 9050
Wire Wire Line
	11800 9050 11800 9150
Wire Wire Line
	11800 9150 11900 9150
Connection ~ 11800 9050
Wire Wire Line
	11800 9050 11900 9050
Wire Wire Line
	11800 9150 11800 9250
Wire Wire Line
	11800 9250 11900 9250
Connection ~ 11800 9150
Text Notes 12100 9800 0    50   ~ 0
ADC for monitoring SMPS die temperature\nAddress = 8'h28
$Comp
L passive-azonenberg:INDUCTOR_PWROUT L2
U 1 1 5AD494EC
P 5750 4500
F 0 "L2" V 5950 4600 40  0000 C CNN
F 1 "NR6028T2R2N" V 5850 4500 40  0000 C CNN
F 2 "azonenberg_pcb:INDUCTOR_YUDEN_NR6028" H 5750 4500 60  0001 C CNN
F 3 "" H 5750 4500 60  0000 C CNN
	1    5750 4500
	0    -1   -1   0   
$EndComp
$Comp
L passive-azonenberg:INDUCTOR_PWROUT L3
U 1 1 5AD49C68
P 5750 6300
F 0 "L3" V 5950 6450 40  0000 C CNN
F 1 "NR6028T2R2N" V 5850 6300 40  0000 C CNN
F 2 "azonenberg_pcb:INDUCTOR_YUDEN_NR6028" H 5750 6300 60  0001 C CNN
F 3 "" H 5750 6300 60  0000 C CNN
	1    5750 6300
	0    -1   -1   0   
$EndComp
$Comp
L power-azonenberg:MCP1703T-xx U1
U 1 1 5AD4A704
P 1150 10750
F 0 "U1" H 1475 11347 60  0000 C CNN
F 1 "MCP1703T-3302E" H 1475 11241 60  0000 C CNN
F 2 "azonenberg_pcb:DFN_8_0.5MM_3x3MM" H 1150 10750 60  0001 C CNN
F 3 "" H 1150 10750 60  0000 C CNN
	1    1150 10750
	1    0    0    -1  
$EndComp
Text Notes 1150 10950 0    50   ~ 0
LDO for 3.3V analog rail\n(just used by sensors)
Text Label 850  10400 2    50   ~ 0
5V0
Wire Wire Line
	850  10400 950  10400
Text Label 850  10600 2    50   ~ 0
GND
Wire Wire Line
	850  10600 950  10600
Wire Wire Line
	850  10600 850  10700
Wire Wire Line
	850  10700 950  10700
Text HLabel 2450 10400 2    50   Output ~ 0
3V3
Wire Wire Line
	2450 10400 2000 10400
Text Notes 14000 1800 0    50   ~ 0
ADC decoupling
$Comp
L device:C C5
U 1 1 5AD51DAD
P 14000 1550
F 0 "C5" H 14115 1596 50  0000 L CNN
F 1 "0.47 uF" H 14115 1505 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 14038 1400 50  0001 C CNN
F 3 "" H 14000 1550 50  0001 C CNN
	1    14000 1550
	1    0    0    -1  
$EndComp
Text Label 13800 1400 2    50   ~ 0
3V3
Text Label 13800 1700 2    50   ~ 0
GND
Wire Wire Line
	13800 1700 14000 1700
Wire Wire Line
	13800 1400 14000 1400
Text HLabel 3700 2700 0    50   Output ~ 0
1V0
Text HLabel 3700 4500 0    50   Output ~ 0
2V5
Text HLabel 3700 6300 0    50   Output ~ 0
1V8
$Comp
L special-azonenberg:SI705x U3
U 1 1 5AD5972E
P 12100 8400
F 0 "U3" H 12350 8797 60  0000 C CNN
F 1 "SI7050" H 12350 8691 60  0000 C CNN
F 2 "azonenberg_pcb:DFN_6_1MM_3x3MM" H 12250 8300 60  0001 C CNN
F 3 "" H 12250 8300 60  0001 C CNN
	1    12100 8400
	1    0    0    -1  
$EndComp
Text Notes 12100 8600 0    50   ~ 0
Temperature sensor\nAddress = 8'h80
Text Label 12900 8250 0    50   ~ 0
I2C_SDA
Text Label 12900 8350 0    50   ~ 0
I2C_SCL
Wire Wire Line
	12900 8250 12800 8250
Wire Wire Line
	12900 8350 12800 8350
Text Label 11800 8250 2    50   ~ 0
3V3
Text Label 11800 8350 2    50   ~ 0
GND
Wire Wire Line
	11800 8350 11900 8350
Wire Wire Line
	11800 8250 11900 8250
$Comp
L device:C C6
U 1 1 5AD60BCB
P 14000 2100
F 0 "C6" H 14115 2146 50  0000 L CNN
F 1 "0.47 uF" H 14115 2055 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 14038 1950 50  0001 C CNN
F 3 "" H 14000 2100 50  0001 C CNN
	1    14000 2100
	1    0    0    -1  
$EndComp
Text Notes 14000 2350 0    50   ~ 0
Thermometer decoupling
Text Label 13800 1950 2    50   ~ 0
3V3
Text Label 13800 2250 2    50   ~ 0
GND
Wire Wire Line
	13800 2250 14000 2250
Wire Wire Line
	13800 1950 14000 1950
$Comp
L special-azonenberg:INA226 U7
U 1 1 5AD67F9C
P 12600 7300
F 0 "U7" H 12575 7787 60  0000 C CNN
F 1 "INA226" H 12575 7681 60  0000 C CNN
F 2 "azonenberg_pcb:SOP_10_0.5MM_3MM" H 12600 7300 60  0001 C CNN
F 3 "" H 12600 7300 60  0000 C CNN
	1    12600 7300
	1    0    0    -1  
$EndComp
Text Label 13500 7500 0    50   ~ 0
3V3
Wire Wire Line
	13500 7500 13350 7500
NoConn ~ 11800 7300
Text Label 11650 7400 2    50   ~ 0
I2C_SDA
Wire Wire Line
	11650 7400 11800 7400
Text Label 11650 7500 2    50   ~ 0
I2C_SCL
Wire Wire Line
	11650 7500 11800 7500
$Comp
L passive-azonenberg:R-4TERM R7
U 1 1 5AD6C8DE
P 5000 2650
F 0 "R7" V 4900 2750 50  0000 C CNN
F 1 "10m" V 5000 2650 50  0000 C CNN
F 2 "azonenberg_pcb:OHMITE_LVK12" H 5000 2650 60  0001 C CNN
F 3 "" H 5000 2650 60  0000 C CNN
	1    5000 2650
	0    -1   1    0   
$EndComp
Wire Wire Line
	5300 2700 5350 2700
$Comp
L passive-azonenberg:R-4TERM R8
U 1 1 5AD7274B
P 5000 4450
F 0 "R8" V 4900 4550 50  0000 C CNN
F 1 "10m" V 5000 4450 50  0000 C CNN
F 2 "azonenberg_pcb:OHMITE_LVK12" H 5000 4450 60  0001 C CNN
F 3 "" H 5000 4450 60  0000 C CNN
	1    5000 4450
	0    -1   1    0   
$EndComp
Wire Wire Line
	5300 4500 5350 4500
$Comp
L passive-azonenberg:R-4TERM R9
U 1 1 5AD754E8
P 5000 6250
F 0 "R9" V 4900 6350 50  0000 C CNN
F 1 "10m" V 5000 6250 50  0000 C CNN
F 2 "azonenberg_pcb:OHMITE_LVK12" H 5000 6250 60  0001 C CNN
F 3 "" H 5000 6250 60  0000 C CNN
	1    5000 6250
	0    -1   1    0   
$EndComp
Wire Wire Line
	5300 6300 5350 6300
Text Label 14700 7200 0    50   ~ 0
1V0_SHUNT_LO
Text Label 14700 7100 0    50   ~ 0
1V0_SHUNT_HI
Text Label 13500 7300 0    50   ~ 0
1V0
Wire Wire Line
	13350 7300 13500 7300
Text Label 13500 7400 0    50   ~ 0
GND
Wire Wire Line
	13500 7400 13350 7400
Text Notes 12100 7750 0    50   ~ 0
ADC for monitoring 1V0 voltage/current\nAddress = 8'h81
$Comp
L device:C C3
U 1 1 5AD86AE5
P 13850 7150
F 0 "C3" H 13965 7196 50  0000 L CNN
F 1 "0.47 uF" H 13965 7105 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 13888 7000 50  0001 C CNN
F 3 "" H 13850 7150 50  0001 C CNN
	1    13850 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	13650 7100 13650 7000
Wire Wire Line
	13650 7000 13850 7000
Wire Wire Line
	13350 7100 13650 7100
Wire Wire Line
	13650 7200 13650 7300
Wire Wire Line
	13650 7300 13850 7300
Wire Wire Line
	13350 7200 13650 7200
Text Label 11650 7100 2    50   ~ 0
GND
Text Label 11650 7200 2    50   ~ 0
3V3
Wire Wire Line
	11650 7200 11800 7200
Wire Wire Line
	11800 7100 11650 7100
$Comp
L special-azonenberg:INA226 U6
U 1 1 5AD9534E
P 12600 6200
F 0 "U6" H 12575 6687 60  0000 C CNN
F 1 "INA226" H 12575 6581 60  0000 C CNN
F 2 "azonenberg_pcb:SOP_10_0.5MM_3MM" H 12600 6200 60  0001 C CNN
F 3 "" H 12600 6200 60  0000 C CNN
	1    12600 6200
	1    0    0    -1  
$EndComp
Text Label 13500 6400 0    50   ~ 0
3V3
Wire Wire Line
	13500 6400 13350 6400
NoConn ~ 11800 6200
Text Label 11650 6300 2    50   ~ 0
I2C_SDA
Wire Wire Line
	11650 6300 11800 6300
Text Label 11650 6400 2    50   ~ 0
I2C_SCL
Wire Wire Line
	11650 6400 11800 6400
Text Label 14700 6100 0    50   ~ 0
1V8_SHUNT_LO
Text Label 14700 6000 0    50   ~ 0
1V8_SHUNT_HI
Text Label 13500 6200 0    50   ~ 0
1V8
Wire Wire Line
	13350 6200 13500 6200
Text Label 13500 6300 0    50   ~ 0
GND
Wire Wire Line
	13500 6300 13350 6300
Text Notes 12100 6650 0    50   ~ 0
ADC for monitoring 1V8 voltage/current\nAddress = 8'h82
$Comp
L device:C C2
U 1 1 5AD9536E
P 13850 6050
F 0 "C2" H 13965 6096 50  0000 L CNN
F 1 "0.47 uF" H 13965 6005 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 13888 5900 50  0001 C CNN
F 3 "" H 13850 6050 50  0001 C CNN
	1    13850 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	13650 6000 13650 5900
Wire Wire Line
	13650 5900 13850 5900
Wire Wire Line
	13350 6000 13650 6000
Wire Wire Line
	13650 6100 13650 6200
Wire Wire Line
	13650 6200 13850 6200
Wire Wire Line
	13350 6100 13650 6100
Wire Wire Line
	11650 6100 11800 6100
Wire Wire Line
	11800 6000 11650 6000
Text Label 11650 6000 2    50   ~ 0
GND
Text Label 11650 6100 2    50   ~ 0
I2C_SDA
$Comp
L special-azonenberg:INA226 U5
U 1 1 5AD98CA9
P 12600 5100
F 0 "U5" H 12575 5587 60  0000 C CNN
F 1 "INA226" H 12575 5481 60  0000 C CNN
F 2 "azonenberg_pcb:SOP_10_0.5MM_3MM" H 12600 5100 60  0001 C CNN
F 3 "" H 12600 5100 60  0000 C CNN
	1    12600 5100
	1    0    0    -1  
$EndComp
Text Label 13500 5300 0    50   ~ 0
3V3
Wire Wire Line
	13500 5300 13350 5300
NoConn ~ 11800 5100
Text Label 11650 5200 2    50   ~ 0
I2C_SDA
Wire Wire Line
	11650 5200 11800 5200
Text Label 11650 5300 2    50   ~ 0
I2C_SCL
Wire Wire Line
	11650 5300 11800 5300
Text Label 14700 5000 0    50   ~ 0
2V5_SHUNT_LO
Text Label 14700 4900 0    50   ~ 0
2V5_SHUNT_HI
Text Label 13500 5100 0    50   ~ 0
2V5
Wire Wire Line
	13350 5100 13500 5100
Text Label 13500 5200 0    50   ~ 0
GND
Wire Wire Line
	13500 5200 13350 5200
Text Notes 12100 5550 0    50   ~ 0
ADC for monitoring 2V5 voltage/current\nAddress = 8'h83
$Comp
L device:R R14
U 1 1 5AD98CBD
P 14550 4900
F 0 "R14" V 14450 4900 50  0000 C CNN
F 1 "2" V 14550 4900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 14480 4900 50  0001 C CNN
F 3 "" H 14550 4900 50  0001 C CNN
	1    14550 4900
	0    1    1    0   
$EndComp
$Comp
L device:R R15
U 1 1 5AD98CC3
P 14550 5000
F 0 "R15" V 14650 5000 50  0000 C CNN
F 1 "2" V 14550 5000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 14480 5000 50  0001 C CNN
F 3 "" H 14550 5000 50  0001 C CNN
	1    14550 5000
	0    1    1    0   
$EndComp
$Comp
L device:C C1
U 1 1 5AD98CC9
P 13850 4950
F 0 "C1" H 13965 4996 50  0000 L CNN
F 1 "0.47 uF" H 13965 4905 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 13888 4800 50  0001 C CNN
F 3 "" H 13850 4950 50  0001 C CNN
	1    13850 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	13650 4900 13650 4800
Wire Wire Line
	13650 4800 13850 4800
Wire Wire Line
	13350 4900 13650 4900
Wire Wire Line
	13650 5000 13650 5100
Wire Wire Line
	13650 5100 13850 5100
Wire Wire Line
	13350 5000 13650 5000
Wire Wire Line
	14350 4800 14350 4900
Wire Wire Line
	14350 4900 14400 4900
Wire Wire Line
	14350 5100 14350 5000
Wire Wire Line
	14350 5000 14400 5000
Wire Wire Line
	11650 5000 11800 5000
Wire Wire Line
	11800 4900 11650 4900
Text Label 11650 4900 2    50   ~ 0
GND
Text Label 11650 5000 2    50   ~ 0
I2C_SCL
Text Label 11750 9450 2    50   ~ 0
3V3
Wire Wire Line
	11750 9450 11900 9450
Text Label 11750 9550 2    50   ~ 0
GND
Wire Wire Line
	11750 9550 11900 9550
Text Label 5300 4300 2    50   ~ 0
2V5_SHUNT_HI
Wire Wire Line
	5300 4300 5300 4400
Text Label 5300 6100 2    50   ~ 0
1V8_SHUNT_HI
Wire Wire Line
	5300 6100 5300 6200
Text Label 5300 2500 2    50   ~ 0
1V0_SHUNT_HI
Wire Wire Line
	5300 2500 5300 2600
Text Label 4700 2600 2    50   ~ 0
1V0_SHUNT_LO
Text Label 4700 4400 2    50   ~ 0
2V5_SHUNT_LO
Text Label 4700 6200 2    50   ~ 0
1V8_SHUNT_LO
$Comp
L device:C C9
U 1 1 5ADC207B
P 14550 1550
F 0 "C9" H 14665 1596 50  0000 L CNN
F 1 "4.7 uF" H 14665 1505 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0603_CAP_NOSILK" H 14588 1400 50  0001 C CNN
F 3 "" H 14550 1550 50  0001 C CNN
	1    14550 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 1400 14000 1400
Connection ~ 14000 1400
Wire Wire Line
	14000 1700 14550 1700
Connection ~ 14000 1700
$Comp
L device:C C7
U 1 1 5ADD695B
P 14000 2650
F 0 "C7" H 14115 2696 50  0000 L CNN
F 1 "0.47 uF" H 14115 2605 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 14038 2500 50  0001 C CNN
F 3 "" H 14000 2650 50  0001 C CNN
	1    14000 2650
	1    0    0    -1  
$EndComp
Text Notes 14000 2900 0    50   ~ 0
INA226 decoupling
Text Label 13800 2500 2    50   ~ 0
3V3
Text Label 13800 2800 2    50   ~ 0
GND
Wire Wire Line
	13800 2800 14000 2800
Wire Wire Line
	13800 2500 14000 2500
$Comp
L device:C C10
U 1 1 5ADDBD91
P 14550 2650
F 0 "C10" H 14665 2696 50  0000 L CNN
F 1 "0.47 uF" H 14665 2605 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 14588 2500 50  0001 C CNN
F 3 "" H 14550 2650 50  0001 C CNN
	1    14550 2650
	1    0    0    -1  
$EndComp
$Comp
L device:C C11
U 1 1 5ADDBE03
P 15100 2650
F 0 "C11" H 15215 2696 50  0000 L CNN
F 1 "0.47 uF" H 15215 2605 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 15138 2500 50  0001 C CNN
F 3 "" H 15100 2650 50  0001 C CNN
	1    15100 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	15100 2500 14550 2500
Wire Wire Line
	14550 2500 14000 2500
Connection ~ 14550 2500
Connection ~ 14000 2500
Wire Wire Line
	14000 2800 14550 2800
Connection ~ 14000 2800
Wire Wire Line
	14550 2800 15100 2800
Connection ~ 14550 2800
Text Notes 12100 4500 0    50   ~ 0
81.92 mV max scale\n1V0/2V5: 10 mR * 3A = 30 mV worst case, 1A/10 mV typ\n1V8: 10 mR * 2A = 20 mV worst case, 1A/10 mV typ
Wire Wire Line
	13850 4800 14350 4800
Connection ~ 13850 4800
Wire Wire Line
	13850 5100 14350 5100
Connection ~ 13850 5100
$Comp
L device:R R16
U 1 1 5AE0C19A
P 14550 6000
F 0 "R16" V 14450 6000 50  0000 C CNN
F 1 "2" V 14550 6000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 14480 6000 50  0001 C CNN
F 3 "" H 14550 6000 50  0001 C CNN
	1    14550 6000
	0    1    1    0   
$EndComp
$Comp
L device:R R17
U 1 1 5AE0C1A0
P 14550 6100
F 0 "R17" V 14650 6100 50  0000 C CNN
F 1 "2" V 14550 6100 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 14480 6100 50  0001 C CNN
F 3 "" H 14550 6100 50  0001 C CNN
	1    14550 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	14350 5900 14350 6000
Wire Wire Line
	14350 6000 14400 6000
Wire Wire Line
	14350 6200 14350 6100
Wire Wire Line
	14350 6100 14400 6100
Wire Wire Line
	13850 5900 14350 5900
Wire Wire Line
	13850 6200 14350 6200
Connection ~ 13850 5900
Connection ~ 13850 6200
$Comp
L device:R R18
U 1 1 5AE1134E
P 14550 7100
F 0 "R18" V 14450 7100 50  0000 C CNN
F 1 "2" V 14550 7100 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 14480 7100 50  0001 C CNN
F 3 "" H 14550 7100 50  0001 C CNN
	1    14550 7100
	0    1    1    0   
$EndComp
$Comp
L device:R R19
U 1 1 5AE11354
P 14550 7200
F 0 "R19" V 14650 7200 50  0000 C CNN
F 1 "2" V 14550 7200 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 14480 7200 50  0001 C CNN
F 3 "" H 14550 7200 50  0001 C CNN
	1    14550 7200
	0    1    1    0   
$EndComp
Wire Wire Line
	14350 7000 14350 7100
Wire Wire Line
	14350 7100 14400 7100
Wire Wire Line
	14350 7300 14350 7200
Wire Wire Line
	14350 7200 14400 7200
Wire Wire Line
	13850 7000 14350 7000
Wire Wire Line
	13850 7300 14350 7300
Connection ~ 13850 7000
Connection ~ 13850 7300
Text Label 6550 3400 2    50   ~ 0
5V0
Text Label 6550 4000 2    50   ~ 0
5V0
Wire Wire Line
	6050 2700 6650 2700
Text Label 6550 2700 2    50   ~ 0
1V0_SW
Text Label 6550 3300 2    50   ~ 0
1V0_SW
Wire Wire Line
	6550 3300 6650 3300
Wire Wire Line
	6550 3400 6650 3400
Text Label 6550 3000 2    50   ~ 0
GND
Wire Wire Line
	6550 3000 6650 3000
Text Label 6550 3600 2    50   ~ 0
GND
Wire Wire Line
	6550 3600 6650 3600
Text Label 6550 4800 2    50   ~ 0
GND
Wire Wire Line
	6550 4800 6650 4800
Text Label 6550 5400 2    50   ~ 0
GND
Wire Wire Line
	6550 5400 6650 5400
Text Label 6550 6600 2    50   ~ 0
GND
Wire Wire Line
	6550 6600 6650 6600
Wire Wire Line
	6550 4000 6650 4000
Text Label 6550 5200 2    50   ~ 0
5V0
Wire Wire Line
	6550 5200 6650 5200
Text Label 6550 7000 2    50   ~ 0
5V0
Wire Wire Line
	6550 7000 6650 7000
Wire Wire Line
	6050 4500 6650 4500
Text Label 6550 4500 2    50   ~ 0
2V5_SW
Text Label 6550 5100 2    50   ~ 0
2V5_SW
Wire Wire Line
	6550 5100 6650 5100
Text Label 6550 3900 2    50   ~ 0
1V0_SW
Wire Wire Line
	6550 3900 6650 3900
Wire Wire Line
	6050 6300 6650 6300
Text Label 6550 6300 2    50   ~ 0
1V8_SW
Text Label 6550 6900 2    50   ~ 0
1V8_SW
Wire Wire Line
	6550 6900 6650 6900
$Comp
L device:R R4
U 1 1 5AEA60D8
P 4850 2950
F 0 "R4" V 4750 2950 50  0000 C CNN
F 1 "255k" V 4850 2950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4780 2950 50  0001 C CNN
F 3 "" H 4850 2950 50  0001 C CNN
	1    4850 2950
	0    1    1    0   
$EndComp
$Comp
L device:R R10
U 1 1 5AEA6491
P 5250 2950
F 0 "R10" V 5150 2950 50  0000 C CNN
F 1 "1.02M" V 5250 2950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 5180 2950 50  0001 C CNN
F 3 "" H 5250 2950 50  0001 C CNN
	1    5250 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 2950 5050 2950
Wire Wire Line
	5050 2950 5050 2800
Wire Wire Line
	5050 2800 6650 2800
Connection ~ 5050 2950
Wire Wire Line
	5050 2950 5100 2950
Text Label 6550 2800 2    50   ~ 0
1V0_FB
Text Label 5500 2950 0    50   ~ 0
GND
Wire Wire Line
	5500 2950 5400 2950
$Comp
L device:R R1
U 1 1 5AEC7E98
P 3950 2950
F 0 "R1" V 3900 2800 50  0000 C CNN
F 1 "0" V 3950 2950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3880 2950 50  0001 C CNN
F 3 "" H 3950 2950 50  0001 C CNN
	1    3950 2950
	0    1    1    0   
$EndComp
Text Label 4150 2950 0    50   ~ 0
1V0_SENSE
Wire Wire Line
	4100 2950 4700 2950
Wire Wire Line
	3700 2700 3750 2700
Wire Wire Line
	3750 2700 3750 2950
Wire Wire Line
	3750 2950 3800 2950
Connection ~ 3750 2700
Wire Wire Line
	3750 2700 4700 2700
$Comp
L device:R R5
U 1 1 5AF0E384
P 4850 4750
F 0 "R5" V 4750 4750 50  0000 C CNN
F 1 "1.02M" V 4850 4750 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4780 4750 50  0001 C CNN
F 3 "" H 4850 4750 50  0001 C CNN
	1    4850 4750
	0    1    1    0   
$EndComp
$Comp
L device:R R11
U 1 1 5AF0E38A
P 5250 4750
F 0 "R11" V 5150 4750 50  0000 C CNN
F 1 "475k" V 5250 4750 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 5180 4750 50  0001 C CNN
F 3 "" H 5250 4750 50  0001 C CNN
	1    5250 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 4750 5050 4750
Wire Wire Line
	5050 4750 5050 4600
Wire Wire Line
	5050 4600 6650 4600
Connection ~ 5050 4750
Wire Wire Line
	5050 4750 5100 4750
Text Label 5500 4750 0    50   ~ 0
GND
Wire Wire Line
	5500 4750 5400 4750
$Comp
L device:R R2
U 1 1 5AF0E397
P 3950 4750
F 0 "R2" V 3900 4600 50  0000 C CNN
F 1 "0" V 3950 4750 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3880 4750 50  0001 C CNN
F 3 "" H 3950 4750 50  0001 C CNN
	1    3950 4750
	0    1    1    0   
$EndComp
Text Label 4150 4750 0    50   ~ 0
2V5_SENSE
Wire Wire Line
	4100 4750 4700 4750
Wire Wire Line
	3750 4500 3750 4750
Wire Wire Line
	3750 4750 3800 4750
$Comp
L device:R R6
U 1 1 5AF18A9E
P 4850 6550
F 0 "R6" V 4750 6550 50  0000 C CNN
F 1 "806k" V 4850 6550 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4780 6550 50  0001 C CNN
F 3 "" H 4850 6550 50  0001 C CNN
	1    4850 6550
	0    1    1    0   
$EndComp
$Comp
L device:R R12
U 1 1 5AF18AA4
P 5250 6550
F 0 "R12" V 5150 6550 50  0000 C CNN
F 1 "649k" V 5250 6550 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 5180 6550 50  0001 C CNN
F 3 "" H 5250 6550 50  0001 C CNN
	1    5250 6550
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 6550 5050 6550
Wire Wire Line
	5050 6550 5050 6400
Wire Wire Line
	5050 6400 6650 6400
Connection ~ 5050 6550
Wire Wire Line
	5050 6550 5100 6550
Wire Wire Line
	5500 6550 5400 6550
$Comp
L device:R R3
U 1 1 5AF18AB0
P 3950 6550
F 0 "R3" V 3900 6400 50  0000 C CNN
F 1 "0" V 3950 6550 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3880 6550 50  0001 C CNN
F 3 "" H 3950 6550 50  0001 C CNN
	1    3950 6550
	0    1    1    0   
$EndComp
Text Label 4150 6550 0    50   ~ 0
1V8_SENSE
Wire Wire Line
	4100 6550 4700 6550
Wire Wire Line
	3750 6300 3750 6550
Wire Wire Line
	3750 6550 3800 6550
Text Label 5500 6550 0    50   ~ 0
GND
Wire Wire Line
	3700 4500 3750 4500
Wire Wire Line
	3750 4500 4700 4500
Connection ~ 3750 4500
Wire Wire Line
	3700 6300 3750 6300
Wire Wire Line
	3750 6300 4700 6300
Connection ~ 3750 6300
$Comp
L device:C C33
U 1 1 5B0C811E
P 1450 800
F 0 "C33" H 1565 846 50  0000 L CNN
F 1 "47 uF" H 1565 755 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_1210_CAP_NOSILK" H 1488 650 50  0001 C CNN
F 3 "" H 1450 800 50  0001 C CNN
	1    1450 800 
	1    0    0    -1  
$EndComp
Text Label 1200 650  2    50   ~ 0
5V0
Text Label 1200 950  2    50   ~ 0
GND
$Comp
L device:C C36
U 1 1 5B0C8758
P 1950 800
F 0 "C36" H 2065 846 50  0000 L CNN
F 1 "47 uF" H 2065 755 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_1210_CAP_NOSILK" H 1988 650 50  0001 C CNN
F 3 "" H 1950 800 50  0001 C CNN
	1    1950 800 
	1    0    0    -1  
$EndComp
$Comp
L device:C C38
U 1 1 5B0C87E0
P 2450 800
F 0 "C38" H 2565 846 50  0000 L CNN
F 1 "47 uF" H 2565 755 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_1210_CAP_NOSILK" H 2488 650 50  0001 C CNN
F 3 "" H 2450 800 50  0001 C CNN
	1    2450 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 650  1450 650 
Wire Wire Line
	1450 650  1950 650 
Connection ~ 1450 650 
$Comp
L device:C C41
U 1 1 5B0E130E
P 2950 800
F 0 "C41" H 3065 846 50  0000 L CNN
F 1 "0.47 uF" H 3065 755 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 2988 650 50  0001 C CNN
F 3 "" H 2950 800 50  0001 C CNN
	1    2950 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 650  2450 650 
Wire Wire Line
	2450 650  1950 650 
Connection ~ 2450 650 
Connection ~ 1950 650 
$Comp
L device:C C43
U 1 1 5B0FAB51
P 3500 800
F 0 "C43" H 3615 846 50  0000 L CNN
F 1 "4.7 uF" H 3615 755 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0603_CAP_NOSILK" H 3538 650 50  0001 C CNN
F 3 "" H 3500 800 50  0001 C CNN
	1    3500 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 650  2950 650 
Connection ~ 2950 650 
Wire Wire Line
	3500 950  2950 950 
Wire Wire Line
	2950 950  2450 950 
Connection ~ 2950 950 
Wire Wire Line
	2450 950  1950 950 
Connection ~ 2450 950 
Wire Wire Line
	1950 950  1450 950 
Connection ~ 1950 950 
Wire Wire Line
	1450 950  1200 950 
Connection ~ 1450 950 
Text Notes 1200 1050 0    50   ~ 0
SMPS input caps
Text Notes 1200 1650 0    50   ~ 0
SMPS output caps
$Comp
L device:C C34
U 1 1 5B15ACE1
P 1450 1400
F 0 "C34" H 1565 1446 50  0000 L CNN
F 1 "47 uF" H 1565 1355 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0805_CAP_NOSILK" H 1488 1250 50  0001 C CNN
F 3 "" H 1450 1400 50  0001 C CNN
	1    1450 1400
	1    0    0    -1  
$EndComp
Text Label 1200 1250 2    50   ~ 0
1V8_DECOUPLE
Wire Wire Line
	1200 1250 1450 1250
Text Label 1200 1550 2    50   ~ 0
GND
Wire Wire Line
	1200 1550 1450 1550
Text Label 5350 2350 2    50   ~ 0
1V0_DECOUPLE
Wire Wire Line
	5350 2350 5350 2700
Connection ~ 5350 2700
Wire Wire Line
	5350 2700 5450 2700
Text Label 5350 4150 2    50   ~ 0
2V5_DECOUPLE
Wire Wire Line
	5350 4150 5350 4500
Connection ~ 5350 4500
Wire Wire Line
	5350 4500 5450 4500
Text Label 5350 6000 2    50   ~ 0
1V8_DECOUPLE
Wire Wire Line
	5350 6000 5350 6300
Connection ~ 5350 6300
Wire Wire Line
	5350 6300 5450 6300
Text Label 2450 1250 2    50   ~ 0
2V5_DECOUPLE
$Comp
L device:C C39
U 1 1 5B1B4555
P 2450 1400
F 0 "C39" H 2565 1446 50  0000 L CNN
F 1 "47 uF" H 2565 1355 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_1210_CAP_NOSILK" H 2488 1250 50  0001 C CNN
F 3 "" H 2450 1400 50  0001 C CNN
	1    2450 1400
	1    0    0    -1  
$EndComp
Text Label 3700 1250 2    50   ~ 0
1V0_DECOUPLE
Wire Wire Line
	1450 1550 2450 1550
Connection ~ 1450 1550
Text Notes 1250 2250 0    50   ~ 0
LDO caps
$Comp
L device:C C35
U 1 1 5B1D48D9
P 1450 2000
F 0 "C35" H 1565 2046 50  0000 L CNN
F 1 "4.7 uF" H 1565 1955 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0603_CAP_NOSILK" H 1488 1850 50  0001 C CNN
F 3 "" H 1450 2000 50  0001 C CNN
	1    1450 2000
	1    0    0    -1  
$EndComp
Text Label 1150 1850 2    50   ~ 0
5V0
Text Label 1150 2150 2    50   ~ 0
GND
Wire Wire Line
	1150 2150 1450 2150
Wire Wire Line
	1150 1850 1450 1850
Text Label 1950 1850 2    50   ~ 0
3V3
$Comp
L device:C C37
U 1 1 5B1F4F21
P 1950 2000
F 0 "C37" H 2065 2046 50  0000 L CNN
F 1 "4.7 uF" H 2065 1955 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0603_CAP_NOSILK" H 1988 1850 50  0001 C CNN
F 3 "" H 1950 2000 50  0001 C CNN
	1    1950 2000
	1    0    0    -1  
$EndComp
$Comp
L device:C C40
U 1 1 5B205288
P 2450 2000
F 0 "C40" H 2565 2046 50  0000 L CNN
F 1 "0.47 uF" H 2565 1955 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 2488 1850 50  0001 C CNN
F 3 "" H 2450 2000 50  0001 C CNN
	1    2450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1850 2450 1850
Wire Wire Line
	2450 2150 1950 2150
Wire Wire Line
	1950 2150 1450 2150
Connection ~ 1950 2150
Connection ~ 1450 2150
$Comp
L device:C C42
U 1 1 5B26AB60
P 2950 1400
F 0 "C42" H 3065 1446 50  0000 L CNN
F 1 "47 uF" H 3065 1355 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_1210_CAP_NOSILK" H 2988 1250 50  0001 C CNN
F 3 "" H 2950 1400 50  0001 C CNN
	1    2950 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1250 2450 1250
Wire Wire Line
	2450 1550 2950 1550
Connection ~ 2450 1550
$Comp
L device:C C44
U 1 1 5B28CAA0
P 3700 1400
F 0 "C44" H 3815 1446 50  0000 L CNN
F 1 "47 uF" H 3815 1355 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0805_CAP_NOSILK" H 3738 1250 50  0001 C CNN
F 3 "" H 3700 1400 50  0001 C CNN
	1    3700 1400
	1    0    0    -1  
$EndComp
$Comp
L device:C C45
U 1 1 5B29DD3C
P 4200 1400
F 0 "C45" H 4315 1446 50  0000 L CNN
F 1 "47 uF" H 4315 1355 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0805_CAP_NOSILK" H 4238 1250 50  0001 C CNN
F 3 "" H 4200 1400 50  0001 C CNN
	1    4200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1250 3700 1250
Wire Wire Line
	4200 1550 3700 1550
Wire Wire Line
	3700 1550 2950 1550
Connection ~ 3700 1550
Connection ~ 2950 1550
Text Notes 1400 600  0    50   ~ 0
1210 size
Text Notes 2450 1250 0    50   ~ 0
1210 size
Text Notes 3700 1250 0    50   ~ 0
0805 size
Text Notes 1200 1250 0    50   ~ 0
0805 size
Text Label 11050 2300 2    50   ~ 0
1V0_EN
$Comp
L device:R R152
U 1 1 68FFFDEA
P 11300 2300
F 0 "R152" V 11250 2550 50  0000 C CNN
F 1 "10K" V 11300 2300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 11230 2300 50  0001 C CNN
F 3 "" H 11300 2300 50  0001 C CNN
	1    11300 2300
	0    1    1    0   
$EndComp
Text Label 11050 2550 2    50   ~ 0
1V8_EN
$Comp
L device:R R153
U 1 1 69002ADA
P 11300 2550
F 0 "R153" V 11250 2800 50  0000 C CNN
F 1 "10K" V 11300 2550 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 11230 2550 50  0001 C CNN
F 3 "" H 11300 2550 50  0001 C CNN
	1    11300 2550
	0    1    1    0   
$EndComp
$Comp
L device:R R154
U 1 1 69002B6E
P 11300 2800
F 0 "R154" V 11250 3050 50  0000 C CNN
F 1 "10K" V 11300 2800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 11230 2800 50  0001 C CNN
F 3 "" H 11300 2800 50  0001 C CNN
	1    11300 2800
	0    1    1    0   
$EndComp
Text Label 11050 2800 2    50   ~ 0
2V5_EN
Wire Wire Line
	11050 2800 11150 2800
Wire Wire Line
	11050 2550 11150 2550
Wire Wire Line
	11050 2300 11150 2300
Text Label 11650 2300 0    50   ~ 0
GND
Wire Wire Line
	11650 2300 11450 2300
Text Label 11650 2550 0    50   ~ 0
GND
Wire Wire Line
	11650 2550 11450 2550
Text Label 11650 2800 0    50   ~ 0
GND
Wire Wire Line
	11650 2800 11450 2800
NoConn ~ 6650 5500
NoConn ~ 6650 5700
NoConn ~ 6650 5800
$EndSCHEMATC
