#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

if [ ! $# -eq 1 ]; then
        echo -e "${RED}usage: 03_flash [diskname] ${NC}"
        exit 1
fi

DISKNAME=$1
echo -e "${BLUE}[Disk to flash : $DISKNAME] ${NC}"

echo -e "${BLUE}[flashing]${NC}"
cd build/tmp-glibc/deploy/images/intel-corei7-64/
sudo umount /dev/${DISKNAME}?*
if [ -e ros-image-core-humble-intel-corei7-64.wic ]; then
	sudo dd if=ros-image-core-humble-intel-corei7-64.wic of=/dev/${DISKNAME} status=progress
	sudo sync
else
        echo -e "${RED}[no image found!]${NC}"
	exit 1
fi
sleep 3

echo -e "${BLUE}[Done] ${NC}"
