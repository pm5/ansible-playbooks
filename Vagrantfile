# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "debian.yml"
    ansible.extra_vars = {
      hostname: "cass"
    }
  end
end
