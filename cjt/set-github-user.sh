#!/usr/bin/env bash
sed -i -e "s/REPO_OWNER/$GITHUB_USER/g" /usr/share/jenkins/ref/jenkins.yaml
/bin/tini -s -- /usr/local/bin/jenkins.sh