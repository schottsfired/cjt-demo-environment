# Image installs with latest Java 8 OpenJDK on Alpine Linux
FROM openjdk:8-jdk-alpine

LABEL app-name="cjt-demo-environment"

USER root

# Update and upgrade then install curl, Maven, Git, and Docker
RUN apk update && \
	apk upgrade && \
	apk --no-cache add curl && \
	apk --no-cache add maven && \
	apk --no-cache add git && \
	apk --no-cache add docker

# Download the latest Jenkins swarm client with curl - version 3.4
# Browse all versions here: https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/
RUN curl -O https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.4/swarm-client-3.4.jar