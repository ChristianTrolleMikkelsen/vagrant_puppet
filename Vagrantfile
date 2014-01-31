# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "puppet-master" do |master|
	master.vm.box = "precise32"
	master.vm.hostname = "puppet-master"
	master.vm.network :public_network, :bridge => 'en0: Wi-Fi (AirPort)'
	master.vm.provider :virtualbox do |vb|
		vb.gui = false
		vb.name = "puppet-master"
		vb.customize ["modifyvm", :id, "--memory", "1024"]
		vb.customize ["modifyvm", :id, "--cpus", "1"]
	end
	master.vm.provision "shell", path: "update_apt_get.sh"
	master.vm.provision "shell", path: "install_puppet.sh", args: "/vagrant/puppet_master.answer"
  end

  config.vm.define "puppet-ubuntu" do |puppet|
	puppet.vm.box = "precise32"
	puppet.vm.hostname = "puppet-ubuntu"
	puppet.vm.network :public_network, :bridge => 'en0: Wi-Fi (AirPort)'
	puppet.vm.provider :virtualbox do |vb|
		vb.gui = false
		vb.name = "puppet-ubuntu"
		vb.customize ["modifyvm", :id, "--memory", "1024"]
		vb.customize ["modifyvm", :id, "--cpus", "1"]
	end
	puppet.vm.provision "shell", path: "update_apt_get.sh"
	puppet.vm.provision "shell", path: "install_puppet.sh", args: "/vagrant/puppet_node_ubuntu.answer"
  end

  config.vm.define "puppet-windows" do |puppet|
	puppet.vm.define "puppet-windows"
	puppet.vm.box = "windows_2012_r2_std"
	puppet.vm.hostname = "puppet-windows"

	puppet.winrm.username = "vagrant"
	puppet.winrm.password = "vagrant"
    
	puppet.vm.guest = :windows
	puppet.windows.halt_timeout = 15

	puppet.vm.network :public_network, :bridge => 'en0: Wi-Fi (AirPort)'

	# Port forward WinRM and RDP
	puppet.vm.network :forwarded_port, guest: 3389, host: 3389
	puppet.vm.network :forwarded_port, guest: 5985, host: 5985

	puppet.vm.provider :virtualbox do |v, override|
		v.gui = true
		v.name = "puppet-windows"
		v.customize ["modifyvm", :id, "--memory", "2048"]
		v.customize ["modifyvm", :id, "--cpus", "1"]
	end

	puppet.vm.provision "shell", path: "install_puppet.bat"
	puppet.vm.provision "shell", path: "rename-machine.bat", args: "puppet-windows"
  end
end
