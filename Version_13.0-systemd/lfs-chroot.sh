#!/bin/bash
# LFS Build Script
# Builds the additional temporary tools from chapter 7

function build() {
  echo "[lfs-scripts] Starting build of $3 at $(date)"

  tar xf "$1"

  pushd "$2"
    source /chapter/"$3".sh
  popd

  rm -rf "$2"

  echo "[lfs-scripts] Finishing build of $3 at $(date)"
}

cd /sources

build gettext-1.0.tar.xz gettext-1.0 707-gettext-1.0 | tee /logs/707-gettext-1.0.log
#read Wait
build bison-3.8.2.tar.xz bison-3.8.2 708-bison-3.8.2 | tee /logs/708-bison-3.8.2.log
#read Wait
build perl-5.42.0.tar.xz perl-5.42.0 709-perl-5.42.0 | tee /logs/709-perl-5.42.0.log
#read Wait
build Python-3.14.3.tar.xz Python-3.14.3 710-python-3.14.3 | tee /logs/710-python-3.14.3.log
#read Wait
build texinfo-7.2.tar.xz texinfo-7.2 711-texinfo-7.2 | tee /logs/711-texinfo-7.2.log
#read Wait
build util-linux-2.41.3.tar.xz util-linux-2.41.3 712-util-linux-2.41.3 | tee /logs/712-util-linux-2.41.3.log
#read Wait
