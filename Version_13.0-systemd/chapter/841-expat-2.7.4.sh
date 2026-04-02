#!/bin/bash

#-------------------------------
# 8.41.1. Installation of Expat
#

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.7.4

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.7.4
