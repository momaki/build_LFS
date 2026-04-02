#!/bin/bash

#-------------------------------
# 6.13.1. Installation of Patch
#

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install
