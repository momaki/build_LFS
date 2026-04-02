#!/bin/bash

#-------------------------------
# 8.40.1. Installation of Gperf
#

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.3

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
