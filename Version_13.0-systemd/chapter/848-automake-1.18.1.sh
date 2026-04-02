#!/bin/bash

#----------------------------------
# 8.48.1. Installation of Automake
#

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.18.1

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make -j$(($(nproc)>4?$(nproc):4)) check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
