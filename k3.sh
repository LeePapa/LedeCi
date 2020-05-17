#编译处理
sed -i 's/4.14/4.19/g' target/linux/bcm53xx/Makefile #更改编译内核为4.19
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3|' target/linux/bcm53xx/image/Makefile #仅编译K3

#利用第三方法,安装最新版luci

#WORKINGDIR="feeds/luci/applications/luci-app-smartdns"
#mkdir $WORKINGDIR -p

#cd ..
#git clone https://github.com/pymumu/smartdns.git pymumu
#cd smartdns-orig

#FROM="../pymumu"

#19版本使用 lede 暂时无法使用
#TO="luci"
#cp -rf $FROM/package/luci/files/root/usr/ $TO/root/
#cp -rf $FROM/package/luci/files/root/www/ $TO/htdocs/
#cp -rf $FROM/package/luci/control/ $TO/luasrc/
#cp -rf $FROM/package/luci/files/luci/i18n/smartdns.zh-cn.po $TO/po/zh_cn/smartdns.po

#sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=$(date +'%Y%m%d')/g" $TO/Makefile #修改版本号为日期

#cp -rf $TO ../openwrt/feeds/luci/applications/luci-app-smartdns
#cd ../openwrt

#利用第三方法,安装最新版luci 结束

#利用第三方法,安装最新版luci

WORKINGDIR="feeds/luci/applications/luci-app-smartdns"
mkdir $WORKINGDIR -p

cd ..
git clone https://github.com/pymumu/smartdns.git pymumu
cd smartdns-orig

FROM="../pymumu"

#18版本使用
TO="luci-compat"
cp -rf $FROM/package/luci-compat/files/etc/ $TO/root/
cp -rf $FROM/package/luci-compat/files/luci/view/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/controller/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/model/ $TO/luasrc/
cp -rf $FROM/package/luci-compat/files/luci/i18n/* $TO/po/zh-cn/

sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=$(date +'%Y%m%d')/g" $TO/Makefile #修改版本号为日期

cp -rf luci-compat ../openwrt/feeds/luci/applications/luci-app-smartdns
cd ../openwrt

#利用第三方法,安装最新版luci 结束
