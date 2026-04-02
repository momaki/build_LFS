#!/bin/bash

#------------------------------
# 8.25.1. Installation of Attr
#

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.2

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
