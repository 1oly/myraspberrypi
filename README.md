myraspberrypi
=============

Code snippets and useful commands

### Tutorials
http://elinux.org/RPi_Tutorials

### Mulitple wifi-networks
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
