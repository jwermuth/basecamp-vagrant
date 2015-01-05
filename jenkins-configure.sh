#!/bin/bash
echo Running jenkins-configure.sh

GIT_USER=$1
GIT_JENKINS_CONFIGURATION_REPO=$2
EMAIL=$3
REPO_UNDER_CI=$4

# Pull Jenkins configuration from git
sudo su jenkins
cd /var/lib/jenkins

echo Jenkins-configure.sh says: In directory `pwd` preparing to clone Jenkins configuration from github.
if [ ! -d .git ]
then 
	echo There is no git here, so Ill clone jenkins configuration from github
    sudo su - jenkins -c "rm -rf tmp && git clone $GIT_JENKINS_CONFIGURATION_REPO tmp && mv tmp/.git . && rm -rf tmp && git reset --hard"
    sudo su - jenkins -c "git config --global user.email $EMAIL"
    sudo su - jenkins -c "git config --global user.name $GIT_USER"

else 
	echo There is a git controlled jenkins configuration already. It will be updated.
	git pull origin master
fi

echo Jenkins-configure.sh says: Attempting to restart Jenkins
sudo service jenkins restart

