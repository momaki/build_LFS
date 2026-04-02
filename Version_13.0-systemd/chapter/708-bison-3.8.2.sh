#!/bin/bash

#------------------------------
# 7.8.1. Installation of Bison
#

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2

make

make install
