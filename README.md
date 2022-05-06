# k8s
kubernetes installation and basic

# Kubernetes Installation and Cluster Setup

```
Steps to be followed:
1.	Installing Kubernetes
2.	Setting up a Kubernetes cluster

Step 1: Installing Kubernetes
1.1	To download and add the key to allow kubernetes installation, execute the commands mentioned below:

sudo su
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo echo deb http://apt.kubernetes.io/ kubernetes-xenial main > /etc/apt/sources.list.d/kubernetes.list
	 
1.2	Update the apt-get package by executing the command mentioned below:

sudo apt-get update

1.3	Install the kubernetes and the tools required to manage it. Run the command mentioned below in the terminal:

sudo apt install docker.io kubectl=1.20.5-00 kubeadm=1.20.5-00 kubelet=1.20.5-00

Step 2: Setting up a Kubernetes cluster
2.1	Update the apt-get package by executing the command mentioned below:
sudo apt-get update

2.2	To initialize the cluster run the following command on the master node
sudo kubeadm init
 
2.3	To start using your cluster, you need to run the following on master node:
mkdir -p $HOME/.kube
	sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
	sudo chown $(id -u):$(id -g) $HOME/.kube/config

2.4	You should see a single master node deployed on running the command:
sudo kubectl get nodes
 

2.5	Copy the kubeadm join command that you can see on the screen of your master node



 

2.6	Run the copied kubeadm join command as a root user on the worker node. You can use the terminal only lab as a worker node. Make sure you have Kubernetes installed on the worker node and then run the below command.

kubeadm join 172.31.64.38:6443 --token 425qb8.51rbrxc5h862g202 \
    --discovery-token-ca-cert-hash sha256:a502867d97b05820f186e3ee748afddd9142aae4104aee804d30662148138bae


2.7	On the master node, run the following command to install the weavenet plugin in order to create a network:
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 |tr -d '\n')"
 
2.8	List all the nodes again to check the status of nodes using the command:
kubectl get nodes
Command

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  457  sudo echo deb http://apt.kubernetes.io/ kubernetes-xenial main > /etc/apt/sources.list.d/kubernetes.list
  458  sudo apt-get update
  459  sudo apt install docker.io kubectl=1.20.5-00 kubeadm=1.20.5-00 kubelet=1.20.5-00
  460  sudo apt-get update
  461  kubeadm init
  462  ll
  463  ll -a
  464  service docker status 
  465  service docker start
  466  service docker status 
  467  kubeadm init
  468  mkdir -p $HOME/.kube
  469  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
  470  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  471  ll
  472  sudo kubectl get nodes

  474  kubeadm join 172.31.64.38:6443 --token 425qb8.51rbrxc5h862g202 --discovery-token-ca-cert-hash sha256:a502867d97b05820f186e3ee748afddd9142aae4104aee804d30662148138bae
  475  sudo kubectl get nodes



  
  476  kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 |tr -d '\n')"
  477  sudo kubectl get nodes
  478  sudo kubectl get pods
  479  sudo kubectl get nodes
  480  history 

