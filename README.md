# Docker

### What is Docker?
- It's an open source platform for containerization
- Docker enables you to separate your applications from your infrastructure so you can deliver software quickly
- You run applications in loosely isolated environments called `containers`

<br>

### Why docker?
- Multi-billion dollar companies are using Docker every day
- Docker adoption is predicted to have been 50% at the end of 2020 

<br>

### What's the difference between a VM and a container?

![](images/vmcontainers.jpg)

- Docker is more light weight and only shares the resources of an OS rather than using the OS completely

- As they are isolated, one can run many containers simultaneously on a given host. Containers are lightweight as they don't require the extra load of a hypervisor but also runs directly in the kernel.
    - You can run more containers in a given machine than you can VMs

- What is a hypervisor?
    - A hypervisor, also known as a virtual machine monitor or VMM, is software that creates and runs virtual machines (VMs). A hypervisor allows one host computer to support multiple guest VMs by virtually sharing its resources, such as memory and processing. 

<br>

### Main commands
- Refer to the documentation [here](https://docs.docker.com/engine/reference/commandline/docker/)

- `docker pull <name>` - will pull an image or repo from the registry
- `docker run <name>` - run a command in a new container
- `docker commit <name>` - creates a new image from a container's changes
- `docker build <name>` - builds an image from a Dockerfile

- `docker start <name>` - start one or more containers
- `docker stop <container_id>` - stop one or more containers
- `docker ps <name>` - lists containers
- `docker exec <name>` - runs a command in a running container
- `docker images` - lists all images

<br>

### How does it work?

![](images/docker1.jpg)

- Running commands in CLI passes them into the Docker daemon (the background process) 
    - If you need to `pull` images it will take it from the registry and download it into your docker desktop
    - If you have the image avalable already, it will not need to download it from the registry

<br>

### Starting and stopping containers
- When we `pull` any images from dockerhub, we can run them within containers

- To check the images you currently have, you can `docker images`

- To start a container with an image, you can `docker run -d -p <port>:<docker port> <image-name>`
    - If you run `docker ps` you can see any running containers
    - To stop a container you can `docker stop <id>`
    - You can check available containers with `docker ps -a`
    - To start a container again you can `docker start <id>`
    - TO remove a container from the list of available containers you can `docker rm <id>`