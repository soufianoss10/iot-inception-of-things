# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Define the Server machine
  config.vm.define "sbenzarS" do |sbenzarS|
    sbenzarS.vm.box = "ubuntu/focal64"
    sbenzarS.vm.hostname = "sbenzarS"
    sbenzarS.vm.network "private_network", ip: "192.168.56.110"
    sbenzarS.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
  end

  # Define the ServerWorker machine
  config.vm.define "sbenzarSW" do |sbenzarSW|
    sbenzarSW.vm.box = "ubuntu/focal64"
    sbenzarSW.vm.hostname = "sbenzarSW"
    sbenzarSW.vm.network "private_network", ip: "192.168.56.111"
    sbenzarSW.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
  end

  # Set up SSH authentication
  config.ssh.insert_key = false

  # Provision both machines with K3s and kubectl
  config.vm.provision "shell", inline: <<-SHELL
    # Install K3s on Server machine in controller mode
    curl -sfL https://get.k3s.io | sh -s - server
    sudo chmod 644 /etc/rancher/k3s/k3s.yaml
    export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
    echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc

    # Install K3s on ServerWorker machine in agent mode
    curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$(cat /var/lib/rancher/k3s/server/node-token) sh -s - agent
    sudo chmod 644 /etc/rancher/k3s/k3s.yaml
    export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
    echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc

    # Install kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
  SHELL

end
