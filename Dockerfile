FROM jenkins/jenkins:2.332.2-jdk11
MAINTAINER bjosephjefries@gmail.com
USER root
RUN apt-get update && apt-get install -y lsb-release && apt-get install nano && apt-get install -y default-jre
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli && apt-get install -y wget
RUN echo "blueocean:1.25.3" > plugins.txt
RUN echo "docker-workflow:1.28" > plugins.txt
RUN wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.3/jenkins-plugin-manager-2.12.3.jar
RUN java -jar jenkins-plugin-manager-*.jar --available-updates --plugins blueocean:1.25.3 docker-workflow:1.28
RUN apt-get -y install default-jre
USER jenkins
RUN jenkins-plugin-cli --plugin-file /plugins.txt --plugins delivery-pipeline-plugin:1.3.2 deployit-plugin
LABEL description="Jenkins installation on docker"
LABEL createdBy="JoshuaJosephJefries"