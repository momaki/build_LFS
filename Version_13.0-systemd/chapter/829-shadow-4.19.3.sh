#!/bin/bash

#--------------------------------
# 8.29.1. Installation of Shadow
#

sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD YESCRYPT:' \
    -e 's:/var/spool/mail:/var/mail:'                   \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                  \
    -i etc/login.defs

touch /usr/bin/passwd
./configure --sysconfdir=/etc   \
            --disable-static    \
            --with-{b,yes}crypt \
            --without-libbsd    \
            --disable-logind    \
            --with-group-name-max-length=32

make

make exec_prefix=/usr install
make -C man install-man

#----------------------------
# 8.29.2. Configuring Shadow
#

pwconv

grpconv

mkdir -p /etc/default
useradd -D --gid 999

#sed -i '/MAIL/s/yes/no/' /etc/default/useradd

#-----------------------------------
# 8.29.3. Setting the Root Password
#

#passwd root
