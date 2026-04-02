#!/bin/bash

#---------------------------
# 6.2.1. Installation of M4
#

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install
