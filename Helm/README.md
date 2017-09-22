# Installing Frontira with Helm Charts

## Prerequisites

### Helm
You will need [Helm](https://helm.sh/) installed on the client side and Tiller installed in the Kubernetese cluster. To enable Tiller follow this [Guide](https://docs.helm.sh/using_helm/#initialize-helm-and-install-tiller)

### Secrets
Since the images being used for Frontira is private you have to add a secret to Kubernetese to use to fetch the private images from docker hub. 
To add a secret to Kubernetese: 
```bash
kubectl create secret docker-registry dockerhub --docker-username=<your-name> --docker-password=<your-password> --docker-email=<your-email>
```

## Installing the Frontira charts
```bash
helm install ./frontira/
```