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

echo "root password"
passwd

echo "user name"
read USERNAME
useradd -m G wheel $USER
echo "user password"
passwd $USER

chmod +w /etc/sudoers
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

echo "pacman start"
pacman --noconfirm --needed -Syu grub networkmanager vim neovim xorg-server xorg-xinit git gnu-free-fonts
echo "pacman end"

DRIVE=$(cat archD)

grub-install --target=i386-pc $DRIVE
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager.service

mkdir apps
cd apps

git clone https://github.com/mao-64/dwm
git clone https://github.com/mao-64/st
git clone https://github.com/mao-64/dmenu

cd
cp -r apps /home/$USER/apps

cd /home/$USER/apps/dwm
make install

cd /home/$USER/apps/st
make install

cd /home/$USER/apps/dmenu
make install

chown -R mao /home/$USER/apps
