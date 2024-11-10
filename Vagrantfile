# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :servidor do |servidor|
  servidor.vm.box = "bento/ubuntu-22.04"
  servidor.vm.network :private_network, ip: "192.168.50.2"
  servidor.vm.provision "file", source: "dockerWebapp", destination: "/home/vagrant/"
  servidor.vm.provision "file", source: "prometheus.yml", destination: "/home/vagrant/"
  servidor.vm.provision "file", source: "prometheus.service", destination: "/home/vagrant/"
  servidor.vm.provision "file", source: "node_exporter.service", destination: "/home/vagrant/"
  servidor.vm.provision "shell", path: "script.sh"
  servidor.vm.hostname = "servidor"
  end
end
