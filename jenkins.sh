#!/bin/bash

#wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
#sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
#sudo apt-get update
#sudo apt-get -y install jenkins

# Pull Jenkins configuration from git
sudo su jenkins
cd /var/lib/jenkins
echo In directory `pwd`
sudo su - jenkins -c "rm -rf tmp && git clone https://github.com/jwermuth/basecamp-jenkins.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard"
