#!/bin/bash

#------------------------------------------
# 5.4.1. Installation of Linux API Headers
#

make mrproper

make headers
find usr/include -type f ! -name '*.h' -delete
cp -Rv usr/include $LFS/usr
