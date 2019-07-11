# Kubernetes

An orchestration tool for microservices (Docker containers)

What we want to know: 
    - how secrets are intended to be used
    - how those secrets are stored
    - and how it protects against them being misused

# What is a Kubernetes cluster?

A cluster consists of at least one master node and several worker nodes. The master node runs the API server, the scheduler and the controller manager, and the actual application is deployed dynamically across the cluster.

# Storage Classes and Dynamic Provisioning

Storage classes and dynamic provisioning are crucial in Kubernetes execution.

## Mounted Volumes

Mounted volumes can be referenced by multiple pods

## Separation of concerns

Kubernetes functions by keeping applications in a component-like structure, so that we can swap and test individual components easily.

- Kubernetes is like an OS for clusters
- Enables portability
- *"Write once, run anywhere"*
    - Kubernetes API is meant to take care of the implementation details for you

## Persistent Volume (PV) API Object and Persistent Volume Claim (PVC) API Object

The PV is a piece of networked storage in the cluster, it is NOT used directly in a pod. It exists outside of any pod, and if a pod were to crash the volume would persist and retain the information stored in it.

The PVC isa request for storage by a user, claims request a specific size and access modes of storage. Your pods will *reference* claims.

This is crucial in how Kubernetes functions as a portble application. If we can reference a PV in a pod, it makes it so we do not have to change the pod definition if that storage itself needs to change in any way.

## Dynamic Provisioning and Storage class

Allows storage to be created on-demand (when requested by a user), and eliminates the need for cluster admins to pre-provision storage

## Kubernetes storage class

Storage classes allow an administrator to describe the "classes" of storage they offer, such as:

- Quality-of-service levels
- backup policies

In other systems storage classes may be referred to as **profiles**.

### Source

https://www.youtube.com/watch?v=qktFhjJmFhg

# Pods

A pod is a group of one or more containers with shared storage/netwrok, and a specification for how to run the containers.

Containers within a Pod share an IP address and port space, and can find each other via localhost. Applications within a pod



# Kubernets and self-signed certificates

This project will require the use of self-signed certificates which are described as follows:

You create a privKey and pubKey for secure communication on your machine, and then create another pair of privKey and pubKey so you become your *own* CA


## Possible solution

- https://linuxacademy.com/cp/courses/lesson/course/3052/lesson/4/module/221
- Kubernetes offocial documentation on certificate
    - https://kubernetes.io/docs/concepts/cluster-administration/certificates/
# Kubernetes Secrets in our example

The secrets are stored in ServiceAccounts (https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/), and processes in containers can also contact the apiserver. When a specific service look to contact the apiServer, and when this is done they are authenticated as a particular ServiceAccount.

# Kubernetes Secrets General

1. Secrets can be mounted as data volumes or exposed as environment variables to be used by a container in a pod
    - In our scenario they are exposed as envirnment variables
2. You must modify your pod definition to add a volume if using a volume for secrets

# Tutorial
- https://www.youtube.com/watch?v=aSrqRSk43lY