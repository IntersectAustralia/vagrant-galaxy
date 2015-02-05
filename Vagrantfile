# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
   
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "chef/debian-7.4" 

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://vagrantcloud.com/chef/boxes/debian-7.4"
  
  
  # we'll forward the port 8000 from the VM to the port 8000 on the host
  config.vm.network :forwarded_port, host: 8010, host_ip: "127.0.0.1", guest: 8010
  config.vm.synced_folder("./config", "/vagrant/config")
  config.vm.synced_folder("../hcsvlab-galaxy/tools", "/vagrant/tools-dev")

  # add a bit more memory, it never hurts. It's VM specific and we're using Virtualbox here.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end
  
  # provision the VM
  config.vm.provision "shell", path: "provision.sh"
  
end

