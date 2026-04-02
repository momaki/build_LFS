#!/bin/bash

#-----------------------------
# 8.6.1. Installation of Zlib
#

./configure --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

rm -fv /usr/lib/libz.a
