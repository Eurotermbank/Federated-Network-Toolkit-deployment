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