#!/bin/bash

#-----------------------------
# 6.14.1. Installation of Sed
#

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)

make

make DESTDIR=$LFS install
