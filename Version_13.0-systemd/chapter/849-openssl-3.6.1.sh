#!/bin/bash

#---------------------------------
# 8.49.1. Installation of OpenSSL
#

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

HARNESS_JOBS=$(nproc) make test

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.6.1

cp -vfr doc/* /usr/share/doc/openssl-3.6.1
