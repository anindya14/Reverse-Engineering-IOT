#Reference Video - https://www.youtube.com/watch?v=hV8W4o-Mu2o&list=PLniOzp3l9V80YBUmIEOG4HYxEbkixOB7T

1. Extract firmware with custom script

2. check the filesystem and extract the squashfs or jffs2 filesystems to get the rootfs 

3. modify the extracted-sqashfs filesystem and pack it with unsquashfs. 

To unpack we use unquashfs -d destination-file squashfs-file   OR just unsquashfs imagefile

4. To unpack the jffs2 file use "jefferson"

command - jefferson -d destination-file jffs2-file OR jefferson jffs2-file

5. Packing squashfs 

To pack first check the compression type of the original squashfs file command to check is - unsquashfs -s squashfs-file

Use the above values and make the squashfs file using tool "mksquashfs"

Command - mksquashfs squashfs_unpacked/ squashfs_new -comp xz -b 131072

value of comp i.e compression and -b i.e block-size can be obtained from "unsquashfs -s squashfs-file". Here xz is a type of compression.

6. Packing JFFS2

command - mkfs.jffs2 -r jffs2-extracted-directory -o jffs2-output-directory

Reference - https://linuxlink.timesys.com/docs/wiki/engineering/HOWTO_Create_JFFS2_Images

6. Pack the firmware with the custom script... Here we pack the filesystems without the image header as  we will make it in next step.


7. make the header image for the firmware using "mkimage" tool

eg -  mkimage -A ARM -O linux -T firmware -C none -a 0 -e 0 -n Linux-2.6.35.8 -d demo_backdoored.bin demo_image.bin
      mkimage -A mips -O linux -T firmware -C none 


values of -A , -O ,-n are found when we do a binwalk on the image header found while extraction
demo_backdoored.bin   -- Image to be signed 
demo_image.bin        -- Output signed image

To check details of any command of mkimage do 
      EG - mkimage -C -h #We can get all the options for -C 
      
