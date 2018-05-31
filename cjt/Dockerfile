FROM cloudbees/cloudbees-jenkins-team

LABEL app-name="cjt-demo-environment"

USER root

# add config file
COPY jenkins.yaml /usr/share/jenkins/ref/

# add environment variable to point to configuration file
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/jenkins.yaml

#Install plugin(s) that are not bundled by default
ENV JENKINS_UC http://jenkins-updates.cloudbees.com
# ENV JENKINS_UC http://updates.jenkins-ci.org/experimental/update-center.json
ADD https://raw.githubusercontent.com/jenkinsci/docker/master/install-plugins.sh /usr/local/bin/install-plugins.sh
RUN chmod +x /usr/local/bin/install-plugins.sh
ADD https://raw.githubusercontent.com/jenkinsci/docker/master/jenkins-support /usr/local/bin/jenkins-support
RUN chmod +x /usr/local/bin/jenkins-support
# RUN /usr/local/bin/install-plugins.sh swarm configuration-as-code workflow-multibranch:2.9.2 workflow-cps-global-lib javadoc
COPY plugins.txt plugins.txt
RUN /usr/local/bin/install-plugins.sh $(cat plugins.txt)

#Update & Upgrade OS
RUN apt-get update \
  && apt-get -y upgrade

#Add Maven
RUN apt-get -y install maven --no-install-recommends

#Add Docker
RUN curl -sSL https://get.docker.com/ | sh

#Add Docker Compose
RUN apt-get -y install docker-compose
