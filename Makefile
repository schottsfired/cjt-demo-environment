.PHONY: agent

include .env

default:
	docker network create cjt-network || true \
	&& docker build --no-cache --pull -f ./cjt/Dockerfile -t cjt ./cjt \
	&& docker build --no-cache --pull -f ./agent/Dockerfile -t swarm-agent ./agent

agent:
	docker run --rm -d \
	--network=cjt-network \
	--volumes-from cjt \
	swarm-agent \
	java -jar swarm-client-3.9.jar \
	-description "CJT Demo Swarm Agent" \
	-master $(AGENT_MASTER) \
	-username $(AGENT_USER) \
	-password $(AGENT_PASS) \
	-executors $(AGENT_EXECUTORS) \
	-fsroot /var/jenkins_home \
	-disableSslVerification

stop:
	docker stop $$(docker ps -q --filter ancestor="swarm-agent")

sonar: #stop it with 'docker stop sonar'
	docker run --rm -d \
	--name=sonar \
	--network=cjt-network \
	-p 9000:9000 \
	-p 9092:9092 \
	sonarqube:lts-alpine

clean:
	docker image prune -f