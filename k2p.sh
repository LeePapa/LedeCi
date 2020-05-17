#利用第三方法,安装最新版luci

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
