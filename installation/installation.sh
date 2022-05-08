#!/bin/bash
echo "Download and add the key to allow kubernetes installation..."
sleep 2
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo echo deb http://apt.kubernetes.io/ kubernetes-xenial main > /etc/apt/sources.list.d/kubernetes.list
echo "Update the  package & Install the kubernetes and the tools required to manage..."
sleep 2
sudo apt-get update
sudo apt install docker.io kubectl=1.20.5-00 kubeadm=1.20.5-00 kubelet=1.20.5-00 -y 
echo "Update the apt-get package..."
sudo apt-get update

sudo service docker start
echo "initialize the cluster..."
sleep 2
sudo kubeadm init

echo "creating config file for current custer..."
sleep 2
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sleep 1
echo " kubeadm join command as a root user on the worker node..."
sleep 2
kubeadm join 172.31.64.38:6443 --token 425qb8.51rbrxc5h862g202 --discovery-token-ca-cert-hash sha256:a502867d97b05820f186e3ee748afddd9142aae4104aee804d30662148138bae


sudo kubectl get nodes
echo " install the weavenet plugin in order to create a network..."

sleep 1

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 |tr -d '\n')"
sleep 60

echo "Adding network in K8s cluster.....please wait for some time...!"
sleep 2 
sudo kubectl get nodes
