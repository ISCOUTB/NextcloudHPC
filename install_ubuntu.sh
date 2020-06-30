#!/bin/bash
# Ubuntu 18.04.03 LTS
echo "Updating Operting System"
apt-get update
echo "Upgrating Operating System"
apt-get -y upgrade
echo "Install Dependencies"
sudo apt install docker.io docker-compose -y
echo "Installing PHP And Modules"
apt-get install software-properties-common -y
apt-get install python-software-properties -y
apt-get install unzip zip -y
apt-get install php php-mbstring php-xml -y
apt-get remove apache2 -y
apt-get install composer -y
apt-get autoremove -y