#!/bin/bash

#--------------------------------
# 8.33.1. Installation of Psmisc
#

./configure --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
