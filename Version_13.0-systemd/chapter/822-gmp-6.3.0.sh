#!/bin/bash

#-----------------------------
# 8.22.1. Installation of GMP
#

sed -i '/long long t1;/,+1s/()/(...)/' configure

abi=''
[ "$(uname -m)" != 'x86_64' ] && abi='ABI=32'

${abi}                       \
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.3.0

make
make html

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check 2>&1 | tee gmp-check-log

awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
make install-html
