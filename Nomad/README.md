## Prerequisites for deploying to Nomad
You will need a Nomad environment
If you would like to setup a local enviroment follow this guide: [Install Nomad](https://www.nomadproject.io/intro/getting-started/install.html)

### Secrets
Since the images being used is private you have to pass your Docker credentials when you deploy the nomad stack. In this example we use the docker auths that is stored when logging into docker hub i.e. ```docker login```.

Be aware that the docker credentials are stored in plain text in Nomad, see [here](https://www.nomadproject.io/docs/drivers/docker.html#docker-auth-config).

## Deploy

Deploy the core stack with the following commands:

```sh
$ nomad run ./Nomad/mira.nomad
$ nomad run ./Nomad/license-service.nomad
$ nomad run ./Nomad/engine.nomad
```
