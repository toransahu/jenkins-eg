FROM jenkins/jenkins:lts

USER root

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && curl -sSL https://get.docker.com/ | sh \
    && rm -rf /var/lib/apt/lists/*

USER jenkins
