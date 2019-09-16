EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title "LATENTRED Switch Engine"
Date "2019-09-09"
Rev "0.1"
Comp "Antikernel Labs"
Comment1 "Top Level"
Comment2 "Andrew D. Zonenberg"
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1000 1000 1000 1050
U 5D76FED6
F0 "Power Supply" 50
F1 "psu.sch" 50
$EndSheet
$Sheet
S 2600 1000 850  1050
U 5D770550
F0 "SGMII Interfaces" 50
F1 "sgmii.sch" 50
$EndSheet
$Sheet
S 4500 1000 750  1050
U 5D77059B
F0 "SFP+ Interfaces" 50
F1 "sfps.sch" 50
$EndSheet
$Sheet
S 6500 1000 750  1050
U 5D7705E0
F0 "QDR-II+ SRAM" 50
F1 "ram.sch" 50
$EndSheet
$Sheet
S 8150 1000 950  1050
U 5D77061F
F0 "FPGA Support" 50
F1 "fpga-support.sch" 50
$EndSheet
Text Notes 800  7250 0    50   ~ 0
I/O bank config:\n* 115/GTX:\n  * SFP+ (all 4 lanes)\n* 33/HP, VCCIO=1V8:\n  * SGMII lanes 0-11 (48 pins)\n  * 2 free\n* 34/HP, VCCIO=1V8:\n  * SGMII lanes 12-23 (48 pins)\n  * 2 free\n* 13/HR, VCCIO=1V8:\n  * QDR D bus (36 pins)\n  * QDR D clock (2 pins)\n  * 12 free\n* 14/HR, VCCIO=1V8:\n  * QDR address (18 pins)\n  * QDR BWS (4 pins)\n  * QDR port selects (2 pins)\n  * QSPI flash (5 pins, since CCLK is special)\n  * 21 free\n* 15/HR, VCCIO=1V8:\n  * QDR Q bus (36 pins)\n  * QDR Q clock (2 pins)\n  * QDR Q valid (1 pin) \n  * 11 free\n* 16/HR, VCCIO=1V8:\n  * RGMII to INTEGRALSTICK FPGA (12 pins)\n  * SPI to INTEGRALSTICK MCU (use FPGA as level shifter) (4 pins)\n  * 19 free
$EndSCHEMATC
