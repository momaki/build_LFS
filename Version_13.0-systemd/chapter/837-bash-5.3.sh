#!/bin/bash

#------------------------------
# 8.37.1. Installation of Bash
#

./configure --prefix=/usr             \
            --without-bash-malloc     \
            --with-installed-readline \
            --docdir=/usr/share/doc/bash-5.3

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

chown -R tester .

LC_ALL=C.UTF-8 su -s /usr/bin/expect tester << "EOF"
set timeout -1
spawn make tests
expect eof
lassign [wait] _ _ _ value
exit $value
EOF

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

#exec /usr/bin/bash --login
