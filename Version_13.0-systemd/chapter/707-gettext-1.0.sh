#!/bin/bash

#--------------------------------
# 7.7.1. Installation of Gettext
#

./configure --disable-shared

make

cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
