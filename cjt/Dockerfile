FROM cloudbees/cloudbees-jenkins-team:2.138.1.2

LABEL app-name="cjt-demo-environment"

COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d

USER root

# add config file
COPY jenkins.yaml /usr/share/jenkins/ref/

# add environment variable to point to configuration file
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/jenkins.yaml

#Install plugin(s) that are not bundled by default
 ENV JENKINS_UC http://jenkins-updates.cloudbees.com
# ENV JENKINS_UC http://updates.jenkins-ci.org/experimental/update-center.json
ADD https://raw.githubusercontent.com/jenkinsci/docker/master/install-plugins.sh /usr/local/bin/install-plugins.sh
RUN chmod 755 /usr/local/bin/install-plugins.sh
ADD https://raw.githubusercontent.com/jenkinsci/docker/master/jenkins-support /usr/local/bin/jenkins-support
RUN chmod 755 /usr/local/bin/jenkins-support
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# "this Jenkins environment is fully configured"
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

USER jenkins
