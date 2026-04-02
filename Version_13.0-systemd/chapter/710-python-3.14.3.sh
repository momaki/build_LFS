#!/bin/bash

#--------------------------------
# 7.10.1. Installation of Python
#

./configure --prefix=/usr       \
            --enable-shared     \
            --without-ensurepip \
            --without-static-libpython

make

make install
