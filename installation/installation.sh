#!/bin/bash
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo echo deb http://apt.kubernetes.io/ kubernetes-xenial main > /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt install docker.io kubectl=1.20.5-00 kubeadm=1.20.5-00 kubelet=1.20.5-00 -y 
sudo apt-get update

service docker start

kubeadm init

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sleep 1

kubeadm join 172.31.64.38:6443 --token 425qb8.51rbrxc5h862g202 --discovery-token-ca-cert-hash sha256:a502867d97b05820f186e3ee748afddd9142aae4104aee804d30662148138bae


sudo kubectl get nodes