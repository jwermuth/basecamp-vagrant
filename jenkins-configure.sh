#!/bin/bash
echo Running jenkins-configure.sh

GIT_USER=$1
GIT_JENKINS_CONFIGURATION_REPO=$2
EMAIL=$3
REPO_UNDER_CI=$4

# Pull Jenkins configuration from git
sudo su jenkins
cd /var/lib/jenkins

echo Setting environment var pointing to the repository under Continuous Integration to [$REPO_UNDER_CI].
if [ ! -f .profile ]
then
	touch .profile
fi

if grep -q REPO_UNDER_CI .profile; then
    echo REPO_UNDER_CI environment variable already present. Doing nothing.
else
    echo REPO_UNDER_CI environment variable not present, adding it to .profile now
    echo '# REPO_UNDER_CI added by jenkins-configure.sh at' `date` >> .profile
    echo REPO_UNDER_CI=$REPO_UNDER_CI >> .profile
fi


echo Jenkins-configure.sh says: In directory `pwd`
if [ ! -d .git ]
then 
	echo There is no git here, so Ill clone jenkins configuration from github
    sudo su - jenkins -c "rm -rf tmp && git clone $GIT_JENKINS_CONFIGURATION_REPO tmp && mv tmp/.git . && rm -rf tmp && git reset --hard"
    git config user.email $EMAIL
    git config user.name $GIT_USER

	echo Jenkins-configure.sh says: Attempting to restart Jenkins
    sudo service jenkins restart
else 
	echo There is a .git in jenkins, so Ill update it
	git pull origin master
fi



