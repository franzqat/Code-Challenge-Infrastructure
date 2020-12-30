#!/bin/bash
ROOT_DISK_DEVICE="/dev/sda"
ROOT_DISK_DEVICE_PART="/dev/sda1"

ROOT_FS_SIZE=`df -h / | sed -n 2p | awk '{print $2;}'`

echo "The root file system (/) has a size of $ROOT_FS_SIZE"

echo "> Increasing disk size of $ROOT_DISK_DEVICE to available maximum"

sudo parted $ROOT_DISK_DEVICE ---pretend-input-tty <<EOF
resizepart 1
Yes
42.9GB
EOF
sudo mount -a
sudo xfs_growfs /dev/sda1

ROOT_FS_SIZE=`sudo parted /dev/sda print | sed -n 2p | awk '{print $3;}'`
echo "The root file system (/) has a size of $ROOT_FS_SIZE"
echo ""
ROOT_FS_SIZE=`sudo df -h / | sed -n 2p | awk '{print $2;}'`
echo "The root file system (/) has a size of $ROOT_FS_SIZE"

exit 0