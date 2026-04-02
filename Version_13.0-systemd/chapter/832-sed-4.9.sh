#!/bin/bash

#-----------------------------
# 8.32.1. Installation of Sed
#

./configure --prefix=/usr

make
make html

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

chown -R tester .
su tester -c "PATH=$PATH make check"

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
install -d -m755           /usr/share/doc/sed-4.9
install -m644 doc/sed.html /usr/share/doc/sed-4.9
