#!/bin/bash

#------------------------------
# 6.11.1. Installation of Gzip
#

./configure --prefix=/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install
