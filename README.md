# Frontira Core Recipe

[![CircleCI](https://circleci.com/gh/qlik-ea/core.svg?style=shield&circle-token=2750d5c49c0348549db4f4518aa2e85da2822452)](https://circleci.com/gh/qlik-ea/core)

This repository contains the assets of the Frontira Core recipe. For an overview of all Frontira recipes, refer to the Frontira [info](https://github.com/qlik-ea/info) repo.

## Container Orchestration

This recipe provides examples of deployment of the Frontira core services using the following container orchestration platforms:

- [Docker Swarm](./docker-swarm/)
- [Kubernetes](./kubernetes/)
- [Nomad](./nomad/) (Experimental)

## Licensing

Since QIX Engine runs under a license model, the examples require licensing configuration to be done. It should be clear in each example, and with the information provided below, how to do this.

**NOTE**: The examples do not yet contain these configuration options since QIX Engine does not yet support it. Examples will be updated as soon as this becomes available.

### Configuring the License Service

The License Service must be provided two environment variables that tells the service which license to use. These are:

- `LEF_SERIAL` - The LEF serial number which identifies the license to use.
- `LEF_CONTROL` - A control number used to validate the LEF serial number.

Both these will be provided by Qlik when receiving license details of the QIX Engine. In a docker-compose file, this could be done like this:

```yml
version: "3.0"
services:
  license-service:
    image: qlikea/license-service:<version>
    ports:
      - 9200:9200
    environment:
      - LEF_SERIAL=<LEF serial number here>
      - LEF_CONTROL=<LEF control number here>
...      
```

### Configuring the QIX Engine

When running, the QIX Engine periodically communicates with the License Service to ensure that it is running under a valid license. QIX Engine deployments must be configured with the URL to use for accessing the Licence Service REST API. This is done by providing the `LicenseServiceURL` command switch to the engine. In a docker-compose file this would typically look like:

```yml
version: "3.0"
services:
  qix-engine:
    image: qlikea/engine:<version>
    ...
    command: -S LicenseServiceURL=license-service:9200
...
```


