#!/bin/bash

#------------------------------
# 8.63.1. Installation of Gawk
#

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

chown -R tester .
su tester -c "PATH=$PATH make check"

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

rm -f /usr/bin/gawk-5.3.2
make install

ln -sv gawk.1 /usr/share/man/man1/awk.1

install -vDm644 doc/{awkforai.txt,*.{eps,pdf,jpg}} -t /usr/share/doc/gawk-5.3.2
