#!/bin/sh

read DEV
wipefs --all $DEV
lsblk
echo "DONE"
