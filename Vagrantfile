Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "devbox"
    vb.memory = "4096"
	
	# Display the VirtualBox GUI when booting the machine
    vb.gui = true
	
  end
  
  config.vm.hostname = "devbox"

  config.vm.provision "shell" do |s|
    s.path = "provision.sh"
  end

end