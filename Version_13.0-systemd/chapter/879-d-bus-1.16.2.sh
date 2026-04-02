#!/bin/bash

#-------------------------------
# 8.79.1. Installation of D-Bus
#

mkdir build
cd    build

meson setup --prefix=/usr --buildtype=release --wrap-mode=nofallback ..

ninja

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

ninja test

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

ninja install

ln -sfv /etc/machine-id /var/lib/dbus
