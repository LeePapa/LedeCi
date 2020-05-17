#编译处理
sed -i 's/4.14/4.19/g' target/linux/bcm53xx/Makefile #更改编译内核为4.19
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3|' target/linux/bcm53xx/image/Makefile #仅编译K3

#利用第三方法,安装最新版luci

cd ..
git clone https://github.com/pymumu/smartdns.git pymumu
cd smartdns-orig

FROM="../pymumu"

#19版本使用
TO="luci"
cp -rf $FROM/package/luci/files/usr/ $TO/root/
cp -rf $FROM/package/luci/files/luci/htdocs/ $TO/
cp -rf $FROM/package/luci/files/luci/controller/ $TO/luasrc/
cp -rf $FROM/package/luci/files/luci/i18n/* $TO/po/zh_Hans/

sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=$(date +'%Y%m%d')/g" $TO/Makefile #修改版本号为日期

WORKINGDIR="feeds/luci/applications/luci-app-smartdns"
mkdir $WORKINGDIR -p

cp -rf $TO ../openwrt/feeds/luci/applications/luci-app-smartdns
cd ../openwrt

#利用第三方法,安装最新版luci 结束
