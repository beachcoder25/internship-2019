

# Kubernetes

Strictly speaking it is cnsidered a container management platform

**PODS:** Essentially a scheduling unit
- Each POD has it's own IP Address, this address only works within the cluster
- Rarely more than one container per pod

**Deployment:** A group of pods
- Deployments help your pods reach their desired state
    - An example of this is a deployment with 3 pods, if you were to kill 1 of those pods, the deployment would automatically replace that pod to bring it back to the desired state
    - You define Deploymet controller ensures we always work towards the defined desired state

**Services:** A group of pods or deployments, providing a dependable endpoint for the pods to talk to eachother (Such as a front-end service communicating with a back-end service)

**Ingress Controller:** How traffic outside of the cluster is routed inside the cluster

# Helm: Version control a deployment

**Chart:** Describes a group of manifest files(Like the state of each deployment that you have)

**Ingress Diagram:**

<img src="../../images/ingress-chart.png" width="300">

# Good to knows

You can attach to a pod and run cli arguments, such as seeing the version of nginx running inside your pod:
```sh
kubectl exec <Pod Name> -- nginx -v
```
# Source

https://www.youtube.com/watch?v=vQX5nokoqrQ