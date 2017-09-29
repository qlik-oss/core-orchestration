# Deploying Frontira with Helm Charts

## Prerequisites

Make sure you have followed the prerequisites from [Deploy with Kubernetes](../README.md)

### Helm
You will need [Helm](https://helm.sh/) installed on the client side and Tiller installed in the Kubernetes cluster. To enable Tiller follow this [Guide](https://docs.helm.sh/using_helm/#initialize-helm-and-install-tiller)

## Deploying the charts
```bash
helm install ./frontira/
```