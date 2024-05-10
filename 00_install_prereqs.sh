#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[installing prerequisites] ${NC}"

sudo apt install gawk wget git diffstat unzip gcc-multilib \
        build-essential chrpath socat cpio python3-pip python3-pexpect \
        xz-utils debianutils iputils-ping \
        python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm \
        g++-multilib locales lsb-release python3-distutils time \
        liblz4-tool zstd file python3.8-venv

if [ $? -eq "0" ]; then
        echo -e "${BLUE}[installed successfully] ${NC}"
else
        echo -e "${RED}[installation failed] ${NC}"
        exit 1
fi

echo -e "${BLUE}[generating locale] ${NC}"
sudo locale-gen en_US.utf8

echo -e "${BLUE}[installing kas] ${NC}"
python3 -m venv venv
source venv/bin/activate
pip3 install kas

echo -e "${BLUE}[all done] ${NC}"
