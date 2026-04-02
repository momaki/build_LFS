#!/bin/bash

#---------------------------------
# 8.34.1. Installation of Gettext
#

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-1.0

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
chmod -v 0755 /usr/lib/preloadable_libintl.so
