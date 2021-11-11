# Set up Eurotermbank Toolkit with Docker Swarm

*This tutorial contains simple set-up for demonstration purposes. To set up for production-ready portal, configure with secure configuration.*

**Prerequsite**

You have a Docker Swarm - make sure you have already installed both Docker Engine and Docker Compose. 

**#Step 1**
Apply credentials to be able to download images from Container registry:

``` 
docker login eurotermbank.azurecr.io
```
You will be asked for username and password:

<u>Username</u>: bbff8f3e-176d-483a-89ef-1a17b0674abf \

<u>Password</u>: Pvq3OmyHlbtrpP7yGfZ3Kp9_5pt1b1-LwI

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

