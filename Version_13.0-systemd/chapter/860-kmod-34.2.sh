#!/bin/bash

#------------------------------
# 8.60.1. Installation of Kmod
#

mkdir -p build
cd       build

meson setup --prefix=/usr ..    \
            --buildtype=release \
            -D manpages=false

ninja

ninja install
