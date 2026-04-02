#!/bin/bash

#---------------------------
# 8.8.1. Installation of Xz
#

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.8.2

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
