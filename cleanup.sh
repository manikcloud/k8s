#!/bin/sh
echo "  Kube Admin Reset"
kubeadm reset -f

echo "  Remove all packages related to Kubernetes"
apt remove -y kubeadm kubectl kubelet kubernetes-cni 
apt purge -y kube*

echo "  Remove docker images ( optional if using docker)"
docker image prune -a -y

echo "  Remove parts"

apt autoremove -y

echo "  Remove all folder associated to kubernetes, etcd, "
rm -rf ~/.kube
rm -rf /etc/cni /etc/kubernetes /var/lib/dockershim /var/lib/etcd /var/lib/kubelet /var/lib/etcd2/ /var/run/kubernetes ~/.kube/* 
rm -rf /etc/systemd/system/etcd* 
