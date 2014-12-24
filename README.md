hub-ctrl-for-openwrt
====================
hub-ctrl allows you to switch off power on USB ports on USB hubs that have the hardware necessary to allow software controlled power switching. 

This repository contains a Makefile that allows a hub-ctrl package to be built using the OpenWrt SDK. A precompiled binary package for ar71xx (e.g., TP-Link TL-WR703N, TL-WR710N; D-Link DIR-505) is available on https://github.com/probonopd/hub-ctrl-for-openwrt/releases/tag/1.0

Building
--------

To build, download and unpack the OpenWrt SDK, then clone this repository into your ```./package``` subdirectory of the unpacked OpenWrt SDK:
```
cd ./package/
git clone https://github.com/probonopd/hub-ctrl-for-openwrt.git
cd -
```
Make sure the Makefile is in ```package/hub-ctrl/Makefile``` in the OpenWrt SDK, then run ```scripts/feeds install libusb-compat``` and finally ```make V=s```. This will create ```./bin/ar71xx/packages/base/hub-ctrl_1_ar71xx.ipk``` (depending on your architecture).

Using
-----

You can control the power on a port using the following command.

    sudo ./hub-ctrl -h 3 -P 1 -p 0

That says to control hub 3 (-h 3) port 1 (-P 1) and to turn the power off (-p 0). You can also use ”-p 1” to turn the power back on.

You can also specify the USB device based on the BUS and DEV numbers. Use the following command the list the currently connected devices. It's useful to run this with the device disconnected and then again with the device connected so that you can tell which device is the one you are trying to target (the Targus in my case).

    lsusb

Now that we know the BUS and DEV numbers, we can control the power using those
numbers as well. Here's the command for that.

    sudo ./hub-ctrl -b 001 -d 005 -P1 -p 0

This time we are controlling the device on BUS 001 (-b 001) device 005 (-d 005)
port 1 (-P 1) and turning the power off (-p 0).

More information, including upstream copyright information, can be found at https://github.com/codazoda/hub-ctrl.c/
