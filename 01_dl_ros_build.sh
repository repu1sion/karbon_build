#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[downloading meta-ros build branch] ${NC}"

git clone -b pls_build https://github.com/repu1sion/meta-ros

if [ $? -eq "0" ]; then
        echo -e "${BLUE}[downloaded successfully] ${NC}"
else
        echo -e "${RED}[download failed] ${NC}"
        exit 1
fi

echo -e "${BLUE}[all done] ${NC}"
