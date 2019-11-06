# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Create and configure the VM(s)
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Assign a friendly name to this host VM
  config.vm.hostname = "docker-host"

  # Skip checking for an updated Vagrant box
  config.vm.box_check_update = false

  # Always use Vagrant's default insecure key
  config.ssh.insert_key = false

  # https://pgaskin.net/linux-tips/configuring-git-credential-cache-on-linux/
  # https://stackoverflow.com/questions/31218599/supplying-a-password-to-git-in-a-bash-script

  # Spin up a "host box" for use with the Docker provider
  # and then provision it with Docker
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, path: "apt_get_setup.sh"
  config.vm.provision :shell, path: "bash_setup.sh", privileged: false
  config.vm.provision "docker"
  config.vm.provision :shell, path: "dev_setup.sh", privileged: false
  config.vm.provision :shell, path: "docker_setup.sh", run: "always"
  config.vm.provision :shell, path: "terraform_setup.sh", run: "always"

  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "/Users/macos/Public/Projects/PyCharm/cloudify", "/home/vagrant/dev/repos"

  config.vm.network "forwarded_port", guest: 15672, host: 25672

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", 4096]
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--usb", "off"]
    vb.customize ["modifyvm", :id, "--usbehci", "off"]
  end
end
