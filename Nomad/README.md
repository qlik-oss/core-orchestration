# Prerequisites for deploying to Nomad

Please note that deploying to Nomad is not officially supported by the core components.

You will need a Nomad environment, but if you would like to setup a local enviroment follow this guide: [Install Nomad](https://www.nomadproject.io/intro/getting-started/install.html).

## Secrets

Since the images being used are private you have to pass your Docker credentials when you deploy the nomad stack. In this example we use the docker auths that is stored when logging into docker hub i.e. ```docker login```.

Be aware that the docker credentials are stored in plain text in Nomad, see [here](https://www.nomadproject.io/docs/drivers/docker.html#docker-auth-config). In [nomad.hcl](./nomad.hcl) is an example of how the nomad client can be configured to use local docker credentials.

## Privileged mode

Mira uses docker.sock to discover qix-engines and in Nomad this requires a ```privileged``` mode set to true. This is configured in the nomad client config [nomad.hcl](./nomad.hcl) as well as in the task config for [mira](./mira.nomad).

## Deploy

Deploy the core stack with the following commands:

```sh
nomad run ./Nomad/mira.nomad
nomad run ./Nomad/license-service.nomad
nomad run ./Nomad/engine.nomad
```
