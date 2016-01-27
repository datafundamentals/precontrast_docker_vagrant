Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "coreos-stable"
  config.vm.box_url = "http://stable.release.core-os.net/amd64-usr/717.3.0/coreos_production_vagrant.json"

  File.open(File.join(File.dirname(__FILE__), 'services')).each do |line|
   port = line.split(/\s/).first.to_i
   config.vm.network "forwarded_port", guest: port, host: port
  end

  config.vm.network "private_network", ip: "192.168.33.13"

  config.vm.synced_folder "#{ENV['HOME']}/work/contrast/work", "/home/core/work", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp'] 

  config.vm.provider :virtualbox do |v|
    v.name = "coreos-vm"
    v.customize [
        "modifyvm", :id,
        "--name", "coreos-contrast",
        "--memory", 2048,
        "--natdnshostresolver1", "on",
        "--cpus", 2,
    ]
  end

  CLOUD_CONFIG_PATH = File.join(File.dirname(__FILE__), "cloud-config")
  config.vm.provision :file, :source => "#{CLOUD_CONFIG_PATH}", :destination => "/tmp/vagrantfile-user-data"
  config.vm.provision :shell, :inline => "mv /tmp/vagrantfile-user-data /var/lib/coreos-vagrant/", :privileged => true
end
