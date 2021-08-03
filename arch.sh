#!/bin/sh

#timedatectl set-ntp true
lsblk
echo "select drive"
read DRIVE
fdisk $DRIVE
read MKFSYN
while [ $MKFSYN == "y" ]
do
	echo "MKFSYN"
	read $MKFSYN
	if [ $MKYN == y ]
	then
		echo "PNUM"
		read PNUM
		mkfs.ext4 $PNUM
	else
		exit
	fi
done
