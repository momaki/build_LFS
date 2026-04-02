#!/bin/bash

#----------------------------
# 6.16.1. Installation of Xz
#

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.8.2

make

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/liblzma.la
