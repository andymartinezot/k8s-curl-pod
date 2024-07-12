# k8s-curl-pod
This is sample repository to deploy two pods in different (or the same) namespaces to test the connectivity using the curl command.

### DISCLAIMER
This repository is based on the example provided by Istio in order to test the Mutual TLS configuration. you can find all the information [here](https://istio.io/latest/docs/tasks/security/authentication/mtls-migration/).

The idea to bring it here is to be able to customize it in order to know exactly what we are going to install and make changes if necessary.


## Project Structure
```
.
├── README.md
├── curl.sh
├── httpbin.yaml
└── sleep.yam
```

## Prerequisites

- Kubernetes Cluster running
- [Kubectl CLI](https://kubernetes.io/docs/reference/kubectl/)