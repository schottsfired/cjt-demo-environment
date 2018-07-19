# CloudBees Jenkins Team Demo

## Features
* [CloudBees Jenkins Team](https://www.cloudbees.com/products/cloudbees-jenkins-team) Master and Agent(s) run as Docker containers
* Agents can be spawned and destroyed dynamically
* All executors support [Maven](https://maven.apache.org/) and [Docker Pipeline](https://wiki.jenkins.io/display/JENKINS/Docker+Pipeline+Plugin)

## Initial Setup
This demo requires that you have [Docker](https://www.docker.com/get-docker) and [Maven](https://maven.apache.org/) installed.

Open a terminal at this repo location and run `cp .sample.env .env` to create local file called `.env` based on the sample. Then modify `.env` to make it specific to your environment. You should only need to touch ``USER_M2`` and the DockerHub API Key (from http://cloud.docker.com), all others may remain as-is.

Finally, run ``make`` to let Docker do its thing.

NOTE: If any configuration files are modified, like ``jenkins.yaml``, ``plugins.txt``, or ``/init.groovy.d/*.groovy``, then run ``make`` again to build new images.

## Starting and Stopping
To start CJT, run ``docker-compose up``. Logs will be streamed to the console, and CJT can be stopped with `^c`. Alternatively you can run CJT detached using ``docker-compose up -d``, access logs with ``docker logs cjt``, and stop using ``docker-compose down``.

You may then access CJT at http://localhost:9090 and complete the Getting Started wizard.

To start Agent(s), run ``make agent``. To stop all Agents, run ``make stop``. 

To clean up images, run ``make clean``.

NOTE: [Swarm](https://wiki.jenkins.io/display/JENKINS/Swarm+Plugin) Agents require a user with appropriate permissions to connect to CJT. The default is admin/admin and you can change it in your ``.env`` if necessary (e.g. you did not change the initialAdminPassword during the Getting Started wizard).

## CI/CD Demos
Thanks to the [Configuration as Code Plugin](https://github.com/jenkinsci/configuration-as-code-plugin), demos are built in! A [Sample Rest Server](https://github.com/cloudy-demos/sample-rest-server) is available out of the box, which uses [Pipeline Shared Libraries](https://github.com/cloudy-demos/pipeline-libraries) as a form of templating.