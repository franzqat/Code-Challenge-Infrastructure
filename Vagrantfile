# Install vagrant-disksize to allow resizing the vagrant box disk.
unless Vagrant.has_plugin?("vagrant-disksize")
    raise  Vagrant::Errors::VagrantError.new, "vagrant-disksize plugin is missing. Please install it using 'vagrant plugin install vagrant-disksize' and rerun 'vagrant up'"
end
# Install vagrant-serverspec to implements serverspec as a provisioner.
unless Vagrant.has_plugin?("vagrant-serverspec")
    raise  Vagrant::Errors::VagrantError.new, "vagrant-serverspec plugin is missing. Please install it using 'vagrant plugin install vagrant-serverspec' and rerun 'vagrant up'"
end
# Install vagrant-hostsupdater to add an entry to your /etc/hosts file on the host system.
unless Vagrant.has_plugin?("vagrant-hostsupdater")
    raise  Vagrant::Errors::VagrantError.new, "vagrant-hostsupdater plugin is missing. Please install it using 'vagrant plugin install vagrant-hostsupdater' and rerun 'vagrant up'"
end

Vagrant.configure('2') do |config|
  config.disksize.size = '40GB'
  config.vm.box = "centos/8"

  config.vm.define "machine1" do |machine|

    machine.vm.hostname = "machine1"
    machine.vm.network "private_network", ip: "192.168.77.21"

    # Resize the disk
    machine.vm.provision :shell, path: "disk-extend.sh"

    machine.vm.provision "ansible_local" do |ansible|
      ansible.limit = 'all'
      ansible.inventory_path = 'hosts'
      ansible.playbook = 'local.yml'
    end 
  end

  config.vm.define "machine2" do |docker|

   docker.vm.hostname = "machine2"
   docker.vm.network "private_network", ip: "192.168.77.22"

   # Resize the disk
   docker.vm.provision :shell, path: "disk-extend.sh"

   docker.vm.provision "ansible_local" do |ansible|
     ansible.limit = 'all'
     ansible.inventory_path = 'inventory'
     ansible.playbook = 'local.yml'
   end 
 end

end