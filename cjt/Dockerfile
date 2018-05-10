FROM cloudbees/cloudbees-jenkins-team

LABEL app-name="cjt-demo-environment"

USER root

#Install plugin(s) that are not bundled by default
ENV JENKINS_UC http://jenkins-updates.cloudbees.com
ADD https://raw.githubusercontent.com/jenkinsci/docker/master/install-plugins.sh /usr/local/bin/install-plugins.sh
RUN chmod +x /usr/local/bin/install-plugins.sh
ADD https://raw.githubusercontent.com/jenkinsci/docker/master/jenkins-support /usr/local/bin/jenkins-support
RUN chmod +x /usr/local/bin/jenkins-support
RUN /usr/local/bin/install-plugins.sh swarm

#Update & Upgrade OS
RUN apt-get update \
  && apt-get -y upgrade

#Add Maven
RUN apt-get -y install maven --no-install-recommends

#Add Docker
RUN curl -sSL https://get.docker.com/ | sh

#Add Docker Compose
RUN apt-get -y install docker-compose