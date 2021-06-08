# Federated Network Toolkit

This repo contains set up instructions and deployment files for deploying Toolkit to Kubernetes environment. This toolkit can also be deployed in any other environment taht supports running Docker images

## Toolkit functionality
Term management
Term discusions, aprovals/drafts


## Architecture
consists of several microservices, deployable as docker containers.
## Set up CMS
1) restore DB from dump
2)Coppy seed data files

[CMS content management guide](user-guides/cms.md)

## Configure Keycloak
### set up Realm
1) Log into Keycloak master realm with admin user you specified in deployment yaml file (https://keycloak.example.com/auth)
2) Go over Master dropdown and click button  "Add realm"
3) This repo's folder 'seed-data/keycloak' contains file toolkit.json, imports this file.
4) Go to Realm Settings --> Email, to configure access to your email service (e.g. need for password recovery)
5) Go to Clients-->otk-frontend and enter your frontends public url (Root URL, Valid redirect URIs, Base URL)

### Manage users, Roles and Groups
There are 2 types of users:
1) Users in Master realm - those who can log in Keycloak and manage endusers
2) Users in toolkit realm - end-users of terminology portal. You can create new groups (each term collection belongs to one user group). As well you can asiing roles to the end users:

    a) Terminology Reader - cand see and discuss about terms in collections bollonging to user's group.

    b) Terminology Manager - can also do editorial operations.


## Configure database
There are need to configure 2 databases before deploying solution. Recomended to use MySQL.

1) Keycloak database:

    a) create database with name: **otk-keycloak**.

    b) configure schema details:

         Default collation: utf8_unicode_ci

         Default characterset: utf8

2) CMS database:

    a) create databse with name: **otk-cms**

    b) import database from [cms-dump.sql](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/main/seed-data/cms/cms-dump.sql "cms-dump.sql") dump file.

## Resource deployment

There are multiple .yaml files. Before deployment you need fill **configmap.yaml**, **secret.yaml**, **storage.yaml**, **ingress.yaml** with your values.
&nbsp;
&nbsp;
### **Storage**
&nbsp;
You need to define path to [cms-public-uploads](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/main/seed-data/cms/cms-public-uploads.zip"cms-public-uploads.zip") files.
&nbsp;
|Value|Description|
|-----|-----------|
|Path|location of cms public  uploads files ex. "/mnt/otk/cms-public-uploads" |

&nbsp;
&nbsp;
### **Ingress**
&nbsp;
You need change host values.


&nbsp;
&nbsp;
### **Configmap value**
&nbsp;
&nbsp;
#### **Frontend-cms**
|Value|Description|
|-----|-----------|
|DATABASE_CLIENT|database service ex. "mysql"|
|DATABASE_HOST| database host name |
|DATABASE_NAME| cms db name ex. "otk-cms"|
|DATABASE_PORT| database communication port ex. "3306"|

&nbsp;
&nbsp;
#### **Frontend**
|Value|Description|
|-----|-----------|
|BASE_URL|frontend URL  ex. "https://example.com"|
|CMS_SERVICE_URL| cms URL ex. "https://cms.example.com" |
|TERM_SERVICE_URL| termservice URL ex. "https://example.com/api/termservice" |
|KC_URL| keycloak URL ex. "https://auth.example.com/auth" |
|KC_REALM| keycloak realm name ex. "Toolkit" |
|KC_CLIENTID| keycloak client name ex. "otk-frontend" |
|DISCUSSION_SERVICE_URL| discussion service ULR ex. "https://example.com/api/discussionservice"|

&nbsp;
&nbsp;
#### **Termservice**
|Value|Description|
|-----|-----------|
|Auth__JwtBearer__Audience|keycloak audience ex. "account"|
|Auth__JwtBearer__Issuer|keycloak realm url ex. "https://auth.example.com/auth/realms/Toolkit"|

&nbsp;
&nbsp;
#### **Keycloak**
|Value|Description|
|-----|-----------|
|DB_VENDOR|database service ex. "mysql"|
|DB_ADDR|database host name|


&nbsp;
&nbsp;
&nbsp;





### **Secret value**
&nbsp;
&nbsp;
#### **Frontend-cms**
|Value|Description|
|-----|-----------|
|DATABASE_USERNAME| database admin username |
|DATABASE_PASSWORD| database admin password |
|SMTP_HOST| SMTP server host name |
|SMTP_PORT| SMTP server port |
|SMTP_USERNAME| SMTP server usarname |
|SMTP_PASSWORD| SMTP server password |
|SMTP_FROM| e-mail from ex. ""no-reply@example.com"" |
|SMTP_REPLYTO| e-mail from ex. ""no-reply@example.com"" |


&nbsp;
&nbsp;
#### **Termservice** & **Discussionservice**
|Value|Description|
|-----|-----------|
|Auth__BasicAuth__Password| basic user password |
|Auth__BasicAuth__Username| basic user username |
|Auth__JwtBearer__Secret| JWT bearer secret |
|ConnectionStrings__termDB| termservice database connection string |
|ConnectionStrings__discussionDB| discussion database connection string |

&nbsp;
&nbsp;
database connection string example: "server=example.mysql.database.example.com;user id=dbuser;password=dbpass;persistsecurityinfo=True;database=otk-term-srv;oldguids=true;Convert Zero Datetime=True;charset=utf8"
&nbsp;
&nbsp;
#### **Keycloak**
|Value|Description|
|-----|-----------|
|KEYCLOAK_USER| keyclaok admin username |
|KEYCLOAK_PASSWORD| keycloak admin password |
|DB_PASSWORD| database admin password |
|DB_USER| datagase admin username |

&nbsp;
&nbsp;
&nbsp;





### Deployment
There are 2 ways for deployment:

1) If you have automated deployment, you can use **kustomization.yaml**. After deployment complete, run kubectl create secret command from [container-registry-secret](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/main/container-registry-secret"container-registry-secret") file. container-registry-secret file contains credentials for ACR pull user.

2) For manual deployment please you can use **kubectl apply -f**. Please deploy in this sequence:

    a) namespace.yaml

    b) Execute run kubectl create secret command from [container-registry-secret](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/main/container-registry-secret"container-registry-secret") file. ontainer-registry-secret file contains credentials for ACR pull user.

    c) configmap.yaml

    d) secret.yaml

    e) kibana-secrets.yaml

    f) storage.yaml

    g) discussionservice.yaml

    h) elasticsearch.yaml

    i) frontend.yaml

    j) keycloak.yaml

    k) kibana.yaml

    l) termservice.yaml

    m) ingress.yaml