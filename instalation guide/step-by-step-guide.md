
# Step by step installation guide for administrator

## About guide:
This document contains information how to run Toolkit for Eurotermbank Federated Network on Kubernetes. In document will be described topics like Kubernetes and MySQL installations.

## Prerequire:
1) Linux Virtual machine
2) Sudo user
3) Internet connection
---
In this Guide we will use Ubuntu 20.04, in other Linux distributions command can be different.

## Kubernetes installation
### Install microk8s
Connect to VM.

Run:
```bash
sudo apt update
```
![sudo apt update](img/apt-update.png "sudo apt update")

This will update Ubuntu repositories.

After repositories are updated. We will install Kubernetes.

To run kubernetes on Ubuntu, we will use microk8s.
We will install kubernetes - 1.19.
Run:
```bash
sudo snap install microk8s --classic --channel=1.19/stable
```
![install microk8s](img/install-microk8s.png "install microk8s")

### Permissions for microk8s

We need to grant admin permissions for microk8s

```bash
sudo usermod -a -G microk8s admins
```
Also we need grant access to kubernetes directory for our sudo user.

```bash
sudo chown -f -R admins ~/.kube
```

![Permissions for microk8s](img/permissions-microk8s.png "Permissions for microk8s")

### Enable kubernetes features

After succesfull microk8s installation, we will configure kuberntes features.

For succsesfull kubernetes usage, we will need enable:
1) DNS
2) Dashboard
3) Storage
4) Ingress

This features can be enabled one by one:
```bash
sudo microk8s enable ingress
```

or can be enabled by one cmd:

```bash
sudo microk8s enable dns dashboard storage ingress
```
![microk8s enable](img/microk8s-enable.png "microk8s enable")

### Accessing Dashboard

Before access to Dashboard, you will need get secret token.

Token will be used as auth.

You will need execute 2 commands. As a result you will get token.

```bash
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token
```

![get dashboard token](img/dashboard-token.png "get dashboard token")

Copy this token, it will be needed in future.

Next we will port forward dashboard service. It will allow to connect to service out of kubernetes cluster.

```bash
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 18001:443 --address=0.0.0.0
```
![port forward](img/port-forward.png "port forward")

P.S. port forward command can be used for all services in kubernetes cluster.

Finaly you can connect to Dashboard.

URL will be:

https://your-server-name:18001/#/

If you dont know your server name, you can execute:
```bash
hostname
```

![hostname](img/hostname.png "hostname")


In our demo case it will be:

https://otk-k8s:18001/#/


Open browser and connect to URL.
If you will see error about not private connection, press proceed. In future there will be possability to add SSL cert if you need.

![connection not private](img/connection-not-private.png "connection not private")



After proceed, you will see Kubernetes Dashboard login page.
![Dashboard login](img/dashboard-login.png "Dashboard login")


In Dashboard choose Token auth method, enter token from privious step and press Sign in.
Welcome to Dashboard:

![Dashboard ](img/dashboard.png "Dashboard ")


### Useful hack

If you are planning to use kubernetes from terminal. To avoid use all the time microk8s before kubectl. For example:
```bash
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 18001:443 --address=0.0.0.0
```

You can execute:
```bash
sudo snap alias microk8s.kubectl kubectl
```

Now you can execute without microk8s:

```bash
kubectl port-forward -n kube-system service/kubernetes-dashboard 18001:443 --address=0.0.0.0
```
