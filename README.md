#Basecamp-vagrant
![Basecamp](markdown/basecamp.jpg)

This project contains the code behind a demo of vagrant/git/jenkins for IT Basecamp 2015. The image is from IT Basecamp 2014.

The demo shows a real life example of how you can build complete boxes with functionality using Vagrant. The example provides an Out Of the Box solution to create a Continuous Integration environment under revision control on a virtual machine that can be moved to (another) virtual environment. A developer can use this to get a project under full CI with little effort. You will need fairly high experience/understanding of code, CI, Revision Control and Provisioning to get the most of out of this project

If you clone and run this project (from the guidelines below) you will end up with a virtual machine running under VirtualBox. The machine will have jenkins running. You can inspect the running Jenkins at http://localhost:8080/

The machine will have a little development environment installed (Java, gradle, git). You can add any installations you like for your environment (e.g. ruby, python, whatever)

##Prerequisites 

At the hour of writing, I have:
- Virtualbox 4.3.10
- Ubuntu 14.04.
- vagrant 1.4.3

### Installing on Ubuntu

On ubuntu installing this would be something like

* sudo apt-get install vagrant
* sudo apt-get install virtualbox
* sudo apt-get install git
* git clone https://github.com/jwermuth/basecamp-vagrant.git
* vagrant up --provision

If you want to use ssh, clone *git@github.com:jwermuth/basecamp-vagrant.git* instead.

### Installing on windows

I have focused on Ubuntu. If you try this on Windows, feel free to make a **Pull Request** if you try this.

### Installing on Mac

A friend did this without hazzle, so its possible. I have not tried it.



#User Stories


## Implemented
* As a Developer I want to check my CI environment into git, so I can recreate the environment automatically

## Sprint (rather, Snail as this is a weekend project)
* As a Developer I want to install a CI environment with a few commands or clicks
* As a Developer I want my code project to be tested when I commit code to github, so I can develop higher quality code
* As a Developer I want to run my CI against my own project, so I can use it for pet projects 

##Backlog
* As a Developer I want to run the Box I built with Vagrant in the cloud, so I dont use resources on my own machine to do CI stuff
* As a Developer I want to be able to provide sensitive information (e.g. my password and email) to the vagrant build process in a safe way, so I can configure my box with the right settings without anyone else beeing able to retrieve the sensitive information
 


