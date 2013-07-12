# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # This vagrant machine generates a rails lab coat instance.
  # It is based off puppet labs base box
  # from http://puppet-vagrant-boxes.puppetlabs.com/
  # Ubuntu Server 12, x64, VirtualBox target, "plain" with puppet etc
  config.vm.box = "PuppetUbuntu12Vbox"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
  config.vm.hostname = "rails-lab-coat-build.vagrantup.com"

  # provision with puppet
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "default.pp"
     # puppet.options = "--verbose --debug"
  end

  # invoke shell script to continue install with rvm (ruby and rails)
  config.vm.provision :shell, :path => "bootstrap.sh"

end
