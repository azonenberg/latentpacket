#!/bin/sh

LINE=`ls -lh latentred.bin | cut -d ' ' -f 5`
echo "Flash memory usage: $LINE";

STACKSTART=$(arm-none-eabi-objdump -t latentred.elf  | grep __stack_start | cut -d ' ' -f 1);
STACKEND=$(arm-none-eabi-objdump -t latentred.elf  | grep __stack_end | cut -d ' ' -f 1);
DSTACKSTART=$(echo "obase=10;ibase=16;${STACKSTART^^}" | bc);
DSTACKEND=$(echo "obase=10;ibase=16;${STACKEND^^}" | bc);
STACKSIZE=$(expr $DSTACKEND - $DSTACKSTART);
STACKKB=$(expr $STACKSIZE / 1024);
echo "Stack size: $STACKKB kB";

GLOBALSTART=$(arm-none-eabi-objdump -t latentred.elf  | grep __data_start | cut -d ' ' -f 1);
GLOBALEND=$(arm-none-eabi-objdump -t latentred.elf  | grep __bss_end | cut -d ' ' -f 1);
DGLOBALSTART=$(echo "obase=10;ibase=16;${GLOBALSTART^^}" | bc);
DGLOBALEND=$(echo "obase=10;ibase=16;${GLOBALEND^^}" | bc);
GLOBALSIZE=$(expr $DGLOBALEND - $DGLOBALSTART);
GLOBALKB=$(expr $GLOBALSIZE / 1024);
echo "Global size: $GLOBALKB kB";

HEAPSTART=$(arm-none-eabi-objdump -t latentred.elf  | grep __heap_start | cut -d ' ' -f 1);
HEAPEND=$(arm-none-eabi-objdump -t latentred.elf  | grep __heap_end | cut -d ' ' -f 1);
DHEAPSTART=$(echo "obase=10;ibase=16;${HEAPSTART^^}" | bc);
DHEAPEND=$(echo "obase=10;ibase=16;${HEAPEND^^}" | bc);
HEAPSIZE=$(expr $DHEAPEND - $DHEAPSTART);
HEAPKB=$(expr $HEAPSIZE / 1024);
echo "Heap size: $HEAPKB kB";
