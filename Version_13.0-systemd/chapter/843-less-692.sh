#!/bin/bash

#------------------------------
# 8.43.1. Installation of Less
#

./configure --prefix=/usr --sysconfdir=/etc

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
