#!/bin/bash
# LFS Build Script
# Final steps to configure the system

function build() {
  echo "[lfs-scripts] Starting build of $3 at $(date)"

  tar xf "$1"

  pushd "$2"
    source /chapter/"$3".sh
  popd

  rm -rf "$2"

  echo "[lfs-scripts] Finishing build of $3 at $(date)"
}

##################################
# Chapter 9. System Configuration
#

#====================================
# 9.2. General Network Configuration
#

#----------------------------------------------
# 9.2.1. Network Interface Configuration Files
#

#systemctl disable systemd-networkd-wait-online

#
# 9.2.1.1. Network Device Naming
#

ln -s /dev/null /etc/systemd/network/99-default.link

#cat > /etc/systemd/network/10-ether0.link << "EOF"
#[Match]
## Change the MAC address as appropriate for your network device
#MACAddress=12:34:45:78:90:AB
#
#[Link]
#Name=ether0
#EOF
cat > /etc/systemd/network/10-eth0.link << "EOF"
[Match]
MACAddress=<12:34:45:78:90:AB>

[Link]
Name=eth0
EOF

#
# 9.2.1.2. Static IP Configuration
#

#cat > /etc/systemd/network/10-eth-static.network << "EOF"
#[Match]
#Name=<network-device-name>
#
#[Network]
#Address=192.168.0.2/24
#Gateway=192.168.0.1
#DNS=192.168.0.1
#Domains=<Your Domain Name>
#EOF
cat > /etc/systemd/network/10-eth0-static.network << "EOF"
[Match]
Name=eth0

[Network]
Address=10.0.2.15/24
Gateway=10.0.2.2
EOF

#
# 9.2.1.3. DHCP Configuration
#

#cat > /etc/systemd/network/10-eth-dhcp.network << "EOF"
#[Match]
#Name=<network-device-name>
#
#[Network]
#DHCP=ipv4
#
#[DHCPv4]
#UseDomains=true
#EOF

#-------------------------------------------
# 9.2.2. Creating the /etc/resolv.conf File
#

#
# 9.2.2.1. systemd-resolved Configuration
#

#systemctl disable systemd-resolved

#
# 9.2.2.2. Static resolv.conf Configuration
#

#cat > /etc/resolv.conf << "EOF"
## Begin /etc/resolv.conf
#
#domain <Your Domain Name>
#nameserver <IP address of your primary nameserver>
#nameserver <IP address of your secondary nameserver>
#
## End /etc/resolv.conf
#EOF
cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

nameserver 8.8.8.8
nameserver 8.8.4.4

# End /etc/resolv.conf
EOF

#+---------------------------------------
# 9.2.3. Configuring the system hostname
#

#echo "<lfs>" > /etc/hostname
echo "lfs" > /etc/hostname

#----------------------------------------
# 9.2.4. Customizing the /etc/hosts File
#

#cat > /etc/hosts << "EOF"
## Begin /etc/hosts
#
#<192.168.0.2> <FQDN> [alias1] [alias2] ...
#::1       ip6-localhost ip6-loopback
#ff02::1   ip6-allnodes
#ff02::2   ip6-allrouters
#
## End /etc/hosts
#EOF
cat > /etc/hosts << "EOF"
# Begin /etc/hosts

::1       ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF

#=============================================
# 9.3. Overview of Device and Module Handling
#

#-----------------------------------------------------------
# 9.3.3. Problems with Loading Modules and Creating Devices
#

#
# 9.3.3.2. A Kernel Module Is Not Loaded Automatically, and Udev Is Not Intended to Load It
#

#echo "softdep snd-pcm post: snd-pcm-oss" >> /etc/modprobe.d/<filename>.conf


#
# 9.3.3.3. Udev Loads Some Unwanted Module
#

#blacklist forte

#=======================
# 9.4. Managing Devices
#

#---------------------------------------
# 9.4.1. Dealing with Duplicate Devices
#

#udevadm info -a -p /sys/class/video4linux/video0

