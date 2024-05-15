#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

NEED_SWAP=0

if [ ! -e /swapfile ]; then
	NEED_SWAP=1
else
	SIZE=`du -m /swapfile | cut -f1`
	echo "swap size is :" $SIZE "Mb"
	if [ $SIZE -lt 16000 ]; then
		NEED_SWAP=1
	else
		echo "checking is swap mounted"
		sudo swapon --show | grep swapfile
		if [ $? -eq "1" ]; then
			echo "mounting swap"
			sudo swapon /swapfile
		fi
	fi
fi

if [ $NEED_SWAP -eq 1 ]; then
	echo -e "${BLUE}[creating swap] ${NC}"
	sudo swapoff -a
	sudo fallocate -l 16G /swapfile
	sudo chmod 600 /swapfile
	sudo mkswap /swapfile
	sudo swapon /swapfile
	sudo swapon --show
else
	echo -e "${BLUE}[swap is ok!] ${NC}"
fi


