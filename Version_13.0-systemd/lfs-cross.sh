#!/bin/bash
# LFS Build Script
# Builds the cross-toolchain and cross compiling temporary tools from chapters 5 and 6

function build() {
  echo "[lfs-scripts] Starting build of $3 at $(date)"

  tar xf "$1"

  pushd "$2"
    source $LFS/chapter/"$3".sh
  popd

  rm -rf "$2"

  echo "[lfs-scripts] Finishing build of $3 at $(date)"
}

cd $LFS/sources

build binutils-2.46.0.tar.xz binutils-2.46.0 502-binutils-2.46.0-pass1 | tee $LFS/logs/502-binutils-2.46.0-pass1.log
#read Wait
build gcc-15.2.0.tar.xz gcc-15.2.0 503-gcc-15.2.0-pass1 | tee $LFS/logs/503-gcc-15.2.0-pass1.log
#read Wait
build linux-6.18.10.tar.xz linux-6.18.10 504-linux-6.18.10-api-headers | tee $LFS/logs/504-linux-6.18.10-api-headers.log
#read Wait
build glibc-2.43.tar.xz glibc-2.43 505-glibc-2.43 | tee $LFS/logs/505-glibc-2.43.log
#read Wait
build gcc-15.2.0.tar.xz gcc-15.2.0 506-libstdc++-15.2.0 | tee $LFS/logs/506-libstdc++-15.2.0.log
#read Wait
build m4-1.4.21.tar.xz m4-1.4.21 602-m4-1.4.21 | tee $LFS/logs/602-m4-1.4.21.log
#read Wait
build ncurses-6.6.tar.gz ncurses-6.6 603-ncurses-6.6 | tee $LFS/logs/603-ncurses-6.6.log
#read Wait
build bash-5.3.tar.gz bash-5.3 604-bash-5.3 | tee $LFS/logs/604-bash-5.3.log
#read Wait
build coreutils-9.10.tar.xz coreutils-9.10 605-coreutils-9.10 | tee $LFS/logs/605-coreutils-9.10.log
#read Wait
build diffutils-3.12.tar.xz diffutils-3.12 606-diffutils-3.12 | tee $LFS/logs/606-diffutils-3.12.log
#read Wait
build file-5.46.tar.gz file-5.46 607-file-5.46 | tee $LFS/logs/607-file-5.46.log
#read Wait
build findutils-4.10.0.tar.xz findutils-4.10.0 608-findutils-4.10.0 | tee $LFS/logs/608-findutils-4.10.0.log
#read Wait
build gawk-5.3.2.tar.xz gawk-5.3.2 609-gawk-5.3.2 | tee $LFS/logs/609-gawk-5.3.2.log
#read Wait
build grep-3.12.tar.xz grep-3.12 610-grep-3.12 | tee $LFS/logs/610-grep-3.12.log
#read Wait
build gzip-1.14.tar.xz gzip-1.14 611-gzip-1.14 | tee $LFS/logs/611-gzip-1.14.log
#read Wait
build make-4.4.1.tar.gz make-4.4.1 612-make-4.4.1 | tee $LFS/logs/612-make-4.4.1.log
#read Wait
build patch-2.8.tar.xz patch-2.8 613-patch-2.8 | tee $LFS/logs/613-patch-2.8.log
#read Wait
build sed-4.9.tar.xz sed-4.9 614-sed-4.9 | tee $LFS/logs/614-sed-4.9.log
#read Wait
build tar-1.35.tar.xz tar-1.35 615-tar-1.35 | tee $LFS/logs/615-tar-1.35.log
#read Wait
build xz-5.8.2.tar.xz xz-5.8.2 616-xz-5.8.2 | tee $LFS/logs/616-xz-5.8.2.log
#read Wait
build binutils-2.46.0.tar.xz binutils-2.46.0 617-binutils-2.46.0-pass2 | tee $LFS/logs/617-binutils-2.46.0-pass2.log
#read Wait
build gcc-15.2.0.tar.xz gcc-15.2.0 618-gcc-15.2.0-pass2 | tee $LFS/logs/618-gcc-15.2.0-pass2.log
#read Wait
