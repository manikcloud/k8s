
```

- Installing an nginx pod and exposing it to the public involves a few steps. First, you'll need to create the nginx deployment, then you'll expose it using a service. Here are the commands to do that:

- Create the nginx deployment. A Kubernetes Deployment checks on the health of your Pod and restarts the Pod's container if it terminates. Deployments are the recommended way to manage the creation and scaling of Pods.



kubectl create deployment nginx --image=nginx


This command will create a deployment named "nginx" using the nginx image.

- Expose the nginx deployment as a service. By default and for security reasons, the Pod is only accessible by its internal IP within the Kubernetes cluster. To make the nginx container accessible from outside the Kubernetes virtual network, you need to expose the Pod as a Kubernetes Service.



kubectl expose deployment nginx --port=80 --type=LoadBalancer


- This command creates a new Service, which is an abstraction defining a logical set of Pods and a policy by which to access them - sometimes called a micro-service. The set of Pods targeted by a Service is usually determined by a selector.

- For services with a type of LoadBalancer, a cloud provider's load balancer is provisioned and configured. This gives you a single IP address that can distribute traffic to your pods. This type of service is good for serving traffic from outside of your cluster, like http requests from users.

- After running these commands, it may take a few minutes for the AWS load balancer to be created and for its DNS name to be available. Once that's done, you can find the URL for your service with the following command:



kubectl get services
This will show you something like:



You can then access your nginx server in your browser at the EXTERNAL-IP of the nginx service (which will be the DNS name of the load balancer).



```
# All-in-one command
```
kubectl rollout history deployment/web-app-deployment
kubectl rollout undo deployment/web-app-deployment --to-revision=3
kubectl rollout undo deployment/web-app-deployment --to-revision=1
kubectl rollout history deployment/web-app-deployment
kubectl edit deployment web-app-deployment  --record 
kubectl rollout undo deployment/web-app-deployment --to-revision=2
kubectl rollout history deployment/web-app-deployment
kubectl edit deployment web-app-deployment  --record
kubectl create -f services/service-def.yaml 
kubectl get svc
kubectl get node -o wide
kubectl get deployment 
kubectl expose deployment web-app-deployment --port=80 --type=LoadBalancer
kubectl get svc
kubectl rollout undo deployment/web-app-deployment --to-revision=3
kubectl get pod
kubectl edit deployment web-app-deployment  --record
kubectl rollout history deployment/web-app-deployment
kubectl get pod
kubectl rollout undo deployment/web-app-deployment --to-revision=6
```