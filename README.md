# vagrant-dev
Vagrant files for setting up a development environment. To use this first follow the following steps:
- Install [Virtualbox](https://www.virtualbox.org/)  
- Install [Vagrant](https://www.vagrantup.com/)
- Clone this project
- cd vagrant-dev
- vagrant up
- vagrant ssh
- cd /vagrant
- sh install.sh

This should have a dev environment ready with a copy of [meanjs](http://www.meanjs.org) cloned at /vagarnt/meanjs. You can cd there and say "grunt". This will have a meanjs application running. You can view it at http://localhost:3000.
