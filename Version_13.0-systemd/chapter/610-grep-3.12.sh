#!/bin/bash

#------------------------------
# 6.10.1. Installation of Grep
#

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)

make

make DESTDIR=$LFS install
