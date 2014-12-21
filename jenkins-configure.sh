#!/bin/bash

GIT_USER=$1
GIT_REPO=$2
EMAIL=$3

# Pull Jenkins configuration from git
sudo su jenkins
cd /var/lib/jenkins
echo Jenkins-configure.sh says: In directory `pwd`
if [ ! -f .git ]
then 
    sudo su - jenkins -c "rm -rf tmp && git clone $GIT_REPO tmp && mv tmp/.git . && rm -rf tmp && git reset --hard"
    git config user.email $EMAIL
    git config user.name $GIT_USER

	echo Jenkins-configure.sh says: Attempting to restart Jenkins
    sudo service jenkins restart
fi



