#!/bin/sh

chown jenkins:jenkins /home/jenkins/.local/share/containers/storage &&

#exec gosu jenkins bash
exec gosu jenkins jenkins-slave "$@"
