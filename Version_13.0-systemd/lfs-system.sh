#!/bin/bash
# LFS Build Script
# Builds the basic system software from chapter 8

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

build man-pages-6.17.tar.xz man-pages-6.17 803-man-pages-6.17 | tee /logs/803-man-pages-6.17.log
#read Wait
build iana-etc-20260202.tar.gz iana-etc-20260202 804-iana-etc-20260202 | tee /logs/804-iana-etc-20260202.log
#read Wait
build glibc-2.43.tar.xz glibc-2.43 805-glibc-2.43 | tee /logs/805-glibc-2.43.log
#read Wait
build zlib-1.3.2.tar.gz zlib-1.3.2 806-zlib-1.3.2 | tee /logs/806-zlib-1.3.2.log
#read Wait
build bzip2-1.0.8.tar.gz bzip2-1.0.8 807-bzip2-1.0.8 | tee /logs/807-bzip2-1.0.8.log
#read Wait
build xz-5.8.2.tar.xz xz-5.8.2 808-xz-5.8.2 | tee /logs/808-xz-5.8.2.log
#read Wait
build lz4-1.10.0.tar.gz lz4-1.10.0 809-lz4-1.10.0 | tee /logs/809-lz4-1.10.0.log
#read Wait
build zstd-1.5.7.tar.gz zstd-1.5.7 810-zstd-1.5.7 | tee /logs/810-zstd-1.5.7.log
#read Wait
build file-5.46.tar.gz file-5.46 811-file-5.46 | tee /logs/811-file-5.46.log
#read Wait
build readline-8.3.tar.gz readline-8.3 812-readline-8.3 | tee /logs/812-readline-8.3.log
#read Wait
build pcre2-10.47.tar.bz2 pcre2-10.47 813-pcre2-10.47 | tee /logs/813-pcre2-10.47.log
#read Wait
build m4-1.4.21.tar.xz m4-1.4.21 814-m4-1.4.21 | tee /logs/814-m4-1.4.21.log
#read Wait
build bc-7.0.3.tar.xz bc-7.0.3 815-bc-7.0.3 | tee /logs/815-bc-7.0.3.log
#read Wait
build flex-2.6.4.tar.gz flex-2.6.4 816-flex-2.6.4 | tee /logs/816-flex-2.6.4.log
#read Wait
build tcl8.6.17-src.tar.gz tcl8.6.17 817-tcl-8.6.17 | tee /logs/817-tcl-8.6.17.log
#read Wait
build expect5.45.4.tar.gz expect5.45.4 818-expect-5.45.4 | tee /logs/818-expect-5.45.4.log
#read Wait
build dejagnu-1.6.3.tar.gz dejagnu-1.6.3 819-dejagnu-1.6.3 | tee /logs/819-dejagnu-1.6.3.log
#read Wait
build pkgconf-2.5.1.tar.xz pkgconf-2.5.1 820-pkgconf-2.5.1 | tee /logs/820-pkgconf-2.5.1.log
#read Wait
build binutils-2.46.0.tar.xz binutils-2.46.0 821-binutils-2.46.0 | tee /logs/821-binutils-2.46.0.log
#read Wait
build gmp-6.3.0.tar.xz gmp-6.3.0 822-gmp-6.3.0 | tee /logs/822-gmp-6.3.0.log
#read Wait
build mpfr-4.2.2.tar.xz mpfr-4.2.2 823-mpfr-4.2.2 | tee /logs/823-mpfr-4.2.2.log
#read Wait
build mpc-1.3.1.tar.gz mpc-1.3.1 824-mpc-1.3.1 | tee /logs/824-mpc-1.3.1.log
#read Wait
build attr-2.5.2.tar.gz attr-2.5.2 825-attr-2.5.2 | tee /logs/825-attr-2.5.2.log
#read Wait
build acl-2.3.2.tar.xz acl-2.3.2 826-acl-2.3.2 | tee /logs/826-acl-2.3.2.log
#read Wait
build libcap-2.77.tar.xz libcap-2.77 827-libcap-2.77 | tee /logs/827-libcap-2.77.log
#read Wait
build libxcrypt-4.5.2.tar.xz libxcrypt-4.5.2 828-libxcrypt-4.5.2 | tee /logs/828-libxcrypt-4.5.2.log
#read Wait
build shadow-4.19.3.tar.xz shadow-4.19.3 829-shadow-4.19.3 | tee /logs/829-shadow-4.19.3.log
#read Wait
build gcc-15.2.0.tar.xz gcc-15.2.0 830-gcc-15.2.0 | tee /logs/830-gcc-15.2.0.log
#read Wait
build ncurses-6.6.tar.gz ncurses-6.6 831-ncurses-6.6 | tee /logs/831-ncurses-6.6.log
#read Wait
build sed-4.9.tar.xz sed-4.9 832-sed-4.9 | tee /logs/832-sed-4.9.log
#read Wait
build psmisc-23.7.tar.xz psmisc-23.7 833-psmisc-23.7 | tee /logs/833-psmisc-23.7.log
#read Wait
build gettext-1.0.tar.xz gettext-1.0 834-gettext-1.0 | tee /logs/834-gettext-1.0.log
#read Wait
build bison-3.8.2.tar.xz bison-3.8.2 835-bison-3.8.2 | tee /logs/835-bison-3.8.2.log
#read Wait
build grep-3.12.tar.xz grep-3.12 836-grep-3.12 | tee /logs/836-grep-3.12.log
#read Wait
build bash-5.3.tar.gz bash-5.3 837-bash-5.3 | tee /logs/837-bash-5.3.log
#read Wait
build libtool-2.5.4.tar.xz libtool-2.5.4 838-libtool-2.5.4 | tee /logs/838-libtool-2.5.4.log
#read Wait
build gdbm-1.26.tar.gz gdbm-1.26 839-gdbm-1.26 | tee /logs/839-gdbm-1.26.log
#read Wait
build gperf-3.3.tar.gz gperf-3.3 840-gperf-3.3 | tee /logs/840-gperf-3.3.log
#read Wait
build expat-2.7.4.tar.xz expat-2.7.4 841-expat-2.7.4 | tee /logs/841-expat-2.7.4.log
#read Wait
build inetutils-2.7.tar.gz inetutils-2.7 842-inetutils-2.7 | tee /logs/842-inetutils-2.7.log
#read Wait
build less-692.tar.gz less-692 843-less-692 | tee /logs/843-less-692.log
#read Wait
build perl-5.42.0.tar.xz perl-5.42.0 844-perl-5.42.0 | tee /logs/844-perl-5.42.0.log
#read Wait
build XML-Parser-2.47.tar.gz XML-Parser-2.47 845-xml-parser-2.47 | tee /logs/845-xml-parser-2.47.log
#read Wait
build intltool-0.51.0.tar.gz intltool-0.51.0 846-intltool-0.51.0 | tee /logs/846-intltool-0.51.0.log
#read Wait
build autoconf-2.72.tar.xz autoconf-2.72 847-autoconf-2.72 | tee /logs/847-autoconf-2.72.log
#read Wait
build automake-1.18.1.tar.xz automake-1.18.1 848-automake-1.18.1 | tee /logs/848-automake-1.18.1.log
#read Wait
build openssl-3.6.1.tar.gz openssl-3.6.1 849-openssl-3.6.1 | tee /logs/849-openssl-3.6.1.log
#read Wait
build elfutils-0.194.tar.bz2 elfutils-0.194 850-libelf-0.194 | tee /logs/850-libelf-0.194.log
#read Wait
build libffi-3.5.2.tar.gz libffi-3.5.2 851-libffi-3.5.2 | tee /logs/851-libffi-3.5.2.log
#read Wait
build sqlite-autoconf-3510200.tar.gz sqlite-autoconf-3510200 852-sqlite-3510200 | tee /logs/852-sqlite-3510200.log
#read Wait
build Python-3.14.3.tar.xz Python-3.14.3 853-python-3.14.3 | tee /logs/853-python-3.14.3.log
#read Wait
build flit_core-3.12.0.tar.gz flit_core-3.12.0 854-flit-core-3.12.0 | tee /logs/854-flit-core-3.12.0.log
#read Wait
build packaging-26.0.tar.gz packaging-26.0 855-packaging-26.0 | tee /logs/855-packaging-26.0.log
#read Wait
build wheel-0.46.3.tar.gz wheel-0.46.3 856-wheel-0.46.3 | tee /logs/856-wheel-0.46.3.log
#read Wait
build setuptools-82.0.0.tar.gz setuptools-82.0.0 857-setuptools-82.0.0 | tee /logs/857-setuptools-82.0.0.log
#read Wait
build ninja-1.13.2.tar.gz ninja-1.13.2 858-ninja-1.13.2 | tee /logs/858-ninja-1.13.2.log
#read Wait
build meson-1.10.1.tar.gz meson-1.10.1 859-meson-1.10.1 | tee /logs/859-meson-1.10.1.log
#read Wait
build kmod-34.2.tar.xz kmod-34.2 860-kmod-34.2 | tee /logs/860-kmod-34.2.log
#read Wait
build coreutils-9.10.tar.xz coreutils-9.10 861-coreutils-9.10 | tee /logs/861-coreutils-9.10.log
#read Wait
build diffutils-3.12.tar.xz diffutils-3.12 862-diffutils-3.12 | tee /logs/862-diffutils-3.12.log
#read Wait
build gawk-5.3.2.tar.xz gawk-5.3.2 863-gawk-5.3.2 | tee /logs/863-gawk-5.3.2.log
#read Wait
build findutils-4.10.0.tar.xz findutils-4.10.0 864-findutils-4.10.0 | tee /logs/864-findutils-4.10.0.log
#read Wait
build groff-1.23.0.tar.gz groff-1.23.0 865-groff-1.23.0 | tee /logs/865-groff-1.23.0.log
#read Wait
build grub-2.14.tar.xz grub-2.14 866-grub-2.14 | tee /logs/866-grub-2.14.log
#read Wait
build gzip-1.14.tar.xz gzip-1.14 867-gzip-1.14 | tee /logs/867-gzip-1.14.log
#read Wait
build iproute2-6.18.0.tar.xz iproute2-6.18.0 868-iproute2-6.18.0 | tee /logs/868-iproute2-6.18.0.log
#read Wait
build kbd-2.9.0.tar.xz kbd-2.9.0 869-kbd-2.9.0 | tee /logs/869-kbd-2.9.0.log
#read Wait
build libpipeline-1.5.8.tar.gz libpipeline-1.5.8 870-libpipeline-1.5.8 | tee /logs/870-libpipeline-1.5.8.log
#read Wait
build make-4.4.1.tar.gz make-4.4.1 871-make-4.4.1 | tee /logs/871-make-4.4.1.log
#read Wait
build patch-2.8.tar.xz patch-2.8 872-patch-2.8 | tee /logs/872-patch-2.8.log
#read Wait
build tar-1.35.tar.xz tar-1.35 873-tar-1.35 | tee /logs/873-tar-1.35.log
#read Wait
build texinfo-7.2.tar.xz texinfo-7.2 874-texinfo-7.2 | tee /logs/874-texinfo-7.2.log
#read Wait
build vim-9.2.0078.tar.gz vim-9.2.0078 875-vim-9.2.0078 | tee /logs/875-vim-9.2.0078.log
#read Wait
build markupsafe-3.0.3.tar.gz markupsafe-3.0.3 876-markupsafe-3.0.3 | tee /logs/876-markupsafe-3.0.3.log
#read Wait
build jinja2-3.1.6.tar.gz jinja2-3.1.6 877-jinja2-3.1.6 | tee /logs/877-jinja2-3.1.6.log
#read Wait
build systemd-259.1.tar.gz systemd-259.1 878-systemd-259.1 | tee /logs/878-systemd-259.1.log
#read Wait
build dbus-1.16.2.tar.xz dbus-1.16.2 879-d-bus-1.16.2 | tee /logs/879-d-bus-1.16.2.log
#read Wait
build man-db-2.13.1.tar.xz man-db-2.13.1 880-man-db-2.13.1 | tee /logs/880-man-db-2.13.1.log
#read Wait
build procps-ng-4.0.6.tar.xz procps-ng-4.0.6 881-procps-ng-4.0.6 | tee /logs/881-procps-ng-4.0.6.log
#read Wait
build util-linux-2.41.3.tar.xz util-linux-2.41.3 882-util-linux-2.41.3 | tee /logs/882-util-linux-2.41.3.log
#read Wait
build e2fsprogs-1.47.3.tar.gz e2fsprogs-1.47.3 883-e2fsprogs-1.47.3 | tee /logs/883-e2fsprogs-1.47.3.log
#read Wait
