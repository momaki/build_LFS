#!/bin/bash

#------------------------------------
# 10.3.1. Installation of the kernel
#

make mrproper

make defconfig

make menuconfig

make

make modules_install

#mount /boot

cp -iv arch/x86/boot/bzImage /boot/vmlinuz-6.18.10-lfs-13.0-systemd

cp -iv System.map /boot/System.map-6.18.10

cp -iv .config /boot/config-6.18.10

cp -r Documentation -T /usr/share/doc/linux-6.18.10

#---------------------------------------------
# 10.3.2. Configuring Linux Module Load Order
#

install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF
