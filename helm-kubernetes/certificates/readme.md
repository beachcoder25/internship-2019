# Certificates

Certificates allow the authentication of parties in a conversation. The cliet will authenticate the sever and the server can authenticate the client.

- Enables first steps m the TLS handshake
- Certificate Authority (CA)
- Certificate Signing Request (CSR)

## Why certificates are important in Kubernetes?

We want all of the components used, such as in a cluster, to authenticate eachother.

### Cluster CA

- Cluster CA is the trusted root for the entire cluster
- All cluster certificates are signed by the cluster CA
- Used by components to validate API server, etc

### API Server HTTPS

- Serving certificate and key are required for HTTPS
- Serving certificate is signed by Cluster CA
- Components authenticate the API server
- Configured using --tls-cert-file and --tls-private-key-file flags

### Kubelet HTTPS

- The kubelet exposes an API over HTTPS
- Consumer by API server when getting logs, metrics, exec, etc...
- Serving certificate and key are required for HTTPS
- Certificate is signed by Cluster CA
- API server authenticates the kubelet
- Access to the Kubelet API is protected by authentication and authorization
- The Kubelet authenticates clients using client certificates
- API server has a kubelet client certificate that is signed by Cluster CA

### X.509 Client Cert Authentication

How can a server authenticate a client?

- Strategy for authenticating requests that present a client certificate
- Mainly use by Kubernetes components, but can also be used for end user authentication
- Any request that presents a client certificate signed by the Cluster CA is authenticated
- User is obtained from the Common Name (CN) field
- Groups are obtained from Organization field
- Each Kubernetes core component has its ownl client certificate (Reference table below)
       - <img src="../../images/table.png" width="350">

### Kubelet Client Certificates

- Each Kubelet on the cluster has its own identity
- Achieved by having Kubelet-specific client certificates
- Enables the use of the Node Authorizer and Node Restrictaion Admission Plugin
- Limit Kubelet read and write access to resources that are related to the node itself and pods bound to the node

### Certificate Generation API

- Kubernetes offers an API to request certificates       
       
       certificates.k8s.io/v1bet1
- Clients create a certificate signing request and send it to the API server
- The requesting user is stored as part of the CSR resource
- CSR remains in a pending state, until approved by a cluster admin
- The certificate is issued once the CSR request is approved 
       


## Source

https://www.youtube.com/watch?v=gXz4cq3PKdg

# openSSL

To obtain an SSL certificate from a CA, you must make a signing request to the CA, this is called a Certificate Signing Request (CSR).

# Self-signed certificates

We can self-sign certificates when we do not require a CA-signed certificate.

## Generate self-signed certificate

This will create a 2048-bit private key (domain.key) and a self-signed certificate (domain.crt):

```sh 
openssl req \
       -newkey rsa:2048 -nodes -keyout domain.key \
       -x509 -days 365 -out domain.crt
```

To view and verify the contents of a CSR (domain.csr) in plain text:

```sh
openssl req -text -noout -verify -in domain.csr
```

To view and verify the contents of a CRT in plain text:

```sh
openssl x509 -text -noout -in domain.crt
```
# Sources

- https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs