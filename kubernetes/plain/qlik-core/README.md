# Kubernetes

## EULA

You accept the EULA by modifying [engine-deployment.yaml](./engine-deployment.yaml),
then run the example.

## License

To supply your license before running the example you run the command:

```bash
kubectl create configmap license-data --from-literal LICENSE_KEY=YOUR-LICENSE-KEY
```
