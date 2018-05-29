# Kubernetes

## EULA

You accept the EULA by modifying [engine-deployment.yaml](./engine-deployment.yaml),
then run the example.

## License

To supply your license before running the example you run the command:

```bash
kubectl create configmap license-data --from-literal LICENSES_SERIAL_NBR=YOUR-LICENSE-SERIAL-NBR --from-literal LICENSES_CONTROL_NBR=YOUR-LICENSE-CONTROL-NBR
```
