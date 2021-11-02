
# Tutorial: Set up Eurotermbank Toolkit on Kubernetes step by step.

&nbsp;
&nbsp;
|Version|0.3|
|-----|-----------|

&nbsp;
&nbsp;

## About tutorial:
This document contains information how to run Toolkit for Eurotermbank Federated Network on Kubernetes including Kubernetes set up and MySQL installation.


## Table of contents
1. Prerequisites
2. Kubernetes installation
3. MySQL installation
4. Toolkit Deployment
5. Ingress/Network configuration
6. Keycloak configuration

&nbsp;
&nbsp;
#### **Changes**
|Version|Publication date|Change|
|-----|-----------|-----------|
|0.1| 28.10.21 | Initial version |
|0.2| 29.10.21 | Kubernetes installation described |
|0.3| 02.11.21 | MySQL installation described |

&nbsp;
&nbsp;

## Prerequisites:
1) Linux Virtual machine
2) Sudo user
3) Internet connection
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
sudo usermod -a -G microk8s admins
```
Also we need grant access to kubernetes directory for our sudo user:

```bash
sudo chown -f -R admins ~/.kube
```

![Permissions for microk8s](img/permissions-microk8s.PNG "Permissions for microk8s")

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

The next step is to set up port forwarding for Dashboard service. It will allow to connect the Dashboard from outside of Kubernetes cluster.

```bash
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 18001:443 --address=0.0.0.0
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


### Useful hacks

If you are planning to use Kubernetes from terminal. To avoid use all the time microk8s before kubectl. For example:
```bash
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 18001:443 --address=0.0.0.0
```

You can execute this command to set shorter alias 'kubectl' or even other as you prefer:
```bash
sudo snap alias microk8s.kubectl kubectl
```

Now you can execute without microk8s:

```bash
kubectl port-forward -n kube-system service/kubernetes-dashboard 18001:443 --address=0.0.0.0
```
&nbsp;
&nbsp;

## MySQL installation

&nbsp;
&nbsp;

This section will go over how to install MySQL version 8.0 on an Ubuntu 20.04 server.

To install it, update the package index on your server if you’ve not done so recently:

```bash
 sudo apt update
```

Use wget command to add MySQL to Ubuntu repository:

```bash
wget -c https://repo.mysql.com/mysql-apt-config_0.8.15-1_all.deb
```

 ![mysql wget ](img/mysql-wget.PNG "mysql wget")


Before installation we need validate MySQL installation file. Execute command:

```bash
sudo dpkg -i mysql-apt-config_0.8.15-1_all.deb
```

Make sure what in **MySQL Server & Cluster** part selected **mysql-8.0**.

![mysql apt config ](img/mysql-apt-config.PNG "mysql apt config")

Then press **OK**

Next we need download the package lists from the repositories and "updates" them to get information on the newest versions of packages and their dependencies.
It can be performed by:

```bash
sudo apt-get update
```

Then install the mysql-server package:

```bash
sudo apt-get install mysql-server
```
![mysql install ](img/mysql-install.PNG "mysql install")

In this section please provide password for MySQL root user.

![mysql root password setup ](img/mysql-root-pass.PNG "mysql root password setup")

In authentication setup part, please select:
**Use legacy Authentication Method**

![mysql auth setup ](img/mysql-auth.PNG "mysql auth setup")


After succsefull installation, we will update MySQL configuration.

Open MySQL configuration file with nano:

```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```
Original configuration:

![mysql config before ](img/mysql-config-before.PNG "mysql config before")

New parametrs will define servers’ collation and character set.


```bash
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
log-error       = /var/log/mysql/error.log
bind-address    = 0.0.0.0
#
collation-server = utf8mb4_general_ci
init-connect='SET NAMES utf8mb4'
character-set-server = utf8mb4

```

After updating, your configuration must be similar:


![mysql config after ](img/mysql-config-after.PNG "mysql config after")


Now we need to restart MySQL to apply all changes.

```bash
sudo systemctl restart mysql
```
Once restart complete, you can check MySQL server status.

```bash
sudo service mysql status
```

![mysql status ](img/mysql-status.PNG "mysql status")

&nbsp;
&nbsp;

## Creating a Dedicated MySQL User and Granting Privileges

Upon installation, MySQL creates a root user account which you can use to manage your database. This user has full privileges over the MySQL server, meaning it has complete control over every database, table, user, and so on.
Because of this, it’s best to avoid using this account outside of administrative functions.
This step outlines how to use the root MySQL user to create a new user account and grant it privileges.

We will create small shell script.

