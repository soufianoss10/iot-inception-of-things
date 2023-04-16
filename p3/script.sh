#!/bin/bash

echo'updating the system and the packeges'

sudo apt-get update
sudo apt-get upgrade -y

#install docker
echo "installing docker on sbenzar Server....."

sudo apt-get install -y docker.io

# download kubectl:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# install it
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


# download k3d:

sudo wget https://github.com/rancher/k3d/releases/download/v5.4.9/k3d-linux-amd64 -O /usr/local/bin/k3d

$ sudo chmod +x /usr/local/bin/k3d

#Create k3d cluster
k3d cluster create sben-zar --api-port 6443 -p 8080:80@loadbalancer
