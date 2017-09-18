# CloudBees Jenkins Team Demo

## Features
* Jenkins Master and Agent(s) run as Docker containers
* Agents can be spawned and destroyed dynamically
* All executors support [Maven](https://maven.apache.org/) and [Docker Pipeline](https://wiki.jenkins.io/display/JENKINS/Docker+Pipeline+Plugin)

## Initial Setup
This demo requires that you have [Docker](https://www.docker.com/get-docker) installed.

Modify the ``.env.sample`` file to make it specific to your environment. You should only need to touch ``USER_M2``, all others may remain as-is. Then run ``cp .env.sample .env`` to initialize the environment.

Finally, run ``make`` to let Docker do its thing.

## Starting and Stopping
To start CJT, run ``docker-compose up``. Logs will be streamed to the console, and CJT can be stopped with control+C. Alternatively you can run CJT detached using ``docker-compose up -d``, access logs with ``docker logs cjt``, and stop using ``docker-compose down``.

To start Agent(s), run ``make agent``. To stop all Agents, run ``make stop``.

NOTE: [Swarm](https://wiki.jenkins.io/display/JENKINS/Swarm+Plugin) Agents require a user with appropriate permissions to connect to CJT. The default is admin/admin and you can change it in your ``.env`` if you wish.

## Accessing
After starting CJT, you will find it running in your browser at http://localhost:9090.

## Upgrading
To upgrade to a newer version, run ``make upgrade``.
