#!/bin/bash
# Ubuntu 18.04.03 LTS

RED='\033[0;33m'
NC='\033[0m'

echo "${RED}Updating Operting System${NC}"

apt-get update

echo "${RED}Upgrating Operating System${NC}"

apt-get -y upgrade

echo "${RED}Install Dependencies${NC}"

sudo apt install docker.io docker-compose -y

echo "${RED}Installing PHP And Modules${NC}"

apt-get install software-properties-common -y
apt-get install python-software-properties -y
apt-get install unzip zip -y
apt-get install php 
apt-get install composer -y