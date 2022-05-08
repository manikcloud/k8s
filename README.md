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

```
# pod creation 
```
kubectl run nginx --image=nginx

kubectl run httpd --image=httpd



```
# Installation command all in one

```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo echo deb http://apt.kubernetes.io/ kubernetes-xenial main > /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt install docker.io kubectl=1.20.5-00 kubeadm=1.20.5-00 kubelet=1.20.5-00
sudo apt-get update

service docker start
service docker status 

kubeadm init

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sleep 1

kubeadm join 172.31.64.38:6443 --token 425qb8.51rbrxc5h862g202 --discovery-token-ca-cert-hash sha256:a502867d97b05820f186e3ee748afddd9142aae4104aee804d30662148138bae

kubectl get pods -n kube-system

```
# Creating network
```
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 |tr -d '\n')"
sudo kubectl get nodes
```
# kubectl commands

```
kubectl get namespace

kubeadm token list
kubectl get namespaces

kubectl get replicationcontroller,services
kubectl get pods -n kube-public
kubectl get pods -n kube-system
kubectl get pods --all-namespaces

kubectl run nginx --image=nginx
kubectl get pods --all-namespaces

kubectl get pods
kubectl get pods -o wide
kubectl describe pod nginx
kubectl get pods
kubectl run nginx --image=httpd
kubectl run httpd --image=httpd
kubectl get pods

service docker status
sudo kubectl get nodes

```
# Dashboard
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.1/aio/deploy/recommended.yaml

kubectl proxy

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '/^deployment-controller-token-/{print $1}') | awk '$1=="token:"{print $2}'

kubectl -n kube-system describe secret $(
  kubectl -n kube-system get secret | \
  awk '/^deployment-controller-token-/{print $1}'
) | \
awk '$1=="token:"{print $2}'

```
There are 4 distinct commands and they get called in this order:

Line 2 - This is the first command from @silverfox's Token section.
Line 3 - Print only the first field of the line beginning with deployment-controller-token- (which is the pod name)
Line 1 - This is the second command from @silverfox's Token section.
Line 5 - Print only the second field of the line whose first field is "token:"

# ReplicaSet

```

kubectl apply -f ReplicaSet/ReplicaSet.yaml 
kubectl get pods
kubectl get replicaset 
kubectl delete pod sl-replicaset-hnd76
kubectl descr
kubectl apply -f pods/pod-def.yaml 
kubectl get pods
kubectl apply -f pods/pod-def.yaml 
kubectl get pods
kubectl get replicaset sl-replicaset
kubectl edit replicaset sl-replicaset
kubectl get replicaset sl-replicaset
kubectl scale replicaset sl-replicaset --replicas=2
kubectl get replicaset sl-replicaset
 
kubectl get replicaset sl-replicaset
```


# Cleanup 

- Run this command to cleanup
```
sh installation/cleanup.sh
```
- OR copy and paste below commands one by one.

```
docker ps 
kubeadm reset -f
rm -rf /etc/cni /etc/kubernetes /var/lib/dockershim /var/lib/etcd /var/lib/kubelet /var/run/kubernetes ~/.kube/*
v
apt remove -y kubeadm kubectl kubelet kubernetes-cni
sudo apt-get purge kubeadm kubectl kubelet kubernetes-cni kube* 
sudo apt-get autoremove
sudo rm -rf ~/.kube
docker ps
system restart docker 
systemctl restart docker 

history | cut -c 8- > history.txt


```

# References
1. https://kubernetes.io/
2. https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
3. https://kubernetes.io/docs/concepts/workloads/pods/
4. https://etcd.io/
5. https://kubernetes.io/docs/reference/kubectl/
6. https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/