#!/bin/sh

read DEV
wipfs --all $DEV
lsblk
echo "DONE"
