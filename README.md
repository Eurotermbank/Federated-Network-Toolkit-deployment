
<img align="right" height="100" src="https://user-images.githubusercontent.com/11315268/137450374-160146b9-e56a-4b49-aada-8e11518acc33.png">
<!-- omit in toc -->
# Toolkit for Eurotermbank Federated Network

This repo contains set up instructions and deployment files for deploying Toolkit to Kubernetes environment. This toolkit can also be deployed in any other environment that supports running Docker images

## Table of contents <!-- omit in toc -->


- [Toolkit overview](#toolkit-overview)
  - [Functionality](#functionality)
  - [Portal User Types](#portal-user-types)
  - [Architecture](#architecture)
- [Setup](#setup)
  - [Minimal system requirements](#minimal-system-requirements)
  - [Setting up Strapi CMS](#setting-up-strapi-cms)
  - [Configuring Keycloak](#configuring-keycloak)
    - [Seting up Keycloak Realm](#seting-up-keycloak-realm)
    - [Managing users, Roles and Groups](#managing-users-roles-and-groups)
  - [Configuring databases](#configuring-databases)
  - [Resource deployment](#resource-deployment)
    - [Storage](#storage)
    - [Ingress](#ingress)
    - [Configmap values](#configmap-values)
      - [Frontend-cms](#frontend-cms)
      - [Frontend](#frontend)
      - [Termservice](#termservice)
      - [Keycloak](#keycloak)
    - [Secret values](#secret-values)
      - [Frontend cms](#frontend-cms-1)
      - [Termservice & Discussionservice](#termservice--discussionservice)
      - [Keycloak](#keycloak-1)
    - [Deployment](#deployment)
    - [Portal branding](#portal-branding)
  - [Additional configuration](#additional-configuration)
    - [Kibana](#kibana)




If you plan to set up Eurotermbank toolkit, please see the instructions further below.

In case you already have your terminology management system and would like to join Eurotermbank network by using api REST calls, please see [Data synchronization specification](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/main/user-guides/synchronization.md)

# Toolkit overview

## Functionality

Toolkit is intended to decentralized terminology management, terminology sharing, terminology search, terminology creation workflow and its synchronization with central node Eurotermbank.com and later also metadata synchrnization with the ELRC-share.

The main functionality of the open Terminology Management Toolkit includes:

- Terminology management

  - Terminology import/export from/to TBX/TSV/CSV/Excel

  - Terminology entry management – edit, delete, create

- sharing

  - Share with other people to do collaborative terminology management

  - Share with citizens – allow anyone to see the whole term collection

- Terminology search

  - Global terminology search in the whole local database

  - Search in the collection list

  - Search in a term collection

  - Federated eTranslation TermBank Network (from eurotermbank.com portal)

- Terminology creation workflow

  - Share term candidates with others

  - Discuss about concepts and term candidates

  - Approve term candidates and new entries

- Automatic Terminology (approved terms) synchronization with Eurotermbank.com and ELRC-share

- Manage portal style and Content management system:
  - change colors, logo, title
  - manage portals' content, news, menu, landing page texts and images

## Portal User Types

**Anonymous user** - any user that is not authenticated

**Registered User** - any user that has an account in set up Federated node and is authenticated

**Registered User as Reader** - registered user that has "Terminology Reader" role and access to certain Terminology Group (every collection belongs to a Group)

**Registered User as Editor** - registered user that has "Terminology Manager" role and access to certain Terminology Group (every collection belongs to a Group)

Functionality VS user types:
|                                              | Anonymous                                  | Registered User                            | Registered User as Reader | Registered User as Editor |
| -------------------------------------------- | ------------------------------------------ | ------------------------------------------ | ------------------------- | ------------------------- |
| See Collection in Collection List            | X                                          | X                                          | X                         | X                         |
| Can open collection                          | X                                          | X                                          | X                         | X                         |
| Can see approved terms                       | X                                          | X                                          | X                         | X                         |
| Can see draft terms                          |                                            |                                            | X                         | X                         |
| Can see discussion                           |                                            |                                            | X                         | X                         |
| Can add discusion comment                    |                                            |                                            | X                         | X                         |
| Can export all approved terms                | variable *                                 |  variable *                                | X                         | X                         |
| Can edit terms                               |                                            |                                            |                           | X
| Can import terms                             |                                            |                                            |                           | X                         |
| Can delete collection                        |                                            |                                            |                           | X                         |

 Feedback functionality (not implemented yet):
 |                                              | Anonymous                                  | Registered User                            | Registered User as Reader | Registered User as Editor |
| -------------------------------------------- | ------------------------------------------ | ------------------------------------------ | ------------------------- | ------------------------- |
| Can give feedback on term                    | X                                          | X                                          | X                         | X                         |
| See all users feedback                       |                                            |                                            | X                         | X                         |
| Delete any user feedback                     |                                            |                                            |                           | X                         |

*adjustable for each collection in metadata

## Architecture

The toolkit consists of several microservices, each component is deployable as docker container.

**Frontend** – Application responsible for all GUI and its operations. It is using Angular, that means this is Single Page Application

**CMS** – Content management System. Open source headless Content  Managemen system Strapi is used to enable easy and flexible approach for static content. Toolit provides also seed database for initial content.

**Term Service** – microservice responsible for terminology management backend. This service consists from 3 components – (1) backend service built on ASP.NET Core, (2) Elastic Search service and (3) MySQL Database. Main methods for the service are:

- CRUD operations for term metadata – terminology collections

- CRUD operations for term entries

- Bulk methods for massive term import, export

- Terminology search methods – lookup, search, fuzzy search, instant search

- Data synchronization support for Federated Network

**User Service** – microservice that is responsible for user authentication and authorization. Open source identity platform Keycloak was chosen. Custom Keycloak theme has been developed and provided for this toolkit (included in this Toolkit kKeycloak container image) as well initial configuration file to be imported.

**Discussion Service** - This service will consist from 2 components – (1) backend service built on ASP.NET Core, (2) MySQL Database. This service is responsible about user generated coments on terminology entries.

**Logging Service** – This services uses Elastic Search engine for log data storage and Kibana software for log data visualisation and query.

# Setup
## Minimal system requirements

• At least a 2-core x86/x64 CPU (Central Processor Unit)
• 5 GB of RAM (Random Access Memory) or more
• 30 GB of storage or more
• Internet access

**Solution has been tested on:**

• Kubernetes cluster version: 1.19
• MySQL version 8

## Setting up Strapi CMS

1) Restore DB from dump
2) Copy seed data files
3) Change admin username and password

[CMS content management guide](user-guides/cms.md)

## Configuring Keycloak

### Seting up Keycloak Realm

1) Log into Keycloak master realm with admin user you specified in deployment yaml file (<https://keycloak.example.com/auth>)
2) Go over Master dropdown and click button  "Add realm"
3) This repo's folder 'seed-data/keycloak' contains file toolkit.json, imports this file.
4) Go to Realm Settings --> Email, to configure access to your email service (e.g. need for password recovery)
5) Go to Clients-->otk-frontend and enter your frontends public url (Root URL, Valid redirect URIs, Base URL)

### Managing users, Roles and Groups

There are two types of users:

1) Users in Master realm - those who can log in Keycloak and manage endusers
2) Users in toolkit realm - end-users of terminology portal. You can create new groups (each term collection belongs to one user group). As well you can asiing roles to the end users:

    a) Terminology Reader - cand see and discuss about terms in collections bollonging to user's group.

    b) Terminology Manager - can also do editorial operations.

## Configuring databases

There need to be two databases configured before a solution can be deployed. It is recomended to use MySQL.

1) Keycloak database:

    a) create database with name: **otk-keycloak**.

    b) configure schema details:

         Default collation: utf8_unicode_ci

         Default characterset: utf8

2) Strapi CMS database:

    a) create databse with name: **otk-cms**

    b) import database from [cms-dump.sql](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/main/seed-data/cms/cms-dump.sql "cms-dump.sql") dump file.

## Resource deployment

There are multiple .yaml files. Before deployment you need fill **configmap.yaml**, **secret.yaml**, **storage.yaml**, **ingress.yaml** with your values.
&nbsp;
&nbsp;

### Storage

You need to define path to [cms-public-uploads](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/main/seed-data/cms/cms-public-uploads.zip"cms-public-uploads.zip") files.
|Value|Description|
|-----|-----------|
|Path|location of cms public  uploads files ex. "/mnt/otk/cms-public-uploads" |

&nbsp;
&nbsp;
### Ingress

You need change host values.
&nbsp;
&nbsp;

### Configmap values

#### Frontend-cms

|Value|Description|
|-----|-----------|
|DATABASE_CLIENT|database service ex. "mysql"|
|DATABASE_HOST| database host name |
|DATABASE_NAME| cms db name ex. "otk-cms"|
|DATABASE_PORT| database communication port ex. "3306"|
&nbsp;
&nbsp;

#### Frontend

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

#### Termservice

|Value|Description|
|-----|-----------|
|Auth__JwtBearer__Audience|keycloak audience ex. "account"|
|Auth__JwtBearer__Issuer|keycloak realm url ex. "https://auth.example.com/auth/realms/Toolkit"|

&nbsp;
&nbsp;

#### Keycloak

|Value|Description|
|-----|-----------|
|DB_VENDOR|database service ex. "mysql"|
|DB_ADDR|database host name|

&nbsp;
&nbsp;

### Secret values

#### Frontend cms

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

#### Termservice & Discussionservice

|Value|Description|
|-----|-----------|
|Auth__BasicAuth__Password| basic user password |
|Auth__BasicAuth__Username| basic user username |
|Auth__JwtBearer__Secret| JWT bearer secret |
|ConnectionStrings__termDB| termservice database connection string |
|ConnectionStrings__discussionDB| discussion database connection string |


&nbsp;
database connection string example: "server=example.mysql.database.example.com;user id=dbuser;password=dbpass;persistsecurityinfo=True;database=otk-term-srv;oldguids=true;Convert Zero Datetime=True;charset=utf8"
&nbsp;
&nbsp;


#### Keycloak

|Value|Description|
|-----|-----------|
|KEYCLOAK_USER| keyclaok admin username |
|KEYCLOAK_PASSWORD| keycloak admin password |
|DB_PASSWORD| database admin password |
|DB_USER| datagase admin username |

&nbsp;
&nbsp;

### Deployment

There are two ways for deployment:

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

&nbsp;
&nbsp;


### Portal branding

It is possible to override Toolkits default look - change logo, favicon, colors and some other options described in [toolkit branding guide](user-guides/portal-branding.md)

&nbsp;

## Additional configuration

### Kibana

&nbsp;
There are possability to configure authentification for Kibana dashboard.
Authentification will be enabled from Ingress. Before configuring Ingress, there are need to create secret key.
If key configured not correctly you can get error **503**.

Execute command:

```bash
htpasswd -c auth otk-logViewer
```

where **otk-logViewer** is login. And enter password in terminal log.
Next, create secret from auth, and displey it.

If you deploying directly to k8, you can add **--namespace otk** paramter to create command.

```kubectl
kubectl create secret generic basic-auth --from-file=auth
kubectl get secret basic-auth -o yaml
```

Output will be similar:

```yaml
apiVersion: v1
data:
  auth: 12345678900asdfghjkl==
kind: Secret
metadata:
  creationTimestamp: "2021-06-14T12:47:59Z"
  managedFields:
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:data:
        .: {}
        f:auth: {}
      f:type: {}
    manager: kubectl-create
    operation: Update
    time: "2021-06-14T12:47:59Z"
  name: basic-auth
  namespace: otk
  resourceVersion: "50508433"
  selfLink: /api/v1/namespaces/otk/secrets/basic-auth
  uid: 77123305-abcd-4567-lll3-000a01e4da74
type: Opaque

```

If you need to deploy in other environment, you can create secret yaml from previous step. It will look like this:

```yaml
apiVersion: v1
data:
  auth: 12345678900asdfghjkl==
kind: Secret
metadata:
  managedFields:
  - apiVersion: v1
  name: kibana-basic-auth
  namespace: otk
type: Opaque
```

&nbsp;
&nbsp;

Next enable in Kibana ingress annotations, so it will look like:

```yaml
kind: Ingress
apiVersion: networking.k8s.io/v1
metadata:
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/auth-type: basic
    nginx.ingress.kubernetes.io/auth-secret: kibana-basic-auth
    nginx.ingress.kubernetes.io/auth-realm: "Authentication Required - Logs and Statistics"
  name: http-ingress-kibana
  namespace: default
spec:
  tls:
  - hosts:
    - kibana.example.com
    secretName: aks-ingress-tls
  rules:
    - host: kibana.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: kibana
                port:
                  number: 5601
status:
  loadBalancer: {}

```

Here must be defined secret name:

```yaml
nginx.ingress.kubernetes.io/auth-secret: kibana-basic-auth
```

_____

This project is licensed under the terms of the CC-BY-NC-ND-4.0 license.

Project is co-financed by **Health and Digital Executive Agency (HaDEA)** <br>
**Action No**: 2019-EU-IA-0049
