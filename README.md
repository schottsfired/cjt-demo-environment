# CloudBees Jenkins Team Demo

## Configure
Create an .env file in this directory that contains the path to your Maven .m2 directory:

    ``echo "USER_M2=/Users/David/.m2" >> .env``

Also see ``.env.sample``.

If you don't have Maven, or you have Maven and don't care about speedy builds, then remove ``${USER_M2}:/root/.m2`` from the ``Dockerfile`` entirely.

## Build
    ``docker-compose --build``

## Start
    ``docker-compose up -d``

## Logs
    ``docker-compose logs -f``

## Stop
    ``docker-compose down``
