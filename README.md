# CloudBees Jenkins Team Demo

## Features
* [CloudBees Jenkins Team](https://www.cloudbees.com/products/cloudbees-jenkins-team) Master and Agent(s) run as Docker containers
* Agents can be spawned and destroyed dynamically
* All executors support [Maven](https://maven.apache.org/) and [Docker Pipeline](https://wiki.jenkins.io/display/JENKINS/Docker+Pipeline+Plugin)

## Initial Setup
This demo requires that you have [Docker](https://www.docker.com/get-docker) and [Maven](https://maven.apache.org/) installed.

Open a terminal at this repo location and run `cp .sample.env .env` to create local file called `.env` based on the sample. Then modify `.env` to make it specific to your environment. You should only need to touch ``USER_M2``, all others may remain as-is.

Finally, run ``make`` to let Docker do its thing.

NOTE: If any configuration files are modified, like ``plugins.txt`` or ``/init.groovy.d/*.groovy``, then run ``make`` again to build new images.

## Starting and Stopping
To start CJT, run ``docker-compose up``. Logs will be streamed to the console, and CJT can be stopped with `^c`. Alternatively you can run CJT detached using ``docker-compose up -d``, access logs with ``docker logs cjt``, and stop using ``docker-compose down``.

You may then access CJT at http://localhost:9090 and complete the Getting Started wizard.

To start Agent(s), run ``make agent``. To stop all Agents, run ``make stop``. 

To clean up images, run ``make clean``.

NOTE: [Swarm](https://wiki.jenkins.io/display/JENKINS/Swarm+Plugin) Agents require a user with appropriate permissions to connect to CJT. The default is admin/admin and you can change it in your ``.env`` if necessary (e.g. you did not change the initialAdminPassword during the Getting Started wizard).

## Adding Plugins and Groovy Scripts

To test new plugins and groovy scripts, make your changes in either ``plugins.txt`` or ``/init.groovy.d/descriptive-name.groovy``, then run ``make`` to build new images with your changes, then run ``docker-compose up`` to see the change reflected in Jenkins. It may be helpful to delete local directories while testing, for example ``/data/plugins``.

## CI/CD Demos
Try running http://github.com/schottsfired/sample-rest-server on me with [Blue Ocean](https://jenkins.io/projects/blueocean/)! But first, add a username/password credential in Jenkins with ID 'dockerhub', where the password is the API Key from your account page on http://cloud.docker.com. Then, update the ``Jenkinsfile`` ``environment {}`` in your fork of sample-rest-server so that the image is pushed to your own account. Lastly, don't forget to ``make agent`` and ``make sonar`` before running builds.