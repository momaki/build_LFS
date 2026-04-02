#!/bin/bash

#------------------------------
# 8.10.1. Installation of Zstd
#

make prefix=/usr

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make prefix=/usr install

rm -v /usr/lib/libzstd.a
