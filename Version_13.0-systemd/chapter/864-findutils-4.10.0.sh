#!/bin/bash

#-----------------------------------
# 8.64.1. Installation of Findutils
#

./configure --prefix=/usr --localstatedir=/var/lib/locate

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

chown -R tester .
su tester -c "PATH=$PATH make check"

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
