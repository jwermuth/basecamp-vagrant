# -*- mode: ruby -*-
# vi: set ft=ruby :

#### USER PARAMETERIZE ##############################################################
# This section allows you to parametrize the vagrant build process.

## ci machine 

# When you push to a repo, this is the user that will be used
GIT_USER = "jwermuth"
DEVELOPER_ID = "jwermuth"
# Vagrant configuration repo
# When you push to a repo, this is the repo you will push to 
# example git@github.com:jwermuth/basecamp-vagrant.git
# Normally you would want to push to your own clone
# If you use ssh, you have to provide public key from the virtual machine to github, 
#    which is not automated. For now, just use https
GIT_JENKINS_CONFIGURATION_REPO = "https://github.com/jwermuth/basecamp-jenkins.git"

# When you create a CI environment, you will want to test a project somewhere.
# The default project under test is one I provided. You should add your own here
REPO_UNDER_CI = "https://github.com/jwermuth/basecamp-java.git"

# This is the email Jenkins will send to when errors occur. Please dont use mine
EMAIL = "jwermuth@gmail.com"
## end ci machine

#####################################################################################

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # dont start machine when running vagrant up
  # config.vm.define "dev", autostart: false


# Update package system. You can skip this during Vagrantfile development
# update fails at the moment ....
#	config.vm.provision "shell", inline: "sudo apt-get update --fix-missing -y"
#	config.vm.provision "shell", inline: "sudo apt-get upgrade -y"
  
	config.vm.define "dev" do |dev|
		dev.vm.box = "jesperwermuth/Ubuntu-14-04-Desktop"
		dev.vm.box_url = "https://atlas.hashicorp.com/jesperwermuth/boxes/Ubuntu-14-04-Desktop"
	    dev.vm.provider :virtualbox do |vb|
			vb.gui = true
			vb.customize ["modifyvm", :id, "--memory", "2048"]
			vb.customize ["modifyvm", :id, "--cpus", "2"]
			vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
			vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
			vb.customize ["modifyvm", :id, "--ioapic", "on"]
			vb.customize ["modifyvm", :id, "--vram", "128"]
			vb.customize ["modifyvm", :id, "--hwvirtex", "on"] 
		end
		
		config.vm.provision "shell", inline: "sudo apt-get install puppet -y"
		
		config.vm.provision :puppet do |puppet|
			puppet.manifests_path = "manifests"
			puppet.module_path = "modules"
			puppet.manifest_file = "init.pp"
		end		
	end
  
	config.vm.define "ci" do |ci|
		ci.vm.box = "jesperwermuth/Ubuntu-14-04-Headless"
		ci.vm.box_url = "https://atlas.hashicorp.com/jesperwermuth/boxes/Ubuntu-14-04-Headless"
	
		ci.vm.provision "shell", path: "configure-machine-environment.sh", args:[DEVELOPER_ID, EMAIL]
		# Get, provision and start Jenkins
		#	
		# To use jenkins you can log in to the machine with 
		# vagrant ssh
		# and then do sudo su jenkins  
		ci.vm.provision "shell", path: "jenkins-install.sh"
		ci.vm.provision "shell", path: "jenkins-configure.sh", args:[GIT_USER, GIT_JENKINS_CONFIGURATION_REPO, EMAIL, REPO_UNDER_CI]
		#  
		ci.vm.provision "shell", path: "jenkins-allow-restart.sh"
		ci.vm.provision "shell", path: "jenkins-restart.sh"
		ci.vm.network :forwarded_port, guest: 8080, host: 8080  
	end
  
	(["dev", "ci"]).each do |setup_dev_env|
		config.vm.define "#{setup_dev_env}" do |machine|  
		# Development environment
		machine.vm.provision "shell", path: "java.sh"
		# installing jenkins requires git
		machine.vm.provision "shell", path: "git.sh"
		# I use gradle as build tool
		machine.vm.provision "shell", path: "gradle.sh"
		end 
	end
end

# If you need some hints, do 
# vagrant init 
# in some dir. The example Vagrantfile created will contain examples on how to do stuff

# Nifty little move to make a local base box. After the box is created do:
#  vagrant package --base "VIRTUALBOX_ID"
#  vagrant 
#  config.vm.define "baseci" do |bi|
#	bi.vm.box = "trusty64"
#	bi.vm.provision "shell", inline: "sudo apt-get update --fix-missing -y"
#	bi.vm.provision "shell", inline: "sudo apt-get upgrade --fix-missing -y"
# end
    
