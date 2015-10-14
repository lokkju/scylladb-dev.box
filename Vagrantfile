# -*- mode: ruby -*-
# vi: set ft=ruby :

SCYLLADB_IP = "10.190.50.110"


Vagrant.configure(2) do |config|
  config.vm.post_up_message = "scylladb-dev is running at #{SCYLLADB_IP}"
  config.vm.box = "boxcutter/centos71"
  config.vm.hostname = "scylladb-dev"
  config.vm.network "private_network", ip: SCYLLADB_IP

  # TODO: have to support scylla using first non-loopback address or interface
  #config.vm.network :forwarded_port, guest: 10000, host: 10000, guest_ip: SCYLLADB_IP
  #config.vm.network :forwarded_port, guest: 9042, host: 9042, guest_ip: SCYLLADB_IP

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  else
    puts "WARNING: not using package cache.  Please 'vagrant plugin install vagrant-cachier' to enable faster rebuilds"
  end

  config.vm.synced_folder "salt/roots/", "/srv/salt/"

  config.vm.provision :salt do |salt|
    salt.pillar({
      "private_ip" => SCYLLADB_IP
    })
    salt.bootstrap_options = '-F -c /tmp/' #https://github.com/mitchellh/vagrant/issues/5973
    #salt.verbose = true
    salt.minion_config = "salt/minion.yml"
    salt.run_highstate = true
    salt.colorize = true
    salt.log_level = 'info'
  end

end
