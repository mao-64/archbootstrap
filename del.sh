#!/bin/sh

read DEV
wipefs --all $DEV
umount /dev/sda1
umount /dev/sda2
umount /dev/sda4
umount /dev/sda3
lsblk
echo "DONE"
