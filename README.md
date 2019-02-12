Jenkins-jnlp-slave
===

A [Jenkins JNLP slave](https://github.com/jenkinsci/docker-jnlp-slave) docker image with [podman](https://github.com/containers/libpod)
(binaries copied from [podman image](https://github.com/mgoltzsche/podman-static)).
Podman provides [docker](https://github.com/moby/moby) CLI support for unprivileged users.
Although the container must be privileged to be able to run podman containers
all processes within the Jenkins slave run as unprivileged user `jenkins`
after the container has been initialized.

In order to make the Jenkins docker plugins work with `podman` a couple
of compatibility hacks are provided with the `docker` script.