#cat > /etc/udev/rules.d/83-duplicate_devs.rules << "EOF"
#
## Persistent symlinks for webcam and tuner
#KERNEL=="video*", ATTRS{idProduct}=="1910", ATTRS{idVendor}=="0d81", SYMLINK+="webcam"
#KERNEL=="video*", ATTRS{device}=="0x036f",  ATTRS{vendor}=="0x109e", SYMLINK+="tvtuner"
#
#EOF

#===================================
# 9.5. Configuring the system clock
#

cat > /etc/adjtime << "EOF"
0.0 0 0.0
0
LOCAL
EOF

#timedatectl set-local-rtc 1

#timedatectl set-time YYYY-MM-DD HH:MM:SS

#timedatectl set-timezone TIMEZONE

#timedatectl list-timezones

#-------------------------------------
# 9.5.1. Network Time Synchronization
#

#systemctl disable systemd-timesyncd

cat > /etc/systemd/timesyncd.conf << "EOF"
[Time]
NTP=ntp.nict.jp
FallbackNTP=0.jp.pool.ntp.org 1.jp.pool.ntp.org 2.jp.pool.ntp.org 3.jp.pool.ntp.org
EOF

#====================================
# 9.6. Configuring the Linux Console
#

#echo "FONT=Lat2-Terminus16" > /etc/vconsole.conf

#cat > /etc/vconsole.conf << "EOF"
#KEYMAP=de-latin1
#FONT=Lat2-Terminus16
#EOF
cat > /etc/vconsole.conf << "EOF"
KEYMAP=jp106
FONT=Lat2-Terminus16
EOF

#localectl set-keymap MAP

#localectl set-x11-keymap LAYOUT [MODEL] [VARIANT] [OPTIONS]

#====================================
# 9.7. Configuring the System Locale
#

#locale -a

#LC_ALL=<locale name> locale language
#LC_ALL=<locale name> locale charmap
#LC_ALL=<locale name> locale int_curr_symbol
#LC_ALL=<locale name> locale int_prefix

#cat > /etc/locale.conf << "EOF"
#LANG=<ll>_<CC>.<charmap><@modifiers>
#EOF
cat > /etc/locale.conf << "EOF"
LANG=ja_JP.UTF-8
EOF

cat > /etc/profile << "EOF"
# Begin /etc/profile

for i in $(locale); do
  unset ${i%=*}
done

if [[ "$TERM" = linux ]]; then
  export LANG=C.UTF-8
else
  source /etc/locale.conf

  for i in $(locale); do
    key=${i%=*}
    if [[ -v $key ]]; then
      export $key
    fi
  done
fi

# End /etc/profile
EOF

#localectl set-locale LANG="<ll>_<CC>.<charmap><@modifiers>"

#localectl set-locale LANG="en_US.UTF-8" LC_CTYPE="en_US"

#=====================================
# 9.8. Creating the /etc/inputrc File
#

cat > /etc/inputrc << "EOF"
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>

# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8-bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF

#====================================
# 9.9. Creating the /etc/shells File
#

cat > /etc/shells << "EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF

#=======================================
# 9.10. Systemd Usage and Configuration
#

#------------------------------------------------
# 9.10.2. Disabling Screen Clearing at Boot Time
#

#mkdir -pv /etc/systemd/system/getty@tty1.service.d

#cat > /etc/systemd/system/getty@tty1.service.d/noclear.conf << EOF
#[Service]
#TTYVTDisallocate=no
#EOF

#journalctl -b

#----------------------------------
# 9.10.3. Disabling tmpfs for /tmp
#

#ln -sfv /dev/null /etc/systemd/system/tmp.mount

#----------------------------------------------------------
# 9.10.4. Configuring Automatic File Creation and Deletion
#

#mkdir -p /etc/tmpfiles.d
#cp /usr/lib/tmpfiles.d/tmp.conf /etc/tmpfiles.d

#----------------------------------------------
# 9.10.5. Overriding Default Services Behavior
#

#mkdir -pv /etc/systemd/system/foobar.service.d

