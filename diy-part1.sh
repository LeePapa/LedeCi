#!/bin/bash -x
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

########## SmartDns 官方方法 ##########

WORKINGDIR="feeds/packages/net/smartdns"
mkdir $WORKINGDIR
rm $WORKINGDIR/* -fr
wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O $WORKINGDIR/master.zip
unzip $WORKINGDIR/master.zip -d $WORKINGDIR
mv $WORKINGDIR/openwrt-smartdns-master/* $WORKINGDIR/
sed -i "s#PKG_VERSION:=.*#PKG_VERSION:=$(date +'%Y%m%d%H%M')#" $WORKINGDIR/Makefile
sed -i '#PKG_MIRROR_HASH:#d' $WORKINGDIR/Makefile
sed -i 's#PKG_SOURCE_VERSION:=.*#PKG_SOURCE_VERSION:=master#' $WORKINGDIR/Makefile
rmdir $WORKINGDIR/openwrt-smartdns-master
rm $WORKINGDIR/master.zip

#利用第三方法,安装最新版luci

mkdir feeds/luci/applications/luci-app-smartdns -p
cd ..
git clone https://github.com/pymumu/smartdns.git pymumu
cd smartdns-orig

FROM="../pymumu"
TO="luci-compat"

cp -rf $FROM/package/luci-compat/files/etc/ $TO/root/
cp -rf $FROM/package/luci-compat/files/luci/view/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/controller/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/model/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/i18n/* $TO/po/zh-cn/

cp -rf luci-compat/* ../openwrt/feeds/luci/applications/luci-app-smartdns/
cd ../openwrt
sed -i "s#PKG_VERSION:=.*#PKG_VERSION:=$(date +'%Y%m%d')#" feeds/luci/applications/luci-app-smartdns/Makefile