```bash
sudo nano mysql-user-setup.sh
```
Fill file with configuration bellow.

```bash
#!/bin/bash
MYSQL_ROOT_PWD="root-pass"
# user: dbadmins
DBADMINUSER="db-user"
DBADMINS_PWD="db-user-pass"
mysql -u root -p$MYSQL_ROOT_PWD -e "CREATE USER '$DBADMINUSER'@'%' IDENTIFIED BY '$DBADMINS_PWD'"
mysql -u root -p$MYSQL_ROOT_PWD -e "GRANT ALL PRIVILEGES ON *.* TO '$DBADMINUSER'@'%' WITH GRANT OPTION"
```
**MYSQL_ROOT_PWD** - root user password (created in previous step)

**DBADMINUSER** - new user username

**DBADMINS_PWD** - new user password


![mysql user ](img/mysql-user.PNG "mysql user")

Once script created, execute next command, this will make script executable.

```bash
sudo chmod +x mysql-user-setup.sh
```
Execute script:

```bash
./mysql-user-setup.sh
```
&nbsp;
&nbsp;

### Test connection

&nbsp;
&nbsp;

For easier work with MySQL, you can use MySQL Workbench.
You can download it from [mysql workbench](https://www.mysql.com/products/workbench/ "mysql workbench") page.

In Workbench you will need define MySQL server IP address.
You can find by executing:

```bash
ip a
```

![mysql ip ](img/mysql-ip.PNG "mysql ip")

Next open Workbench. And press **+** to addd new connection.

![mysql workbench ](img/mysql-workbench.PNG "mysql workbench")

Fill connection parametrs.

**Connection name** - name for connection, it can be anything (only appear in Workbench connection list).

**Hostname** - server IP.

**Username** - user (not root)

Press **Test connection**

![mysql test ](img/mysql-test.PNG "mysql test")

It will promt to enter **password**

If test successful, you can close configuration.

To connect to server, press to connection name.

![mysql connection ](img/mysql-connection.PNG "mysql connection")

&nbsp;
&nbsp;

### Creating required database


&nbsp;
&nbsp;

There are need to configure 2 databases before deploying Toolkit.

&nbsp;
&nbsp;

#### **Keycloak database**
&nbsp;


Connect to MySQL server in Workbench.

Open Schemas tab.

![mysql schemas tab ](img/mysql-tab.PNG "mysql schemas tab")


Press button to create new schema.

![mysql new schema ](img/mysql-new-schema.PNG "mysql new schema")

Fill form with:

**Name** - otk-keycloak - *new database name, you can choose different, but there will be need to update install yaml*.

**Default characterset** - utf8 .

**Default collation** -  utf8_unicode_ci .

![mysql keycloak ](img/mysql-keycloak.PNG "mysql keycloak")

Press **Apply**

In new promt window validate if parametrs is correct and press **Apply**

![mysql keycloak ](img/mysql-keycloak2.PNG "mysql keycloak")

Database for keycloak created.

&nbsp;
&nbsp;

#### **CMS database**

&nbsp;

In Workbench create new schema.

Fill form with:

**Name** - otk-cms - *new database name, you can choose different, but there will be need to update install yaml*.

**Default characterset** - utf8mb4.

**Default collation** -  utf8mb4_general_ci.

![mysql cms ](img/mysql-cms.PNG "mysql cms")

Press **Apply**

In new promt window validate if parametrs is correct and press **Apply**

Now we will import database from dump file.

You can find dump file in repo [cms-dump.sql](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/main/seed-data/cms/cms-dump.sql "cms-dump.sql").

Download file to same machine, there you are using Workbench.

Once dump downloaded, open **Administration** tab in Workbench.

Press **Data Import/Restore**

![mysql Administration tab ](img/mysql-tab2.PNG "mysql Administration tab")


In **Import Options** select **Import from Self-Contained File** and locate priviosly downloaded dumb file.

In **Default Target Schema** select priviously created CMS database.

Under **Select Database Objects to Import** select **Dump Structure and Data**

Then press **Start import**

![mysql data import ](img/mysql-dataimport.PNG "mysql data import")

After successful import, you will see what import completed.

![mysql data import ](img/mysql-dataimport2.PNG "mysql data import")


To validate if import was successful, go to Schemas tab and expose **Tables** under database.
If there are Tables, then data was successfully imported.

![mysql cms schema ](img/mysql-cms-schema.PNG "mysql cms schema")



## Toolkit Deployment
 *Description in process

## Ingress/Network configuration
 *Description in process

## Authentication (Keycloak) configuration
 *Description in process

