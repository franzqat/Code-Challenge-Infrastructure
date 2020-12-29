Vagrant.configure('2') do |config|


  common = <<-SCRIPT
  sudo parted /dev/sda resizepart 1 yes 100%
  sudo pvresize /dev/sda1
  sudo lvextend -l +100%FREE /dev/centos/root
  sudo xfs_growfs /dev/centos/root
  SCRIPT



# Vagrant 1.7+ automatically inserts a different
# insecure keypair for each new VM created. The easiest way
# to use the same keypair for all the machines is to disable
# this feature and rely on the legacy insecure key.
# config.ssh.insert_key = false
#
# Note:
# As of Vagrant 1.7.3, it is no longer necessary to disable
# the keypair creation when using the auto-generated inventory.

  config.vm.define "machine1" do |machine|
    config.vm.box = "centos/8"
    config.disksize.size = '40GB'

    machine.vm.hostname = "machine1"
    machine.vm.network "private_network", ip: "192.168.77.21"

    # Only execute once the Ansible provisioner,
    # when all the machines are up and ready.
    machine.vm.provision "ansible_local" do |ansible|
    #machine.vm.provision :ansible do |ansible|
      ansible.limit = 'all'
      ansible.inventory_path = 'hosts'
      ansible.playbook = 'local.yml'
    end 

     # Resize the disk
    #machine.vm.provision :shell, :inline => common
  end

   config.vm.define "machine2" do |docker|
    config.vm.box = "centos/8"
    config.disksize.size = '40GB'

    docker.vm.hostname = "machine2"
    docker.vm.network "private_network", ip: "192.168.77.22"

    # Only execute once the Ansible provisioner,
    # when all the machines are up and ready.
    docker.vm.provision "ansible_local" do |ansible|
    #machine.vm.provision :ansible do |ansible|
      ansible.limit = 'all'
      ansible.inventory_path = 'inventory'
      ansible.playbook = 'local.yml'
    end 

     # Resize the disk
    #machine.vm.provision :shell, :inline => common
  end

end