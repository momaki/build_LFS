#!/bin/bash

#######################################
# Chapter 2. Preparing the Host System
#

#==============================================
# 2.5. Creating a File System on the Partition
#

mkfs -v -t ext4 /dev/<xxx>

#mkfs -v -t ext4 /dev/<yyy>

mkswap /dev/<zzz>

#==============================================
# 2.6. Setting the $LFS Variable and the Umask
#

export LFS=/mnt/lfs

umask 022

#=================================
# 2.7. Mounting the New Partition
#

mkdir -pv $LFS
mount -v -t ext4 /dev/<xxx> $LFS

#mkdir -v $LFS/home
#mount -v -t ext4 /dev/<yyy> $LFS/home

chown -Rv root:root $LFS
chmod -Rv 755 $LFS

/sbin/swapon -v /dev/<zzz>

##################################
# Chapter 3. Packages and Patches
#

#===================
# 3.1. Introduction
#

#mkdir -v $LFS/sources
cp -Rv /<location_of_the_package>/sources $LFS

chmod -v a+wt $LFS/sources

#wget --input-file=wget-list-systemd --continue --directory-prefix=$LFS/sources

#pushd $LFS/sources
#  md5sum -c md5sums
#popd

chown -Rv root:root $LFS/sources/*

cp -Rv /<location_of_the_scripts>/scripts/* $LFS

################################
# Chapter 4. Final Preparations
#

#================================================================
# 4.2. Creating a Limited Directory Layout in the LFS Filesystem
#

mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools

mkdir -pv $LFS/logs

#==========================
# 4.3. Adding the LFS User
#

[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

#passwd lfs

#chown -v lfs $LFS/{usr{,/*},var,etc,tools}
#case $(uname -m) in
#  x86_64) chown -v lfs $LFS/lib64 ;;
#esac
chown -Rv lfs $LFS/*
chown -v lfs $LFS

su - lfs
