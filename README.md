# Containerisation with Docker

## What is Docker

- Docker is an open-source platform
- It enables us to separate applications from the infrastructure
- It allows to deliver software faster
- Docker is written in GO language

[Docker is an open platform](https://docs.docker.com/get-started/overview/) for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.

### Why Docker

- Multi-billion dollar companies are using or adapting Docker
- Docker adoption is anticipated by 50% by the end of 2020

### Virtual Machines vs. Docker

- Docker is lightweight and user-friendly
- Docker shares the resources of OS as opposed to using the OS completely
- Docker engine connects the container with the OS and only uses the resources required
- VM works with Hypervisor to connect guest OS/VM with Host OS

![](images/vm_container.png)


### Demand and Future of Docker

### Docker API

![](images/architecture.png)


### Docker Commands

- ``docker pull <image_name>``
- ``docker run <image_name>`` (``hello-world`` to pull and run hello-world to ensure everything installed correctly)
- ``docker images`` to see available images
- ``docker build -t <image_name>``
- ``docker commit <image_name>/<container-id>``
- ``docker start <container-id>``
- ``docker stop <container-id>``
- ``docker rm <container-id>``
- ``docker rmi <image_name>``
- ``docker ps and ps -a``` to check the existing containers

```
docker run -d -p 80:80 <image_name>
```
- ``-d``: Detached, by design, containers started in detached mode exit when the root process used to run the container exits, unless ``--rm`` is also specified
- ``-p``: To explicitly map a single port or range of ports

For documentation to be available on localhost
```docker run -d -p 4000:4000 docs/docker.github.io```

- ``docker cp <filename> <container_id>:dir/to/path`` to copy files from local to container
### Logging into a Running Container

``docker exec -it <image_name>/<container-id>``

**FOR WINDOWS RUN FIRST**
```
alias docker="winpty docker"
```

- ``docker history <image_name>`` to view history
- ``docker inspect <image_name>`` to inspect more closely (can see what terminal commands are being run)
- ``docker logs <container_id>`` to view logs of container
	- can redirect to logs file with ``>> logs.txt`` (must be run with ``docker`` and not alias of ``winpty docker``)


### DockerHub

- Repository name and local folder name must match
- Commit to save changes to image, then push to dockerhub (will default tag to "latest")
```
docker commit <container_id> ldaijiw/repo_name
docker push ldaijiw/repo_name
```
- Due to the architecture of Docker, when creating a new container from the image, the daemon will search locally first instead of finding the latest version from the online registry, and so after pushing to Docker delete the image with
```
docker image rm <image_name>
```
- Running the image again will prompt the daemon to search online for the latest version of the image

### Building a Docker Image

- To build a docker image need to create a Dockerfile
- To automate tasks in an image/container
- Information required inside Dockerfile
	- Depends on client requirements
	- Dependencies to run the app/db
- Need to wrap dependencies in Dockerfile as well as the execution commands

**Syntax**

- ``FROM``: used to tell docker which base image to use to build new image
- ``LABEL``: Add labels (e.g. add maintainer ``MAINTAINER=lwaltmann@spartaglobal.com``)
- ``COPY``: files/folders from localhost to container/image
- ``EXPOSE``: to map ports
- ``CMD``: to execute terminal commands
	- e.g. for nginx: ``["nginx", "-g", "daemon off"]``

## Microservices

- Idea is to split your application into a set of smaller, inter-connected services that are:
	- Highly maintainable and testable
	- Loosely coupled
	- Independently deployable
	- Organised around business capabilities
	- Owned by small teams

### Microservices vs. Monolithic Architecture

A monolithic application is built as a single unit that combines the UI, business logic, and data access layer into one. In contrast, microservices separates the application into smaller units/services that perform one action.

Monolithic architectures can be helpful for smaller projects as it reduces complexity, but for bigger, more important projects where downtime can result in severe loss of business, microservices are beneficial for not having a single point of failure, as well as making it simpler to replace containers that break, and making the process of scaling out easier.

![](images/mservice_mono.png)
