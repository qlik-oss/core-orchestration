## Prerequisites for deploying to Docker Swarm
You will need a Docker Swarm enviroment. 
If you would like to setup a local enviroment follow this guide: [Install Docker](https://docs.docker.com/engine/swarm/)

### Secrets
Since the images being used is private you have to add a secret to your Docker Swarm to be able to fetch the private images from docker hub. 
To add a secret to Docker Swarm you will need to add your 