#!/bin/bash

#------------------------------
# 8.66.1. Installation of GRUB
#

unset {C,CPP,CXX,LD}FLAGS

sed 's/--image-base/--nonexist-linker-option/' -i configure

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-efiemu  \
            --disable-werror

make

#echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"
#
#make check
#
#echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
