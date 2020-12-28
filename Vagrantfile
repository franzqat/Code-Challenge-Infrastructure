Vagrant.configure(2) do |config|
  config.vm.box = "centos/8"

  
  config.vm.define "build" do |build|
  	build.vm.provision "shell", inline: "echo Hello"
  	build.vm.provision "shell", inline: "echo C"
  end 


  config.vm.define "testing" do |test|
    test.vm.provision "shell", inline: "echo B"
  end

end
