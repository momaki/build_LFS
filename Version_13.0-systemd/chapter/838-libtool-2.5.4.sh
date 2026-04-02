#!/bin/bash

#---------------------------------
# 8.38.1. Installation of Libtool
#

./configure --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

cat ./tests/testsuite.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

rm -fv /usr/lib/libltdl.a
