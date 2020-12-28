Vagrant.configure('2') do |config|

  common = <<-SCRIPT
  sudo parted /dev/sda resizepart 1 100%
  sudo pvresize /dev/sda1
  sudo lvextend -l +100%FREE /dev/centos/root
  sudo xfs_growfs /dev/centos/root
  SCRIPT


  config.vm.box = "centos/8"
  config.disksize.size = '40GB'




  config.vm.define "build" do |build|
  	build.vm.provision "shell", inline: "echo Hello"
  	build.vm.provision "shell", inline: "echo C"
  end 



  #config.vm.define "testing" do |test|
  #  test.vm.provision "shell", inline: "echo B"
  #end

end
