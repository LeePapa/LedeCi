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

# PassWall
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

# SmartDns
cd ..
git clone https://github.com/pymumu/smartdns.git pymumu
cd smartdns

FROM="../pymumu"
TO="./luci-app-smartdns-new-18"

cp -rf $FROM/package/luci-compat/files/etc/ $TO/root/
cp -rf $FROM/package/luci-compat/files/luci/view/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/controller/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/model/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/i18n/smartdns.zh-cn.po $TO/po/zh-cn/smartdns-new.po

TO="./luci-app-smartdns-new"

cp -rf $FROM/package/luci/files/usr/ $TO/root/
cp -rf $FROM/package/luci/files/luci/htdocs/ $TO/
cp -rf $FROM/package/luci/files/luci/controller/ $TO/luasrc/
cp -rf $FROM/package/luci/files/luci/i18n/smartdns.zh-cn.po $TO/po/zh_Hans/smartdns-new.po

sed -i 'a src-link smartdns ' feeds.conf.default
