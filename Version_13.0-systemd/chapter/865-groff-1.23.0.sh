#!/bin/bash

#-------------------------------
# 8.65.1. Installation of Groff
#

#PAGE=<paper_size> ./configure --prefix=/usr
PAGE=A4 ./configure --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
