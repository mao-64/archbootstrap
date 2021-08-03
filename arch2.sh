#!/bin/sh

echo "this is arch2.sh you are chrooted"
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8  " > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

read PCNAME
echo $PCNAME > /etc/hostname

passwd

pacman -S grub networkManager vim

DRIVE=$(cat /tmp/archD)

grub-install --target=i386-pc $DRIVE
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager.service
