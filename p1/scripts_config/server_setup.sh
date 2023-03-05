#!/bin/bash
vagrant plugin install vagrant-scp
echo "echo instaling k3s on The Server mode..."
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s - --flannel-iface=eth1
echo "waiting for the token to be generated..."
sleep 5
sudo cat /var/lib/rancher/k3s/server/token > /home/vagrant/token

echo "****************************************"
echo "****************************************"
echo "****************************************"
echo "****************************************"

# vagrant scp sbenzarS:/home/vagrant/token .