#!/bin/bash

#=================================
# 4.4. Setting Up the Environment
#

[ ! -e /etc/bash.bashrc.NOUSE ] || mv -v /etc/bash.bashrc.NOUSE /etc/bash.bashrc

#####################################################################
# Chapter 7. Entering Chroot and Building Additional Temporary Tools
#

#=========================
# 7.2. Changing Ownership
#

#chown --from lfs -R root:root $LFS/{usr,var,etc,tools}
#case $(uname -m) in
#  x86_64) chown --from lfs -R root:root $LFS/lib64 ;;
#esac
chown --from lfs -R root:root $LFS/*
chown --from lfs root:root $LFS

userdel -r lfs

#============================================
# 7.3. Preparing Virtual Kernel File Systems
#

mkdir -pv $LFS/{dev,proc,sys,run}

#-------------------------------------
# 7.3.1. Mounting and Populating /dev
#

mount -v --bind /dev $LFS/dev

#---------------------------------------------
# 7.3.2. Mounting Virtual Kernel File Systems
#

mount -vt devpts devpts -o gid=5,mode=0620 $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
  install -v -d -m 1777 $LFS$(realpath /dev/shm)
else
  mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi

#======================================
# 7.4. Entering the Chroot Environment
#

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j$(nproc)"      \
    TESTSUITEFLAGS="-j$(nproc)" \
    /bin/bash --login
