#!/bin/bash
# export  K3S_TOKEN_FILE=/vagrant/token
# export  K3S_URL=https://192.168.56.110:6443
# export  INSTALL_K3S_EXEC="--flannel-iface eth1"
# curl -sfL https://get.k3s.io  sh -

curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN_FILE=/vagrant/token INSTALL_K3S_EXEC="--flannel-iface eth1" sh -