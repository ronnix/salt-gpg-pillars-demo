# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Shared folders
  config.vm.synced_folder "states/", "/srv/salt/"
  config.vm.synced_folder "pillars/", "/srv/pillar/"

  # Salt provisioner
  config.vm.provision :salt do |salt|
    salt.bootstrap_options = "-P"
    salt.minion_config = "minion"
    salt.run_highstate = true
  end

end
