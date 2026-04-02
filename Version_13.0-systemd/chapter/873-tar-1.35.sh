#!/bin/bash

#-----------------------------
# 8.73.1. Installation of Tar
#

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

cat ./tests/testsuite.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
make -C doc install-html docdir=/usr/share/doc/tar-1.35
