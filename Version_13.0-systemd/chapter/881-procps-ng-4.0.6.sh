#!/bin/bash

#-----------------------------------
# 8.81.1. Installation of Procps-ng
#

./configure --prefix=/usr                           \
            --docdir=/usr/share/doc/procps-ng-4.0.6 \
            --disable-static                        \
            --disable-kill                          \
            --enable-watch8bit                      \
            --with-systemd

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

chown -R tester .
su tester -c "PATH=$PATH make check"

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
