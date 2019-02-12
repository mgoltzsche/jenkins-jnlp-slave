FROM mgoltzsche/podman AS podman

FROM jenkins/jnlp-slave:latest
USER root
RUN apt-get update && apt-get install -yq iptables uidmap && apt-get clean
COPY --from=podman /usr/local/bin/* /usr/local/bin/
COPY --from=podman /usr/libexec/podman /usr/libexec/podman
COPY --from=podman /etc/containers /etc/containers
RUN mkdir -p /home/jenkins/.local/share/containers/storage \
	&& chown -R jenkins:jenkins /home/jenkins
VOLUME /home/jenkins/.local/share/containers/storage
COPY entrypoint.sh /
COPY docker /usr/local/bin/
ENTRYPOINT [ "/entrypoint.sh" ]
