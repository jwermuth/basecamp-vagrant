# -*- mode: ruby -*-
# vi: set ft=ruby :

#### USER PARAMETERIZE ##############################################################
# This section allows you to parametrize the vagrant build process.

# When you push to a repo, this is the user that will be used
GIT_USER = "jwermuth"

# Vagrant configuration repo
# When you push to a repo, this is the repo you will push to 
# example git@github.com:jwermuth/basecamp-vagrant.git
# Normally you would want to push to your own clone
# If you use ssh, you have to provide public key from the virtual machine to github, 
#    which is not automated. For now, just use https
GIT_REPO = "https://github.com/jwermuth/basecamp-vagrant.git"

# When you create a CI environment, you will want to test a project somewhere.
# The default project under test is one I provided. You should add your own here
REPO_UNDER_CI = "https://github.com/jwermuth/basecamp-java.git"

# This is the email Jenkins will send to when errors occur. Please dont use mine
EMAIL = "jwermuth@gmail.com"

#####################################################################################

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty64"
  
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Update package system. You can skip this during development
  #config.vm.provision "shell", inline: "sudo apt-get update --fix-missing"
  
  # Development environment
  config.vm.provision "shell", path: "java.sh"
  # installing jenkins requires git
  config.vm.provision "shell", path: "git.sh"
  # I use gradle as build tool
  config.vm.provision "shell", path: "gradle.sh"
  
  
  # Get, provision and start Jenkins
  #
  # To use jenkins you can log in to the machine with 
  # vagrant ssh
  # and then do sudo su jenkins  
  config.vm.provision "shell", path: "jenkins-install.sh"
  config.vm.provision "shell", path: "jenkins-configure.sh", args:[GIT_USER, GIT_REPO, EMAIL, REPO_UNDER_CI]
  #  
  config.vm.provision "shell", path: "jenkins-allow-restart.sh"
  config.vm.provision "shell", path: "jenkins-restart.sh"
  
  config.vm.network :forwarded_port, guest: 8080, host: 8080  
  
end




# All the stuff below is what was in the example Vagrantfile created with vagrant init.
# I have moved it below to keep focus on the active stuff above, but its filled with
# good examples, so I have not deleted it. 

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file trusty64.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
