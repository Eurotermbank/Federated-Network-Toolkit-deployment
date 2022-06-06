# Tutorial: Set up Eurotermbank Toolkit on Kubernetes with HELM CHART.

&nbsp;
&nbsp;
|Version|0.1|
|-----|-----------|

&nbsp;
&nbsp;

## About tutorial:
This document contains information how to run Toolkit for Eurotermbank Federated Network on Kubernetes with HELM CHART including Kubernetes set up and Helm Chart installation.


## Table of contents
1. Prerequisites
2. Kubernetes installation
3. Helm Chart installation
4. Storage configuration
5. Toolkit variable configuration
7. Toolkit Deployment

&nbsp;
&nbsp;
#### **Changes**
|Version|Publication date|Change|
|-----|-----------|-----------|
|0.1| 09.12.21 | Initial version |
|0.2| 10.12.21 | Kubernetes installation described |
|0.3| 10.12.21 | Helm installation installation described |
|0.4| 10.12.21 | Storage configuration described |
|0.5| 10.12.21 | Toolkit variable configuration described |
|0.6| 10.12.21 | Toolkit Deployment described |

&nbsp;
&nbsp;

## Prerequisites:
1) Linux Virtual machine
2) Sudo user
3) Internet connection
4) Open port 80 and 443 (not in use)
---
In this Tutorial we will use Ubuntu 20.04 LTS, in other Linux distributions commands may be different.

## Kubernetes installation
### Install microk8s
Connect to VM.

Run:
```bash
sudo apt update
```
![sudo apt update](img/apt-update.PNG "sudo apt update")

This will update Ubuntu repositories.

When repositories are updated, let's install Kubernetes.

To run Kubernetes on Ubuntu, we will use microk8s (https://microk8s.io/).

We will install kubernetes - 1.19.
Run:
```bash
sudo snap install microk8s --classic --channel=1.19/stable
```
![install microk8s](img/install-microk8s.PNG "install microk8s")

### Permissions for microk8s

We need to grant admin permissions for microk8s:

```bash
sudo usermod -a -G microk8s $USER
```
Also we need grant access to kubernetes directory for our sudo user:

```bash
sudo chown -f -R $USER ~/.kube
```

![Permissions for microk8s](img/permissions-microk8s.PNG "Permissions for microk8s")


Restart terminal session, to apply changes.

### Enable kubernetes features

After succesfull microk8s installation, we need to configure Kubernetes features.

For successful Kubernetes usage, we have to enable following features:
1) DNS
2) Dashboard
3) Storage
4) Ingress

Feature can be enabled one by one:
```bash
sudo microk8s enable ingress
```

or can be enabled with a single command:

```bash
sudo microk8s enable dns dashboard storage ingress
```
![microk8s enable](img/microk8s-enable.PNG "microk8s enable")

### Accessing Dashboard

Before accessing the Kubernetes Dashboard, we need to get a secret token for authentication:

Following two commands must be executed and as a result you will get the token:

```bash
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token
```

![get dashboard token](img/dashboard-token.PNG "get dashboard token")

Copy and save this token for later use, it will be needed to access the Kubernetes Dashboard.

We will execute next command to set shorter alias 'kubectl':
```bash
sudo snap alias microk8s.kubectl kubectl
```

The next step is to set up port forwarding for Dashboard service. It will allow to connect the Dashboard from outside of Kubernetes cluster.

```bash
kubectl port-forward -n kube-system service/kubernetes-dashboard 18001:443 --address=0.0.0.0
```
![port forward](img/port-forward.PNG "port forward")

P.S. port forward command can be used for all services in kubernetes cluster.

Finaly you can connect to the Kubernetes Dashboard.

URL looks like this:

https://your-server-name:18001/#/

If you don't know your server name, you can execute this command:
```bash
hostname
```

![hostname](img/hostname.PNG "hostname")


In our demo case it will be:

https://otk-k8s:18001/#/


Open the web browser and connect to the URL. If you will see error message saying somthing about not having private connection, press to proceed. Later in this tutorial we will add SSL certificate to secure the connection.

![connection not private](img/connection-not-private.PNG "connection is not private")



After accepting insecure connection you will see Kubernetes Dashboard login page:
![Dashboard login](img/dashboard-login.PNG "Dashboard login")


In the Dashboard choose 'Token auth method', enter the previously saved token and press Sign in.
Welcome to Dashboard:

![Dashboard ](img/dashboard.PNG "Dashboard")

```
&nbsp;
&nbsp;