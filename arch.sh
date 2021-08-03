#!/bin/sh

#timedatectl set-ntp true
lsblk
echo "select drive"
read DRIVE
fdisk $DRIVE
while [ $MKFSYN == 0 ]
do
	read MKFSYN
	if [ $MKYN == y ]
	then
		read PNUM
		mkfs.ext4 $PNUM
	else
		exit
	fi
done
