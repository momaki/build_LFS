#!/bin/bash

#----------------------------------
# 8.53.1. Installation of Python 3
#

./configure --prefix=/usr          \
            --enable-shared        \
            --with-system-expat    \
            --enable-optimizations \
            --without-static-libpython

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make test TESTOPTS="--timeout 120"

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

install -v -dm755 /usr/share/doc/python-3.14.3/html

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.14.3/html \
    -xvf ../python-3.14.3-docs-html.tar.bz2
