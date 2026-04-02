#!/bin/bash

#-------------------------------
# 8.35.1. Installation of Bison
#

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
