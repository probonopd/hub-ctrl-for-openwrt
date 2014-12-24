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
