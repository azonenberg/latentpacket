Miscellaneous notes not necessarily intended for public consumption so may be disorganized...

LATENTPINK is not intended to be ever produced in volume. It is a R&D testbed for future LATENTPACKET projects and will also double as an edge switch for my soldering / T&M bench to hang several DUTs off a single 10G uplink.

# Overall design concept

16 total Ethernet interfaces:

* **12x 10/100/1000baseT QSGMII (single VSC8512)**  
These are the primary edge ports for this switch.
* **2x 10/100/1000baseT SGMII (2x DP83867)**  
Testbed for oversampling CDR with hopefully improved SI/PI vs previous test platform.
* **1x 10Gbase-R SFP+ (direct to FPGA GTX)**  
Uplink to core switch.
* **1x 10/100/1000baseT RGMII (1x KSZ9031)**  
Management interface. Connects through FPGA to MCU (bridging RGMII to RMII) but is not bridged to the remaining fabric ports.

# Power rails

Assume 12V intermediate rail from external wallwart or similar

## 3.3V (2A design load)

Murata MYMGK00504ERSR

## 2.5V (2A design load)

Murata MYMGK00504ERSR

## 1.8V (3A design load)

Murata MYMGK00504ERSR

## 1.2V (1A design load)

Murata MYMGK00504ERSR

## 1.0V (11A design load)

Murata MYMGK1R812ERSR

## TODO: Vtt / Vref

0.9V termination and reference rails for C/A bus. DQ lines use ODT.

# FPGA

XC7K160T-2FBG484C. Already in inventory, biggest 7 series with 10G SERDES supported by the free Vivado edition.

Bare die flip chip package

## IO budgeting

Have total of 100x HP pins (2 banks) + 185x HR pins (3 full banks + one partial) and 4x GTX.

### Bank mapping

| Bank | VCCIO | Type   | Total pins | Used pins | Available pins |
|------|-------|--------|------------|-----------|----------------|
| 115  | N/A   | GTX    | 8          | 4 (QSGMII to VSC8512) <br/> 4 (SFP) | 0 |
| 0    | 1.8  | Config | N/A        | N/A       | N/A            |
| 13   | 1.8   | HR     | 50         | 42 (QDR) | 8 |
| 14   | 1.8   | HR     | 50         | 5 (boot flash, minus CCLK) <br/> 20 (QDR) | 25 |
| 15   | 1.8   | HR     | 50         | 41 (QDR)  | 9              |
| 16   | 3.3   | HR     | 35         | 7 (RMII to MCU) <br/> 6 (QSPI to MCU) <br/> 1 (IRQ to MCU) <br/> 2 (SFP port status LEDs) <br/> 4 (SFP GPIOs) | 15 |
| 33   | 1.8   | HP     | 50         | 2 (DCI VRP/VRN) <br/> 8 (SGMII to DP83867s) | 40 |
| 34   | 1.8   | HP     | 50         | 2 (MDIO to KSZ9031) <br/> 12 (RGMII to KSZ9031) <br/> 4 (MDIO to 2x DP83867) <br/> 2 (MDIO to VSC8512) | 30 |

### SERDES

GTX breakdown is easy: we have one quad and need 3x QSGMII, 1x 10Gbase-R. So we'll use both of the two available refclks but should be fine.

Use the QPLL for 10GbE and CPLL for the QSGMII.

### SGMII

Need to use four diff pairs (two TX and two RX) in a HP bank, plus DCI pins.

VCCO must be 1.8V

### Boot flash

Quad SPI, minimum 64 Mbit capacity. Need six pins in bank 0 / 14.

Use IS25WP256D-JLLE for 1.8V.

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

# Main PHY

Microchip (formerly Microsemi, formerly Vitesse) VSC8512, 3 lane QSGMII -> 12 ports 10/100/1000baseT

## Bringup

VSC8512 PHY is apparently an "Atom12" family PHY. And appears to be a fused-down VSC7425 switch ASIC with a management CPU and everything, *hopefully* completely disabled...

## Thermal

Worst case power consumption 6.75W in QSGMII to 1000baseT mode. Package is 27mm square.

Wakefield-Vette 960-27-12-D-AB-0

5.7C/W @ 200LFM so ~38C rise

Thermal pad: t-Global TG-A6200-25-25-0.5

# Secondary PHY

# QDR

Cypress / Infineon CY7C2245KV18-450BZXI. Supports 1.5 and 1.8V VCCO, prefer 1.5 if possible for lower power consumption but not viable in FBG484 package. Core is 1.8 only.

Logically addressed as 128 bit blocks (two DDR cycles, four 32 bit transfers) plus ECC, by 256K (0x40000) rows.

## IO

Total of 101 pins. Needs three consecutive HR I/O banks (i.e. including bank 14 is unavoidable).

Everything is 1.8V HSTL, we need the bank accepting read data to have 0.9V Vref as well.

Write bank (output only, no Vref needed, total 42 pins, bank 13):

* D[35:0] (align to byte groups)
* BWS[3:0] (put in byte group)
* K_P / K_N (use DQS pin pair)

Address / control bank (output only, no Vref needed, total 20 pins, bank 14): 

* WPS#
* A[17:0]
* RPS#

Read bank (input only, Vref needed, total 41 pins, bank 15):  

* Vref (x2)
* CQ_P / CQ_N (on MRCC pins... MIG wants both on P??? Double check this)
* Q[35:0]
* QVLD

Not going to FPGA GPIOs:

* ZQ  
* JTAG
* Vref
* ODT

## Bandwidth

450 MHz DDR = 900 MT/s * 36 bit data bus = 32.4 Gbps BW.

If we use Hamming(72,64) FEC usable capacity is 900 MT/s * 32 bits = 28.8 Gbps

With 12+2 = 14x 1 Gbps ports + 1x 10 Gbps ports, we need 24 Gbps so have a little bit of headroom.

MIG seems to not like going >400 MHz in HR banks even though datasheet says 450 should be OK (using Vivado 2021.2, might try updating). With 400 MHz, we're limited to 28.8 Gbps with no ECC, or 25.6 Gbps with ECC. Still (barely) enough.

## Thermal

Worst case power consumption 1.85W. Package is 13 x 15 mm.

Advanced Thermal Solutions ATS-54150K-C1-R0, tape mount. 19.1C/W @ 200LFM so ~33C rise

# STM32

Run at 3.3V I/O and core with SMPS + LDO

## Thermal

Should run cool, not doing anything heavy on it other than (brief) x25519 operations. Will be mostly in sleep etc
otherwise

# KSZ9031

## Thermal

Already a part we're very familiar with, doesn't need anything special. Runs warm but well within safe limits w/ no heatsinking
