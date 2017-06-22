FROM cloudbees/cloudbees-jenkins-team

USER root

#Add Maven
RUN apt-get update && apt-get -y install maven

#Add Docker
RUN curl -sSL https://get.docker.com/ | sh
