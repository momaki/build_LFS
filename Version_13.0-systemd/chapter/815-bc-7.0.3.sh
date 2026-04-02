#!/bin/bash

#----------------------------
# 8.15.1. Installation of Bc
#

CC='gcc -std=c99' ./configure --prefix=/usr -G -O3 -r

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make test

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
