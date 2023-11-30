#!/bin/bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# NOTE: Make sure that you have already installed NVIDIA driver beforehand.
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# Letter colors.
RED='\033[0;31m'
NC='\033[0m' # No Color


# Installation.
echo "Installing Docker ..."
read -p "Enter your password for sudo: " -s password
echo $password | sudo -S apt-get update -y
echo $password | sudo -S apt-get install docker -y

echo -e "${RED}Adding new group 'docker' ...${NC}"
echo $password | sudo -S groupadd docker

echo -e "${RED}Allowing docker to run without password ...${NC}"
echo -e "${RED}Adding $USER in docker group...${NC}"
echo $password | sudo -S usermod -aG docker ${USER}
echo $password | sudo -S systemctl enable docker


# Make GUP(s) on the host PC visible to containers.
echo $password | sudo -S apt-get update -y
echo -e "${RED}Installing nvidia-docker2 ...${NC}"
echo $password | sudo -S apt-get install -y nvidia-docker2
echo $password | sudo -S apt-get install -y nvidia-container-toolkit

echo "Installing nvidia-container-runtime ..."
echo $password | sudo -S apt-get install nvidia-container-runtime -y

echo -e "${RED}Restarting Docker daeomn...${NC}"
echo $password | sudo -S systemctl restart docker



echo -e "${RED} Installation finished. Reboot your PC to make docker work.${NC}"
