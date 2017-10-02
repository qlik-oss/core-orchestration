## Prerequisites for deploying to Docker Swarm
You will need a Docker Swarm enviroment. 
If you would like to setup a local enviroment follow this guide: [Install Docker](https://docs.docker.com/engine/swarm/)

### Secrets
Since the images being used is private you have to pass your Docker credentials when you deploy the stack. This is done by adding 
```
--with-registry-aut
```

## Deploy

```
docker stack deploy -c ./docker-compose.yml --with-registry-auth frontira
```