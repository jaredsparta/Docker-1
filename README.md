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

<br>

### Making docker docs available on our localhost
- We can pull an image from the docs called `docs/docker.github.io`

- We can put this in a container all in one command using `docker run -d -p 4000:4000 docs/docker.github.io`

<br>

### Mapping container ports 

- We can map docker ports to different localhost ports through specifying the `-p` option when using `docker run`
    - For instance, if we wanted to run the `nginx` image on port 4000 (i.e. `localhost:4000`), we would run the command `docker run -d -p 4000:80 nginx`
    - This would map the port 80 from the container (where nginx runs by default) to port 4000 on localhost
- Documentation for `docker run -p` is [here](https://docs.docker.com/engine/reference/commandline/run#publish-or-expose-port--p---expose)

<br>

### Entering a container
- We can enter a container through `docker exec` and run commands in the container using this

- If we wanted to run commands inside the actual container (similar to SSH) we can specify the `-i` option (`i` for "interactive", which keeps STDIN open even if not attached)
    - Further, we can allocate a pseudo-TTY with the `-t` option
    - So finally, `docker exec -it <container_id> bash` will allow us to enter the container and run commands there

- Documentation for `docker exec` is [here](https://docs.docker.com/engine/reference/commandline/exec/)

<br>

### Copying files from local machine into a container
- Make use of `docker cp <path-to-file-on-local-machine> <container-id-or-name>:<path-on-container>`

- So if we wanted to copy a file named `index.html` in the current directory to the nginx default directory, one would use `docker cp index.html <container_id>:/usr/share/nginx/html/`

<br>

### Putting images onto DockerHub
- When we have a container up and running, we can configure it to whatever we like
    - We used the base `nginx` image from DockerHub and input our own `index.html` file on the default page
    - This container can now be made into a new image and pushed onto DockerHub

- We first have to create a new image of the container:
    - Use `docker commit <container_id_or_name> <username_on_dockerhub>/<repo_name>:<tag>`
    - In my case: `docker commit <container_name> jaredsparta/image-1:latest`

- If one runs `docker images`, the image of the container will now be in the list. All we now need to do is push it to DockerHub:
    - Use `docker push <repo_name>`
    - In my case, `docker push jaredsparta/image-1`
    