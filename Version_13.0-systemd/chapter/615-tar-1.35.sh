#!/bin/bash

#-----------------------------
# 6.15.1. Installation of Tar
#

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install
