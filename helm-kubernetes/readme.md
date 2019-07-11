# CLI Tool

This project looks to implement a DevOps tool that can integrate into the software development-lifecycle, and will allow us to easily retrieve and sort credentials

## Goal of the project

Our shell script does everything, and running it will start up all services required for the application to run properly.

# Script flow of control

Our script follows these steps when it is ran:
1. Sets WORKING_DIRECTORY to directory you are running script from
2. Looks to do a clean installation if possible
3. Asks us for our registry credentials
    - We don't need to worry about these for our implementation
4. Creates a name for the repo we would like to create to house project
5. Creates docker registry secret
    - We don't need to worry about these for our implementation
6. Creates AppSetting secrets script
7. Creates cert secrets script

## Step 6 in-depth

This script essentially converts our appsettings.json into service specific apssettings.json files such as the service for auditor, we will now have an auditor-appsettings.json file in our directory. 

That is done in this line from the script:
```sh
cp ${PBDO_ROOT_PATH}/${PROJECT_DIR}/appsettings.json ${WORKING_DIR}/${SERVICE}-appsettings.json
```

Once these are created, we then create individual directories for each service:

- auditor
- authenticator
- authorizer
- healthmonitor
- keymanager
- lockbox
- standardgateway

We 


## Step 7 in-depth

Summary of script:
1. Calls clean_certs.sh script
    - Which states it "Cleans any certs or signing requests which already exist"
2. There are 3 additional components to this project, RabbitMQClient, RabbitMQ, and ELK, each of which must have existing secrets removed, and new secrets created.
    - Old secret is deleted
    - New cert is created
    - Secrets are created for both cert.pem and key.pem
    - Code example:
    ```sh
    echo "Removing any pre-existing secret for this cert."
    kubectl delete secret elkcertsecret
    source ./create_cert.sh elk server
    kubectl create secret generic elkcertsecret --from-file=elk/cert.pem --from-file=elk/key.pem
    ```
    

# Components of this project

We will be using a handful of tools in this project, the most significant being:
- Kubernetes
- Helm
- Docker
- Shell Script
- RabbitMQ (Messaging client)


## Helm

- Helm helps you manage Kubernetes application
- Should spin up image on local machine, dependencies included

## Shell Script

Our script should pull from the repository and get everything up and running

# Things to keep in mind

- We will be authenticating to our Docker registry 
    - Anywhere "their" registry is mentioned, it should be referring to "our" registry
- We will not be using Azure
    - Anytime "install on Azure" is mentioned, treat it as "install on your Mac"