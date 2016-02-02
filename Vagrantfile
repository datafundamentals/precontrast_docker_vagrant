Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "coreos-stable"
  config.vm.box_url = "http://stable.release.core-os.net/amd64-usr/717.3.0/coreos_production_vagrant.json"

  File.open(File.join(File.dirname(__FILE__), 'services')).each do |line|
   port = line.split(/\s/).first.to_i
   config.vm.network "forwarded_port", guest: port, host: port
  end

  config.vm.network "private_network", ip: "#{ENV['RM_PC_VAGRANT_IP']}"

  config.vm.synced_folder "#{ENV['HOME']}/rm_pc/work", "/home/core/work", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp'] 

  config.vm.provider :virtualbox do |v|
    v.name = "rm-pc-coreos"
    v.customize [
        "modifyvm", :id,
        "--name", "rm-pc-coreos",
        "--memory", 2048,
        "--natdnshostresolver1", "on",
        "--cpus", 2,
    ]
  end

end
