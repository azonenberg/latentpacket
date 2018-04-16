EESchema Schematic File Version 4
LIBS:latentred-linecard-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "LATENTRED Line Card"
Date "2018-04-15"
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
S 3000 800  1050 1500
U 5AD420DA
F0 "PHYs" 50
F1 "phys.sch" 50
$EndSheet
Text Notes 2300 3100 0    50   ~ 0
TODO: I2C pullups
$EndSCHEMATC
