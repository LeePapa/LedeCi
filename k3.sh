sed -i 's/4.14/4.19/g' target/linux/bcm53xx/Makefile #更改编译内核为4.19
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3|' target/linux/bcm53xx/image/Makefile #仅编译K3