#cat > /etc/systemd/system/foobar.service.d/foobar.conf << EOF
#[Service]
#Restart=always
#RestartSec=30
#EOF

#---------------------------------
# 9.10.8. Working with Core Dumps
#

mkdir -pv /etc/systemd/coredump.conf.d

cat > /etc/systemd/coredump.conf.d/maxuse.conf << EOF
[Coredump]
MaxUse=5G
EOF

#############################################
# Chapter 10. Making the LFS System Bootable
#

#====================================
# 10.2. Creating the /etc/fstab File
#

#cat > /etc/fstab << "EOF"
## Begin /etc/fstab
#
## file system  mount-point  type     options             dump  fsck
##                                                              order
#
#/dev/<xxx>     /            <fff>    defaults            1     1
#/dev/<yyy>     /home        <fff>    defaults            0     2
#/dev/<zzz>     swap         swap     pri=1               0     0
#
## End /etc/fstab
#EOF
cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

/dev/<xxx>     /            <fff>    defaults            1     1
/dev/<zzz>     swap         swap     pri=1               0     0

# End /etc/fstab
EOF

cd /sources

#=====================
# 10.3. Linux-6.18.10
#

build linux-6.18.10.tar.xz linux-6.18.10 1003-linux-6.18.10 | tee /logs/1003-linux-6.18.10.log
#read Wait

#=============================================
# 10.4. Using GRUB to Set Up the Boot Process
#

#----------------------
# 10.4.1. Introduction
#

#cd /tmp
#grub-mkrescue --output=grub-img.iso
#xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso

#--------------------------------------
# 10.4.3. Setting Up the Configuration
#

#grub-install /dev/sda
grub-install --target i386-pc /dev/sd<x>

#----------------------------------------------
# 10.4.4. Creating the GRUB Configuration File
#

#cat > /boot/grub/grub.cfg << "EOF"
## Begin /boot/grub/grub.cfg
#set default=0
#set timeout=5
#
#insmod part_gpt
#insmod ext2
#set root=(hd0,2)
#set gfxpayload=1024x768x32
#
#menuentry "GNU/Linux, Linux 6.18.10-lfs-13.0-systemd" {
#        linux   /boot/vmlinuz-6.18.10-lfs-13.0-systemd root=/dev/sda2 ro
#}
#EOF
cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5
set net.ifnames=0

insmod part_gpt
insmod ext2
set root=(hd0,<x>)
set gfxpayload=1024x768x32

menuentry "GNU/Linux, Linux 6.18.10-lfs-13.0-systemd" {
        linux   /boot/vmlinuz-6.18.10-lfs-13.0-systemd root=/dev/sda<x> ro
}
EOF

######################
# Chapter 11. The End
#

#===============
# 11.1. The End
#

echo "13.0-systemd" > /etc/lfs-release

#cat > /etc/lsb-release << "EOF"
#DISTRIB_ID="Linux From Scratch"
#DISTRIB_RELEASE="13.0-systemd"
#DISTRIB_CODENAME="<your name here>"
#DISTRIB_DESCRIPTION="Linux From Scratch"
#EOF
cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="13.0-systemd"
DISTRIB_CODENAME="Linux From Scratch"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

#cat > /etc/os-release << "EOF"
#NAME="Linux From Scratch"
#VERSION="13.0-systemd"
#ID=lfs
#PRETTY_NAME="Linux From Scratch 13.0-systemd"
#VERSION_CODENAME="<your name here>"
#HOME_URL="https://www.linuxfromscratch.org/lfs/"
#RELEASE_TYPE="stable"
#EOF
cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="13.0-systemd"
ID=lfs
PRETTY_NAME="Linux From Scratch 13.0-systemd"
VERSION_CODENAME="Linux From Scratch"
HOME_URL="https://www.linuxfromscratch.org/lfs/"
RELEASE_TYPE="stable"
EOF

mv -v /sources/* /usr/src

rm -r /sources

echo "[lfs-scripts] The end"
