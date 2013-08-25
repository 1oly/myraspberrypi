#!/bin/sh

#Function to swap to Direct IP Address
direct () { sudo cp /boot/cmdline.direct /boot/cmdline.txt;}
 
#Function to swap to Normal Automatic IP Address
normal () { sudo cp /boot/cmdline.normal /boot/cmdline.txt;}
 
# Menu using case-esac
echo "Select IP Address? Use Direct or Auto or Keep (d/a/-)?"
read answer
case $answer in
 d|D) echo Use Direct IP;direct;;
 a|A) echo Use Auto IP;normal;;
 *) echo Keep - No Change;;
esac
 
echo cmdline.txt
echo ____________
cat /boot/cmdline.txt

# From: http://pihw.wordpress.com/guides/direct-network-connection/