#!/bin/bash

#------------------------------
# 8.36.1. Installation of Grep
#

sed -i "s/echo/#echo/" src/egrep.sh

./configure --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
