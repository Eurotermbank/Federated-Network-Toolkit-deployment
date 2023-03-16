# Set up Eurotermbank Toolkit with Docker Swarm

*This tutorial contains simple set-up for demonstration purposes. To set up for production-ready portal, configure with secure configuration.*

**Prerequisite**

You have a Docker Swarm - make sure you have already installed both Docker Engine(https://docs.docker.com/engine/install/) and Docker Compose (https://docs.docker.com/compose/install/). You can install as well docker Desktop that already includes both. 


**#Step 1**
Apply credentials to be able to download images from Container registry:

``` 
docker login eurotermbank.azurecr.io
```
You will be asked for username and password:

<u>Username</u>: bbff8f3e-176d-483a-89ef-1a17b0674abf

<u>Password</u>: F_u8Q~kLt6h5JX3fnV6FsU66xFEmpDT5A4xiZcr-


**#Step 2**

Apply docker-compose.yaml from this folder with following command:

```
docker-compose -f "docker-compose.yaml" up
```
|-> *Use "up" for seting eveything up, "down" for taking everything down and "restart" to redeploy (down and then up)*


**#Step 3**
Open terminology portal by url specified in docker-compose.yaml: 
```
http://localhost:8080
```

**#Other Tips**

To access authentication management:
```
http://localhost:8083/auth/
```
Enter Username/password defined in docker-composer.yaml file. 
In this sample credentials are otk-admin/otk-admin


To access CMS management:
```
http://localhost:1337/admin/
```
Enter initial credentials:

 u: unsecure@login.com
 
 p: tbYbAa8fuiFVFz

and then change them, if you make toolkit public. See CMS User guide to mofify content.
