# CloudBees Jenkins Team Demo

## Features
* [CloudBees Jenkins Team](https://www.cloudbees.com/products/cloudbees-jenkins-team) Master and Agent(s) run as Docker containers
* Agents can be spawned and destroyed dynamically
* All executors support [Maven](https://maven.apache.org/) and [Docker Pipeline](https://wiki.jenkins.io/display/JENKINS/Docker+Pipeline+Plugin)

## Initial Setup
This demo requires that you have [Docker](https://www.docker.com/get-docker) and [Maven](https://maven.apache.org/) installed.

Open a terminal at this repo location and run `cp .sample.env .env` to create local file called `.env` based on the sample. Then modify `.env` to make it specific to your environment. You should only need to touch ``USER_M2``, all others may remain as-is.

Finally, run ``make`` to let Docker do its thing.

## Starting and Stopping
To start CJT, run ``docker-compose up``. Logs will be streamed to the console, and CJT can be stopped with control+C. Alternatively you can run CJT detached using ``docker-compose up -d``, access logs with ``docker logs cjt``, and stop using ``docker-compose down``.

You may then access CJT at http://localhost:9090 and complete the Getting Started wizard.

To start Agent(s), run ``make agent``. To stop all Agents, run ``make stop``.

NOTE: [Swarm](https://wiki.jenkins.io/display/JENKINS/Swarm+Plugin) Agents require a user with appropriate permissions to connect to CJT. The default is admin/admin and you can change it in your ``.env`` if you wish.

## Upgrading
To upgrade to a newer version, first stop CJT with control+C or ``docker-compose down``, then stop Agents with ``make stop``, then run ``make upgrade``.

## CI/CD Demo
Try running http://github.com/schottsfired/sample-rest-server on me! You will need to add credentials, update the ``Jenkinsfile`` environment variables, and be sure to ``make agent`` and ``make sonar`` before giving it a spin.