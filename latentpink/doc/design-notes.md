Miscellaneous notes not necessarily intended for public consumption so may be disorganized...

# Power rails

Assume 12V intermediate rail from external wallwart or similar

## 3.3V (1.5A design load)

Murata MYMGK00504ERSR

## 2.5V (2A design load)

Murata MYMGK00504ERSR

## 1.8V (2A design load)

Murata MYMGK00504ERSR

## 1.5V (1.5A design load)

Murata MYMGK00504ERSR

## 1.2V (1A design load)

Murata MYMGK00504ERSR

## 1.0V (11A design load)

Murata MYMGK1R812ERSR

# FPGA

XC7K160T-2FBG484C. Already in inventory, biggest 7 series with 10G SERDES supported by the free Vivado edition.

Bare die flip chip package

## Thermal

Expecting ~10W thermal dissipation using worst case XPE numbers. Using 85C Tjmax and 35C ambient, we have to keep the
rise to <50C.

Target 20-50 PSI on top of die per XAPP1377 p22

Die size is 12.05 x 8.54 mm (0.159 in^2) so we want 3.18 - 7.95 pounds of total compressive loading. Spring screws
recommended by Xilinx. Target 5.5 pounds or so. Using 4 screws, we want around 1.3 pounds per screw.

Package is 23mm square, heatsink needs to be at least this size. Package height is 2.34mm (2.14 - 2.54) nominal from
seating plane to top of die.

Initial idea: 345-1796-ND (Wakefield-Vette 960-23-23-F-AB-0)
No integrated fan, use a chassis level one. Specified for 3.7C/W @ 200LFM so ~37C rise at this airflow.
But it's push pin. How much contact pressure??

Thermal pad: t-Global TG-A6200-15-15-0.5

# PHY

## Thermal

Worst case power consumption 6.75W in QSGMII to 1000baseT mode. Package is 27mm square.

Wakefield-Vette 960-27-12-D-AB-0

5.7C/W @ 200LFM so ~38C rise

Thermal pad: t-Global TG-A6200-25-25-0.5

# QDR

## Thermal

Worst case power consumption 1.85W. Package is 13 x 15 mm.

Advanced Thermal Solutions ATS-54150K-C1-R0, tape mount. 19.1C/W @ 200LFM so ~33C rise

# STM32

## Thermal

Should run cool, not doing anything heavy on it other than (brief) x25519 operations. Will be mostly in sleep etc
otherwise

# KSZ9031

## Thermal

Already a part we're very familiar with, doesn't need anything special. Runs warm but well within safe limits w/ no
heatsinking
