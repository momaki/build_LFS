#!/bin/bash

#--------------------------------
# 8.18.1. Installation of Expect
#

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

python3 -c 'from pty import spawn; spawn(["echo", "ok"])'

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

patch -Np1 -i ../expect-5.45.4-gcc15-1.patch

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --disable-rpath         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make test

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib
