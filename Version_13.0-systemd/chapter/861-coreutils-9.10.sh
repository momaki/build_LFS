#!/bin/bash

#-----------------------------------
# 8.61.1. Installation of Coreutils
#

patch -Np1 -i ../coreutils-9.10-i18n-1.patch

autoreconf -fv
automake -af
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make NON_ROOT_USERNAME=tester check-root

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

groupadd -g 102 dummy -U tester

chown -R tester .

su tester -c "PATH=$PATH make -k RUN_EXPENSIVE_TESTS=yes check" \
   < /dev/null

cat ./gnulib-tests/test-suite.log

groupdel dummy

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8
