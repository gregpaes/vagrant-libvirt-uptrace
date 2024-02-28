ENV['VAGRANT_NO_PARALLEL'] = 'yes'
VAGRANTFILE_API_VERSION = "2"

require "yaml"
settings = YAML.load_file "configs/settings.yml"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = settings["software"]["box"]
  config.vm.box_check_update = true
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
#
  config.vm.define "uptrace" do |uptrace|
    uptrace.vm.hostname = "uptrace-node"
    uptrace.vm.network :private_network, ip: settings["network"]["uptrace_ip"]
    uptrace.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
    uptrace.vm.synced_folder ".", "/vagrant", type: "nfs", nfs_version: 4, nfs_udp: false, disabled: true
    uptrace.vm.provider "libvirt" do |lb|
      lb.qemu_use_session = false
      lb.uri = "qemu:///system"
      lb.host = "uptrace-node"
      lb.cpus = settings["nodes"]["uptrace"]["cpu"]
      lb.memory = settings["nodes"]["uptrace"]["memory"]
    end
    uptrace.vm.provision "shell",
      path: "scripts/clickhouse.sh"
    uptrace.vm.provision "shell",
      path: "scripts/postgresql.sh"
    uptrace.vm.provision "shell",
      inline: "sudo -i -u postgres psql -c \"CREATE USER uptrace WITH PASSWORD 'uptrace';\"", privileged: false
    uptrace.vm.provision "shell",
      inline: "sudo -i -u postgres psql -c \"CREATE DATABASE uptrace with owner uptrace encoding 'UTF8';\"", privileged: false
    uptrace.vm.provision "shell",
      path: "scripts/uptrace.sh"
  end
end