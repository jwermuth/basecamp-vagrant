#!/bin/bash

# Pull Jenkins configuration from git
sudo su jenkins
cd /var/lib/jenkins
echo In directory `pwd`
if [ ! -f .git ]
then 
    sudo su - jenkins -c "rm -rf tmp && git clone https://github.com/jwermuth/basecamp-jenkins.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard"
    sudo service jenkins restart
fi



