#!/bin/bash

#------------------------------
# 5.5.1. Installation of Glibc
#

case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac

patch -Np1 -i ../glibc-fhs-1.patch

mkdir -v build
cd       build

echo "rootsbindir=/usr/sbin" > configparms

../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --disable-nscd                     \
      libc_cv_slibdir=/usr/lib           \
      --enable-kernel=5.4

make -j1

make DESTDIR=$LFS install

sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

echo 'int main(){}' | $LFS_TGT-gcc -x c - -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep -E -o "$LFS/lib.*/S?crt[1in].*succeeded" dummy.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep -B3 "^ $LFS/usr/include" dummy.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep "/lib.*/libc.so.6 " dummy.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

grep found dummy.log

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

rm -v a.out dummy.log
