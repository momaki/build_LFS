#!/bin/bash

#--------------------------------
# 8.27.1. Installation of Libcap
#

sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make test

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make prefix=/usr lib=lib install
