#!/bin/bash

set -e

eval `ssh-agent -s`
ssh-add /var/jenkins_home/.ssh/id_rsa
ssh-add -l

/usr/local/bin/jenkins.sh
