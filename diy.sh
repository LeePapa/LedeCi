#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.88.88/g' package/base-files/files/bin/config_generate
#sed -i 's/4.14/4.19/g' target/linux/ramips/Makefile
#sed -i 'a src-git passwall https://github.com/Lienol/openwrt-package/tree/passwall' feeds.conf.default
#git clone -b passwall https://github.com/Lienol/openwrt-package.git package/Lienol
git clone https://github.com/Lienol/openwrt-package.git package/Lienol
rm -rf feeds/lienol/lienol/ipt2socks
rm -rf feeds/lienol/lienol/shadowsocksr-libev
rm -rf feeds/lienol/lienol/pdnsd-alt
rm -rf feeds/lienol/package/verysync
rm -rf feeds/lienol/lienol/luci-app-verysync
rm -rf package/lean/luci-app-kodexplorer
rm -rf package/lean/luci-app-pppoe-relay
rm -rf package/lean/luci-app-pptp-server
rm -rf package/lean/luci-app-v2ray-server
