#!/bin/sh

read DEV
umount /dev/sda1
umount /dev/sda2
umount /dev/sda4
umount /dev/sda3
wipefs --all $DEV
lsblk
echo "DONE"
