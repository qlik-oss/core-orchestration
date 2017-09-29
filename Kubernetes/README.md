## Prerequisites for deploying to Kubernetes

### Kubernetes
You will need a Kubernetes enviroment. 
If you would like to setup a local enviroment follow this guide: [Install Minikube](https://kubernetes.io/docs/getting-started-guides/minikube/) 

### Secrets
Since the images being used is private you have to add a secret to Kubernetes to be able to fetch the private images from docker hub. 
To add a secret to Kubernetes: 
```bash
kubectl create secret docker-registry dockerhub --docker-username=<your-name> --docker-password=<your-password> --docker-email=<your-email>
```

## Choose deployment type

### [Helm](Helm/README.md)

### [Plain](Plain/README.md)