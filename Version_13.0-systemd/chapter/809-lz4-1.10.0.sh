#!/bin/bash

#----------------------------
# 8.9.1. Installation of Lz4
#

make BUILD_STATIC=no PREFIX=/usr

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make -j1 check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make BUILD_STATIC=no PREFIX=/usr install
