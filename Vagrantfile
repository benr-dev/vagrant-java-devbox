Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "devbox"
    vb.memory = "4096"
	
	# Display the VirtualBox GUI when booting the machine
    vb.gui = true
	
  end
  
  config.vm.hostname = "devbox"

  config.vm.provision "shell", inline: <<-SHELL
    sudo -E apt-get -qq update
    
	sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

    echo "Set up repo keys..."
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	curl -fsSL https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
	
	echo "Add repos to sources list..."
	sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb
	sudo add-apt-repository --yes https://download.docker.com/linux/ubuntu

    echo "Refresh package list..."
	sudo apt-get update
	
    echo "Installing Java..."
	sudo apt-get install -y adoptopenjdk-8-hotspot adoptopenjdk-11-hotspot adoptopenjdk-12-hotspot adoptopenjdk-13-hotspot
    
    echo "Installing Git..."
    sudo -E apt-get install -y git  || exit $?

    echo "Installing gradle & maven..."
    sudo -E apt-get install -y gradle maven || exit $?
    
    echo "Installing docker..."
    sudo -E apt-get -qq update
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    echo "Installing Unzip..."
    sudo apt-get install -y unzip || exit $?
	
#	echo "Installing GUI..."
#	sudo apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
#	sudo apt-get install tasksel
#	sudo tasksel install ubuntu-desktop
#	#sudo tasksel install ubuntu-mate-core
#	#sudo tasksel install xubuntu-core
	
#	sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
	
#	echo "Setting up graphical login..."
#	sudo apt-get install -y gdm
#	sudo dpkg-reconfigure gdm
	
SHELL

end