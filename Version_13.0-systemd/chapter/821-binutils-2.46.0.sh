#!/bin/bash

#----------------------------------
# 8.21.1. Installation of Binutils
#

mkdir -v build
cd       build

../configure --prefix=/usr       \
             --sysconfdir=/etc   \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --enable-new-dtags  \
             --with-system-zlib  \
             --enable-default-hash-style=gnu

make tooldir=/usr

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make -k check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep '^FAIL:' $(find -name '*.log')

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make tooldir=/usr install

rm -rfv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a \
        /usr/share/doc/gprofng/
