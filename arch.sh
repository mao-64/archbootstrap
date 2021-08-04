#!/bin/sh

#timedatectl set-ntp true
lsblk
echo "select drive"
echo "p1 = boot\np2 = swap\np3 = root\np4 = home"
read DRIVE
fdisk $DRIVE

mkfs.ext4 $DRIVE"1"
mkfs.ext4 $DRIVE"3"
mkfs.ext4 $DRIVE"4"

mount $DRIVE"3" /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount $DRIVE"1" /mnt/boot
mount $DRIVE"4" /mnt/home

pacstrap /mnt base base-devel linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

cp arch2.sh /mnt/arch2.sh

touch /mnt/tmp/archD
echo $DRIVE > /mnt/tmp/archD

arch-chroot /mnt
