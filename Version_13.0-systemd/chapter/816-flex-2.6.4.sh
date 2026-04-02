#!/bin/bash

#------------------------------
# 8.16.1. Installation of Flex
#

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/flex-2.6.4

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make check

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

ln -sv flex   /usr/bin/lex
ln -sv flex.1 /usr/share/man/man1/lex.1
