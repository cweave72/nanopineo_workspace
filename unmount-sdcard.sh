#!/bin/bash
set -e

if [[ "$#" != 1 ]]; then
    echo "Usage: $0 <path/to/sdcard/mnt>"
    exit 1
fi

mnt=$1

sync
umount $mnt/boot && umount $mnt/root

if [[ "$?" != 0 ]]; then
    echo "Error unmounting sdcard at $mnt".
    exit 1
fi

echo "sdcard unmounted."
