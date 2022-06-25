# Jenkins

<img width="795" alt="pipeline" src="https://user-images.githubusercontent.com/79646955/167696932-1c82e1e4-a266-4ee0-b4c9-7f29111b002f.png">

##JENKINS INSTALLATION USING DOCKER CONTAINER

1. Create a bridge network: "docker network create jenkins"
   - A bridge network is a Link Layer device which forwards traffic between network segments.

2. Create a docker dind to execute docker commands inside jenkins node
   
> docker run --name jenkins-docker --rm --detach --privileged --network jenkins --network-alias docker --env DOCKER_TLS_CERTDIR=/certs --volume jenkins-docker-certs:/certs/client --volume jenkins-data:/var/jenkins_home --publish 2376:2376 docker:dind --storage-driver overlay2

3. Create a dockerfile. Refer the code from this repository.

4. Build the docker container: (Refer the file from repository)

> docker build -t myjenkins-blueocean:2.332.2-1 .

5. Run the docker container:

 > docker run --name jenkins-blueocean --rm --detach --network jenkins --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --publish 8080:8080 --publish 50000:50000 --volume jenkins-data:/var/jenkins_home  --volume jenkins-docker-certs:/certs/client:ro myjenkins-blueocean:2.332.2-1

6. Proceed to the Post-installation setup wizard :+1:

---------------------------------------------------------------
Plugins for Slack in Jenkins:
<ul> 
  <li> Slack Notifications Plugin </li>
  <li> Build User Vars </li>
</ul>
