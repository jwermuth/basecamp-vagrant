#Basecamp-vagrant
![Basecamp](markdown/basecamp.jpg)

This project contains the code behind a demo of vagrant/git/jenkins for IT Basecamp 2015. The image is from IT Basecamp 2014.

The goal is to provide an Out Of the Box solution to create a Continuous Integration environment under revision control on a virtual machine that can be moved to (another) virtual environment.


This will install a virtual machine with jenkins and some build tools (Java, gradle, git).

At the hour of writing, I have:
- Virtualbox 4.3.10
- Ubuntu 14.04.
- vagrant 1.4.3

On ubuntu installing this would be something like
sudo apt-get install vagrant
sudo apt-get install virtualbox
sudo apt-get install git
git clone https://github.com/jwermuth/basecamp-vagrant.git
(or, for ssh)
git clone git@github.com:jwermuth/basecamp-vagrant.git
vagrant up --provision

#User Stories

## Implemented
* As a Developer I want to check my CI environment into git, so I can recreate the environment automatically

## Sprint (rather, Snail as this is a weekend project)
* As a Developer I want to install a CI environment with a few commands or clicks
* As a Developer I want my code project to be tested when I commit code to github, so I can develop higher quality code
* As a Developer I want to run my CI against my own project, so I can use it for pet projects 

##Backlog
* As a Developer I want to run the Box I built with Vagrant in the cloud, so I dont use resources on my own machine to do CI stuff


