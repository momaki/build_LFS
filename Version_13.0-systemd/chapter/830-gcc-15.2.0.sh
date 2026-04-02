#!/bin/bash

#-----------------------------
# 8.30.1. Installation of GCC
#

sed -i 's/char [*]q/const &/' libgomp/affinity-fmt.c

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir -v build
cd       build

../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --enable-default-pie     \
             --enable-default-ssp     \
             --enable-host-pie        \
             --disable-multilib       \
             --disable-bootstrap      \
             --disable-fixincludes    \
             --with-system-zlib

make

ulimit -s -H unlimited

sed -e '/cpython/d' -i ../gcc/testsuite/gcc.dg/plugin/plugin.exp

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

chown -R tester .
su tester -c "PATH=$PATH make -k -j$(nproc) check"

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

../contrib/test_summary

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

chown -v -R root:root \
    /usr/lib/gcc/$(gcc -dumpmachine)/15.2.0/include{,-fixed}

ln -svr /usr/bin/cpp /usr/lib

ln -sv gcc.1 /usr/share/man/man1/cc.1

ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/15.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

echo 'int main(){}' | cc -x c - -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep -B4 '^ /usr/include' dummy.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep 'SEARCH.*/usr/lib' dummy.log | sed 's|; |\n|g'

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep "/lib.*/libc.so.6 " dummy.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep found dummy.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

rm -v a.out dummy.log

mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
