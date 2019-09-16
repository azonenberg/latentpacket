EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title "LATENTRED Switch Engine"
Date "2019-09-09"
Rev "0.1"
Comp "Antikernel Labs"
Comment1 ""
Comment2 "Andrew D. Zonenberg"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 2100 1700 0    50   ~ 0
Required capacity per rail:\n* 5.0V  5A\n* 3.3V  2A\n* 1.8V  3A\n* 1.2V  1A\n* 1.0V  8A\n\nExpect ~~50W worst case across all rails\nAt 90% PSU efficiency, this is ~~4.6A @ 12V
Text Notes 2300 2500 0    50   ~ 0
If we add 12x DS25BR440 repeaters...\n190 mA each @ 3V3 = 2.28A\nWill need to bump 3.3V rail from 2A to 4.5-5A\nAdd 8W after conversion losses to total system power budget
$EndSCHEMATC
