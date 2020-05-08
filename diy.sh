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

########## PassWall 开始 ##########
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

#PassWall 备份装载
mkdir package/Lienol/lienol/luci-app-passwall
git clone https://github.com/LeePapa/openwrt-package.git leetemp/Lienol
mv leetemp/Lienol/lienol/luci-app-passwall/* package/Lienol/lienol/luci-app-passwall
rm -rf leetemp

########## PassWall 结束 ##########

########## 第三方 SmartDns 开始 ##########
#cd ..
#git clone https://github.com/pymumu/smartdns.git pymumu
#cd smartdns-orig

#FROM="../pymumu"

#18版本使用
#TO="./luci-app-smartdns-new-18"
#cp -rf $FROM/package/luci-compat/files/etc/ $TO/root/
#cp -rf $FROM/package/luci-compat/files/luci/view/ $TO/luasrc/
#cp -rf $FROM/package/luci-compat/files/luci/controller/ $TO/luasrc/
#cp -rf $FROM/package/luci-compat/files/luci/model/ $TO/luasrc/
#cp -rf $FROM/package/luci-compat/files/luci/i18n/smartdns.zh-cn.po $TO/po/zh-cn/smartdns-new.po
#rm -rf luci-app-smartdns-new/

#19.07以上版本使用
#TO="./luci-app-smartdns-new"
#cp -rf $FROM/package/luci/files/usr/ $TO/root/
#cp -rf $FROM/package/luci/files/luci/htdocs/ $TO/
#cp -rf $FROM/package/luci/files/luci/controller/ $TO/luasrc/
#cp -rf $FROM/package/luci/files/luci/i18n/smartdns.zh-cn.po $TO/po/zh_Hans/smartdns-new.po
#rm -rf luci-app-smartdns-new-18/

#添加源
#sed -i "$a src-link smartdns $PWD" ../openwrt/feeds.conf.default
#sed -i "4a src-link smartdns $PWD" ../openwrt/feeds.conf.default

#cd ../openwrt
#./scripts/feeds update -a
#./scripts/feeds install -a

########## 第三方 SmartDns 结束 ##########

########## SmartDns 官方方法 ##########

WORKINGDIR="feeds/packages/net/smartdns"
mkdir $WORKINGDIR -p
rm $WORKINGDIR/* -fr
wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O $WORKINGDIR/master.zip
unzip $WORKINGDIR/master.zip -d $WORKINGDIR
mv $WORKINGDIR/openwrt-smartdns-master/* $WORKINGDIR/
rmdir $WORKINGDIR/openwrt-smartdns-master
rm $WORKINGDIR/master.zip


#去掉makefile版本限制，使用最新源码

sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=$(date +'%Y%m%d')/g" $WORKINGDIR/Makefile #修改版本号为日期
sed -i "s/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=master/g" $WORKINGDIR/Makefile #删除版本标识


#官方方法安装luci,非最新版

#LUCIBRANCH="lede" #更换此变量
#WORKINGDIR="feeds/luci/applications/luci-app-smartdns"
#mkdir $WORKINGDIR -p
#rm $WORKINGDIR/* -fr
#wget https://github.com/pymumu/luci-app-smartdns/archive/${LUCIBRANCH}.zip -O $WORKINGDIR/${LUCIBRANCH}.zip
#unzip $WORKINGDIR/${LUCIBRANCH}.zip -d $WORKINGDIR
#mv $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}/* $WORKINGDIR/
#rmdir $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}
#rm $WORKINGDIR/${LUCIBRANCH}.zip


########## SmartDns 官方方法结束 ##########

#利用第三方法,安装最新版luci

cd ..
git clone https://github.com/pymumu/smartdns.git pymumu
cd smartdns-orig

FROM="../pymumu"

#18版本使用
TO="../openwrt/feeds/luci/applications/luci-app-smartdns"
cp -rf $FROM/package/luci-compat/files/etc/ $TO/root/
cp -rf $FROM/package/luci-compat/files/luci/view/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/controller/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/model/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/i18n/smartdns.zh-cn.po $TO/po/zh-cn/smartdns-new.po
cd ../openwrt

#更新/安装插件列表
./scripts/feeds update -a
./scripts/feeds install -a


