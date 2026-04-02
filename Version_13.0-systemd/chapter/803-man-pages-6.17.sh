#!/bin/bash

#----------------------------------
# 8.3.1. Installation of Man-pages
#

rm -v man3/crypt*

make -R GIT=false prefix=/usr install
