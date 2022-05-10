# Jenkins

##DOCKER INSTALLATION

1. Create a bridge network: "docker network create jenkins"
   - A bridge network is a Link Layer device which forwards traffic between network segments.

2. Create a docker dind to execute docker commands inside jenkins node
   
 > docker run \
 >>   --name jenkins-docker \
 >>   --rm \
 >>   --detach \
 >>   --privileged \
 >>   --network jenkins \
 >>   --network-alias docker \
 >>   --env DOCKER_TLS_CERTDIR=/certs \
 >>   --volume jenkins-docker-certs:/certs/client \
 >>   --volume jenkins-data:/var/jenkins_home \
 >>   --publish 2376:2376 \
 >>   docker:dind \
 >>   --storage-driver overlay2

3. Create a dockerfile. Refer the code from this repository.

4. Build the docker container: "docker build -t myjenkins-blueocean:2.332.2-1 ." (Refer the file from repository)

5. Run the docker container:

 > docker run \
 >>   --name jenkins-blueocean \
 >>   --rm \
 >>   --detach \
 >>   --network jenkins \
 >>   --env DOCKER_HOST=tcp://docker:2376 \
 >>   --env DOCKER_CERT_PATH=/certs/client \
 >>   --env DOCKER_TLS_VERIFY=1 \
 >>   --publish 8080:8080 \
 >>   --publish 50000:50000 \
 >>   --volume jenkins-data:/var/jenkins_home \
 >>   --volume jenkins-docker-certs:/certs/client:ro \
 >>   myjenkins-blueocean:2.332.2-1

6. Proceed to the Post-installation setup wizard :+1:
