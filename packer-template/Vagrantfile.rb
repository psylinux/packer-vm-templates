VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "thdengops/ubuntu-14.04-dev"
  config.vm.provision "shell", path: "install.sh"
  config.vm.network :forwarded_port, host: 50000, guest: 8080
end
