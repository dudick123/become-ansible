# Become Ansible Commands

## Build the base image
Refer to the current Dockerfile for the base image layers. There was an issue installing git at the with per libraries and dependencies, so that was moved to one of the first build steps.

```
FROM ubuntu:18.04

RUN apt-get update; \
    apt install -y openssh-client; \
    apt install -y python3-pip

RUN pip3 install --upgrade pip; \
    pip3 install "ansible==2.9.12"

```

## Outline of basic Docker commands used in creating and running the image.

### Build the image in the current directory; no name or tag
```
docker build .
```


### List the images in the cache
```
docker images
```
### build the image and name it and tag it
```
docker build -t ansible:latest .
```

### run the ansible image as a container
```
docker run ansible
```

### list all running containers
docker ps

### list all containers, running or stopped
```
docker ps --all
```

### run the ansible image and use an interactive tty to get to the command prompt 
```
docker run -it ansible
```

### inside the container, at the command prompt, run the ansible command to get the version
```
ansible --version
```

### run the ansible image, with a terminal, but remove it when you exit
```
docker run -it --rm ansible
```

### run the asible image, but mount the current directory as ansible

```
docker run -it --rm --volume "$(pwd):/ansible" ansible
```

###  run the asible image, but mount the current directory as ansible, and set the working directory

```
docker run -it --rm --volume "$(pwd):/ansible" --workdir /ansible ansible
```

### run the ansible immage, but pass in environment variables for an azure subscription

```
docker run -it --rm --volume "$(pwd):/ansible" --workdir /ansible \
--env "AZURE_SUBSCRIPTION_ID=<Azure_Subscription_ID>" \
--env "AZURE_CLIENT_ID=<Service_Principal_Application_ID>" \
--env "AZURE_SECRET=<Service_Principal_Password>" \
--env "AZURE_TENANT=<Azure_Tenant>" \
ansible
```

### echo the environment variable back
```
printenv AZURE_TENANT
```