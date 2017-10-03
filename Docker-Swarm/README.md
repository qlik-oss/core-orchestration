## Prerequisites for deploying to Docker Swarm
You will need a Docker Swarm enviroment. 
If you would like to setup a local enviroment follow this guide: [Install Docker](https://docs.docker.com/engine/swarm/)

### Secrets
Since the images being used is private you have to pass your Docker credentials when you deploy the stack. This is done by adding 
```
--with-registry-aut
```

## Deploy

Make sure you have set your docker cli to execute at your swarm cluster with 
```
eval $(docker-machine env <Your Swarm manager node>)
```

Then deploy the stack with the following command:
```
docker stack deploy -c ./docker-compose.yml --with-registry-auth frontira
```