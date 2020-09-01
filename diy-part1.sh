#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#去掉makefile版本限制，使用最新源码
WORKINGDIR="feeds/packages/net/smartdns"
sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=$(date +'%Y%m%d%H%M')/g" $WORKINGDIR/Makefile
sed -i "s/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=master/g" $WORKINGDIR/Makefile
#利用第三方法,安装最新版smartdnsluci
cd ..
cd smartdns-orig
cp -rf luci-compat ../openwrt/feeds/luci/applications/luci-app-smartdns/
cd ../openwrt
