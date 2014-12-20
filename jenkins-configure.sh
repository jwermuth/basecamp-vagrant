#!/bin/bash

# Pull Jenkins configuration from git
sudo su jenkins
cd /var/lib/jenkins
echo Jenkins-configure.sh says: In directory `pwd`
if [ ! -f .git ]
then 
    sudo su - jenkins -c "rm -rf tmp && git clone https://github.com/jwermuth/basecamp-jenkins.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard"
    git config user.email "jwermuth@gmail.com"
    git config user.name "jwermuth"

	echo Jenkins-configure.sh says: Attempting to restart Jenkins
    sudo service jenkins restart
fi



