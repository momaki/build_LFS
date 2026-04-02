#!/bin/bash

#===================================================
# 7.13. Cleaning up and Saving the Temporary System
#

#------------------
# 7.13.1. Cleaning
#

rm -rf /usr/share/{info,man,doc}/*

find /usr/{lib,libexec} -name \*.la -delete

rm -rf /tools

#----------------
# 7.13.2. Backup
#

#exit

#mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm
#umount $LFS/dev/pts
#umount $LFS/{sys,proc,run,dev}

#cd $LFS
#tar -cJpf $HOME/lfs-temp-tools-r13.0-systemd.tar.xz .

#-----------------
# 7.13.3. Restore
#

#cd $LFS
#rm -rf ./*
#tar -xpf $HOME/lfs-temp-tools-r13.0-systemd.tar.xz

#============================================
# 7.3. Preparing Virtual Kernel File Systems
#

#-------------------------------------
# 7.3.1. Mounting and Populating /dev
#

#mount -v --bind /dev $LFS/dev

#---------------------------------------------
# 7.3.2. Mounting Virtual Kernel File Systems
#

#mount -vt devpts devpts -o gid=5,mode=0620 $LFS/dev/pts
#mount -vt proc proc $LFS/proc
#mount -vt sysfs sysfs $LFS/sys
#mount -vt tmpfs tmpfs $LFS/run

#if [ -h $LFS/dev/shm ]; then
#  install -v -d -m 1777 $LFS$(realpath /dev/shm)
#else
#  mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
#fi

#======================================
# 7.4. Entering the Chroot Environment
#

#chroot "$LFS" /usr/bin/env -i   \
#    HOME=/root                  \
#    TERM="$TERM"                \
#    PS1='(lfs chroot) \u:\w\$ ' \
#    PATH=/usr/bin:/usr/sbin     \
#    MAKEFLAGS="-j$(nproc)"      \
#    TESTSUITEFLAGS="-j$(nproc)" \
#    /bin/bash --login
