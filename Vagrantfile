# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :machine
  end

  # Ensure ubuntu vm has the latest version of VirtualBox Guest Additions
  # (Requires vagrant-vbguest plugin)
  config.vbguest.auto_update = true
  config.ssh.forward_x11 = true

  config.vm.box = "wily-server-cloudimg-amd64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/wily/current/wily-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network "private_network", ip: "192.168.15.10"

  # Disable the default shared directory
  #config.vm.synced_folder ".", "/vagrant", disabled: true
  # Instead share our parent directory to /vagrant
  config.vm.synced_folder "synced_folder", "/home/vagrant/Development", create: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    # Needs atleast 1 Gig of memory
    vb.memory = "2048"

    # Stackoverflow says this is required to give the virtualbox internet access
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.define "api" do |api|
    config.vm.provision :shell, path: "bootstrap.sh"
  end
end
