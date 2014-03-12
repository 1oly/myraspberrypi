myraspberrypi
=============

Code snippets and useful commands

### Tutorials
http://elinux.org/RPi_Tutorials

### Direct network connection
[Adapted from this page](http://pihw.wordpress.com/guides/direct-network-connection/)

1. Connect Raspberry Pi to computer via Ethernet. In network settings find IP Address (e.g. ``169.254.XXX.XXX``)
2. Add a self-chosen IP Address to ``/boot/cmdline.txt`` by appending e.g. ``ip=169.254.42.42`` at the end of the line.
3. Reboot and access the Raspberry Pi via ssh: ``ssh 169.254.42.42 -l pi``

An automated procedure is explained [here](http://pihw.wordpress.com/guides/direct-network-connection/) but the outline is as follow

1. Create two files: ``/boot/cmdline.normal`` and ``/boot/cmdline.direct``, where .normal is the default ``cmdline.txt`` file without an IP Address and
.direct is the one with an appended IP Address.
2. By typing ``sudo cp /boot/cmdline.normal /boot/cmdline.txt`` or ``sudo cp /boot/cmdline.direct /boot/cmdline.txt`` it is possible to switch between the type of connection.
3. This process can be automated with the following shell script:

      ```
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
      ```
4. Save it as e.g. switchip.sh and making it executable ``chmod +x switchip.sh``
5. Execute by typing ``sudo ./switchip.sh`` and reboot.

### Multiple wifi-networks
[Adapted from this page](http://www.instantsupportsite.com/self-help/raspberry-pi/raspberry-connect-multiple-wireless-networks/)

1. Edit interfaces file: ``nano /etc/network/interfaces`` 
2. Add the line ``pre-up wpa_supplicant -Dwext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf -B``
3. Edit wpa file: ``/etc/wpa_supplicant/wpa_supplicant.conf``
4. Add mulitple wifi-networks

      ```
      ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
      update_config=1
      network={
      ssid=”SSID 1″
      scan_ssid=1
      proto=RSN
      key_mgmt=WPA-PSK
      pairwise=CCMP TKIP
      group=CCMP TKIP
      psk=”The encryption Key for this network goes here”
      }
      
      network={
      ssid=”SSID 2″
      scan_ssid=1
      proto=RSN
      key_mgmt=WPA-PSK
      pairwise=CCMP TKIP
      group=CCMP TKIP
      psk=”The encryption key for this network goes here”
      }
      ```
5. Save and restart wifi-connection

### Set-up AirPlay receiver:
[Follow these intructions](http://www.raywenderlich.com/44918/raspberry-pi-airplay-tutorial)