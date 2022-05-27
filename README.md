# Jenkins

- https://www.jenkins.io/doc/tutorials/

# Getting Started

## Prerequisites

## Install

Using `jenkins.war`

```bash

```

On macOS using `brew`

```bash
# install
$ brew install jenkins-lts
# start as service
$ brew services restart jenkins-lts

# or start as app:
$ /usr/local/opt/openjdk@11/bin/java -Dmail.smtp.starttls.enable=true -jar /usr/local/opt/jenkins-lts/libexec/jenkins.war --httpListenAddress=127.0.0.1 --httpPort=8080
```

Using docker

```bash
# pull image
$ docker pull jenkins/jenkins:lts-jdk11
# run the container, bind the port, mount the volume
$ docker run -p 8080:8080 -p 50000:50000 -v ~/:/var/jenkins_home jenkins/jenkins:lts-jdk11
```

or better

```bash
# pull image
$ docker pull toransahu/jenkins:latest
# run the container, bind the port, mount the volume, docker socket (for docker-in-docker)
$ docker run \
-u root \
--privileged \
-p 8080:8080 \
-p 50000:50000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v ~/jenkins_home:/var/jenkins_home \
jenkins/jenkins:lts-jdk11
```

# Setup

1. Open http://localhost:8080 and submit the Admin password shown on CLI
2. Install recommended plugins
3. Follow the instructions

# Create Pipeline

- https://www.jenkins.io/doc/pipeline/tour/hello-world/#examples

## Write `Jenkinsfile`

## Create MultiBranchPipeline object in Jenkins Web

## (optional) Docker agent based Pipeline
- Install 2 plugins: Docker plugin and Docker Pipeline

## Mention Source
- Git (git clone URL)
- Github (Github URL)
- etc.

## Save

# Run

# Debug

```bash
$ docker run \
-u root \
-v /var/run/docker.sock:/var/run/docker.sock \
-v ~/jenkins_home:/var/jenkins_home \
--entrypoint "/bin/bash" \
-it \
toransahu/jenkins:v0.0.1
```

# FAQ
## docker related issues

These issues are obvious if you're running Jenkins on a docker & within that jenkins container again you want to run `docker`. (Note this is just docker client).


```
org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
WorkflowScript: 2: Invalid agent type "docker" specified. Must be one of [any, label, none] @ line 2, column 13.
       agent { docker { image 'python:3.10.1-alpine' } }
```

- Install Docker & Docker Pipeline plugins

```
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/jenkins_home/workspace/mypipeline_main
[Pipeline] {
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] sh
+ docker inspect -f . python:3.10.1-alpine
/var/jenkins_home/workspace/mypipeline_main@tmp/durable-0683153f/script.sh: 1: docker: Permission denied
```

```
+ docker inspect -f . python:3.10.1-alpine
.
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] withDockerContainer
Jenkins does not seem to be running inside a container
```

- https://stackoverflow.com/questions/46711607/jenkins-pipeline-docker-jenkins-does-not-seem-to-be-running-inside-a-container

## Jenkins returned status code 128 with github

```
stderr: git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.
```

- add your public key which is added in git host, thats all

# Ref
- https://github.com/shazChaudhry/docker-jenkins/blob/ee0f386fd1706829b956cb2e723c0f2935496933/Dockerfile
