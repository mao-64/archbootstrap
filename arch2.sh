#!/bin/sh

echo "this is arch2.sh you are chrooted"
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
locale-gen

echo "PC NAME"
read PCNAME
echo $PCNAME >> /etc/hostname

passwd

echo "pacman start"
pacman -Syu grub networkManager vim
echo "pacman end"

DRIVE=$(cat archD)

grub-install --target=i386-pc $DRIVE
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager.service
