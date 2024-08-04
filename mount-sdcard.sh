#!/bin/bash
set -e

function is_mounted () {
    findmnt "$1" > /dev/null
    return
}

if [[ "$#" != 2 ]]; then
    echo "Usage: $0 <device> <path/to/sdcard/mnt>"
    exit 1
fi

dev=$1
mnt=$2

boot=$mnt/boot
root=$mnt/root

mkdir -p $boot
mkdir -p $root

if is_mounted $boot; then
    echo "sdcard boot partition already mounted."
else
    mount -t vfat ${dev}1 $boot || { echo 'Error mounting $boot.'; exit 1; }
    echo "$boot mounted."
fi

if is_mounted $root; then
    echo "sdcard root partition already mounted."
else
    mount ${dev}2 $root || { echo 'Error mounting $root.'; exit 1; }
    echo "$root mounted."
fi
