#!/bin/bash

#------------------------------------
# 8.82.1. Installation of Util-linux
#

./configure --bindir=/usr/bin     \
            --libdir=/usr/lib     \
            --runstatedir=/run    \
            --sbindir=/usr/sbin   \
            --disable-chfn-chsh   \
            --disable-login       \
            --disable-nologin     \
            --disable-su          \
            --disable-setpriv     \
            --disable-runuser     \
            --disable-pylibmount  \
            --disable-liblastlog2 \
            --disable-static      \
            --without-python      \
            ADJTIME_PATH=/var/lib/hwclock/adjtime \
            --docdir=/usr/share/doc/util-linux-2.41.3

make

#echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"
#
#bash tests/run.sh --srcdir=$PWD --builddir=$PWD
#
#echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

touch /etc/fstab
chown -R tester .
su tester -c "make -k check"

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
