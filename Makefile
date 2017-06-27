#It's possible to start CJT with `make cjt` as long as the environment info is correct in this file (which it's not). Please consider this file as a "legacy" example and use docker-compose instead.

cjt:
	docker build . \
	&& docker run \
	-p 9090:8080 \
	-v /Users/David/Projects/cjt-demo-environment/jenkins_home:/var/jenkins_home \
	cloudbees/cloudbees-jenkins-team
