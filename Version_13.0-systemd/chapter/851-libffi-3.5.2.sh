#!/bin/bash

#--------------------------------
# 8.51.1. Installation of Libffi
#

./configure --prefix=/usr    \
            --disable-static \
            --with-gcc-arch=native

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
