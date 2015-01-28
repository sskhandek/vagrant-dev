#!/bin/bash

#this file installs all required software on our VM
red='\033[0;31m'
NC='\033[0m' # No Color

echo "${red}Updating apt-get ...${NC}"
sudo apt-get update
echo "${red}Installing Apache ...${NC}"
sudo apt-get install -y apache2
sudo rm -rf /var/www/html
sudo ln -fs /vagrant /var/www/html
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
export NVM_DIR="/home/vagrant/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 0.10.32
echo "${red}nvm use 0.10" >> ~/.profile

echo "${red}Installing Bower ...${NC}"
npm install -g bower
echo "${red}Installing Grunt ...${NC}"
npm install -g grunt-cli
echo "${red}Installing Yeoman ...${NC}"
npm install -g yo
echo "${red}Installing Gulp ...${NC}"
npm install -g gulp

#install and run MONGO
#from http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
echo "${red}Installing MongoDB ...${NC}"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo '${red}deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

#update your ruby using rbenvs 
echo "${red}Updating Ruby using rbenvs ...${NC}"
# curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
# #sudo echo '${red}export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# #sudo echo '${red}eval "$(rbenv init -)"' >> ~/.bashrc
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# rbenv bootstrap-ubuntu-12-04
# #http://tarashish.com/blog/2013/02/02/fixing-mkmf-load-error-ubuntu/
# sudo apt-get install ruby1.9.1-dev -y
# rbenv install 2.1.0
# rbenv global 2.1.0
# rbenv rehash
# sudo echo "${red}gem: --no-ri --no-rdoc" > ~/.gemrc
# ruby -v
curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
sudo echo port PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
sudo echo al "$(rbenv init -)"' >> ~/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv bootstrap-ubuntu-12-04
#http://tarashish.com/blog/2013/02/02/fixing-mkmf-load-error-ubuntu/
sudo apt-get install ruby1.9.1-dev -y
rbenv install 2.1.0
rbenv global 2.1.0
rbenv rehash
sudo echo "gem: --no-ri --no-rdoc" > ~/.gemrc
ruby -v

#install tools globally for front-end development
echo "${red}Installing Front End Development Tools ...${NC}"
gem update --system
sudo gem install bundler
sudo gem install foundation
sudo gem install compass

install MEAN stack via git
echo "${red}Installing meanjs ...${NC}"
cd /vagrant
git clone https://github.com/meanjs/mean.git meanjs
cd meanjs
npm install
echo "${red}You can run the meanjs application by typing \"grunt\". You can view it by going to http://localhost:3000${NC}"
# grunt

#for serving static sites from /vagrant using apache
#sudo chmod -R 755 /vagrant
#sudo service apache2 restart




