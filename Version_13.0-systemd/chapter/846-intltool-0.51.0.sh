#!/bin/bash

#----------------------------------
# 8.46.1. Installation of Intltool
#

sed -i 's:\\\${:\\\$\\{:' intltool-update.in

./configure --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
