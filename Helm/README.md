# Installing Frontira with Helm Charts

## Prerequisites

### Helm
You will need [Helm](https://helm.sh/) installed on the client side and Tiller installed in the Kubernetes cluster. To enable Tiller follow this [Guide](https://docs.helm.sh/using_helm/#initialize-helm-and-install-tiller)

### Secrets
Since the images being used is private you have to add a secret to Kubernetes to be able to fetch the private images from docker hub. 
To add a secret to Kubernetes: 
```bash
kubectl create secret docker-registry dockerhub --docker-username=<your-name> --docker-password=<your-password> --docker-email=<your-email>
```

## Installing the charts
```bash
helm install ./frontira/
```