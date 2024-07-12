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

## Building and Running the sample pods.
Create two namespaces for instance, testapp1 and testapp2, and deploy the sleep component in testapp1 and the httpbin component in testapp2

- Configure namespace testapp1
```
    kubectl create ns testapp1
    kubectl apply -f sleep.yaml
```

- Configure namespace testapp1
```
    kubectl create ns testapp2
    kubectl apply -f httpbin.yaml
```

Verify the connectivity between namespaces by sending http requests (using curl) from the sleep pods, in namespaces testapp1 to httpbin.testapp2. All requests should succeed with return code 200.

- Run the curl.sh script
```
    sh curl.sh
```

Example output:
```
    POD_NAME: sleep-7656cf8794-9gmks
    Curling http://httpbin.testapp2:8000/ip from namespace testapp1
    sleep.testapp1 to httpbin.testapp2: 200
```