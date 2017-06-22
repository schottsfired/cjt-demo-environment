cjt:
	docker build . \
	&& docker run \
	-p 9090:8080 \
	-v /Users/David/Projects/cjt-demo-environment/jenkins_home:/var/jenkins_home \
	cloudbees/cloudbees-jenkins-team
