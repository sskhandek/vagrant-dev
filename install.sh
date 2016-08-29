#!/bin/bash

username="vagrant"

if [ "$#" -gt 0 ]
then
    username=$1
fi

echo "Running script with username: $username"

#this file installs all required software on our VM
red='\033[0;31m'
NC='\033[0m' # No Color

echo "${red}Updating apt-get ...${NC}"
sudo apt-get update
echo "${red}Installing Git ...${NC}"
sudo apt-get install -y git
echo "${red}Installing other utilities ...${NC}"
sudo apt-get install build-essential -y
sudo apt-get install python libssl-dev -y
sudo apt-get install python-software-properties -y
sudo apt-add-repository -y ppa:chris-lea/node.js
sudo apt-get -y update
sudo apt-get -y install curl git-core 

#install node and npm using NVM
# use directions found here : just replace with latest versions
#http://www.wenincode.com/installing-node-jsnpm-without-sudo/
echo "${red}Installing Node and NVM ...${NC}"
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash
export NVM_DIR="/home/$username/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 0.10.32
echo "nvm use 0.10" >> ~/.profile

#Install Gulp
echo "${red}Installing Gulp ...${NC}"
npm install -g gulp

#install and run MONGO
#from http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
echo "${red}Installing MongoDB ...${NC}"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

echo "${red}Installation Process Complete. You should do \"source ~/.profile\" before you proceed any further ${NC}."


