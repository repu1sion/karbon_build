#!/bin/bash
  
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[build] ${NC}"

python3 -m venv venv
source venv/bin/activate
kas build meta-ros/kas/oeros-kirkstone-humble-intel-corei7-64.yml

