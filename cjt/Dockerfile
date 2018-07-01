FROM cloudbees/cloudbees-jenkins-team

LABEL app-name="cjt-demo-environment"

COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d

USER root

#Install plugin(s) that are not bundled by default
ENV JENKINS_UC http://jenkins-updates.cloudbees.com
ADD https://raw.githubusercontent.com/jenkinsci/docker/master/install-plugins.sh /usr/local/bin/install-plugins.sh
RUN chmod 755 /usr/local/bin/install-plugins.sh
ADD https://raw.githubusercontent.com/jenkinsci/docker/master/jenkins-support /usr/local/bin/jenkins-support
RUN chmod 755 /usr/local/bin/jenkins-support
COPY plugins.txt plugins.txt
RUN /usr/local/bin/install-plugins.sh $(cat plugins.txt)

USER jenkins