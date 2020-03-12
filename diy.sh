#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.88.88/g' package/base-files/files/bin/config_generate
sed -i 's/4.14/4.19/g' target/linux/ramips/Makefile
