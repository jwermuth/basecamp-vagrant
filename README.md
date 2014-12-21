#Basecamp-vagrant
![Basecamp](markdown/basecamp.jpg)
<div class="foo">
This project contains the code behind a demo of vagrant/git/jenkins for IT Basecamp 2015. The image is from IT Basecamp 2014.
</div>

<div class="intro">
The goal is to provide an Out Of the Box solution to create a Continuous Integration environment under revision control on a virtual machine that can be moved to (another) virtual environment.
</div>


This will install a virtual machine with jenkins and some build tools (Java, gradle, git).

I have
Virtualbox 4.3.10
Ubuntu 14.04.
vagrant 1.4.3

On ubuntu installing this would be something like
sudo apt-get install vagrant
sudo apt-get install virtualbox
sudo apt-get install git
git clone https://github.com/jwermuth/basecamp-vagrant.git
(for ssh)
git clone git@github.com:jwermuth/basecamp-vagrant.git
vagrant up --provision



###Backlog

