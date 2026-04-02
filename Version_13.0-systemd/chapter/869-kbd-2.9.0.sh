#!/bin/bash

#-----------------------------
# 8.69.1. Installation of Kbd
#

patch -Np1 -i ../kbd-2.9.0-backspace-1.patch

sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

./configure --prefix=/usr --disable-vlock

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

cp -R -v docs/doc -T /usr/share/doc/kbd-2.9.0
