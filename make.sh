#!/bin/sh

set -eux

while [ $# -gt 0 ]; do
	case "$1" in
		build)
			docker build --force-rm -t mgoltzsche/jenkins-jnlp-slave .
		;;
		run)
			docker run -ti --rm --privileged mgoltzsche/jenkins-jnlp-slave
		;;
	esac
	shift
done
