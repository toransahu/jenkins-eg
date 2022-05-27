# Jenkins

- https://www.jenkins.io/doc/tutorials/

# Getting Started

## Prerequisites

## Install

Using docker

```bash
# pull image
$ docker pull jenkins/jenkins:lts-jdk11
# run the container, bind the port, mount the volume
$ docker run -p 8080:8080 -p 50000:50000 -v ~/:/var/jenkins_home jenkins/jenkins:lts-jdk11
```

# Setup

1. Open http://localhost:8080 and submit the Admin password shown on CLI
2. Install recommended plugins
3. Follow the instructions

# Create Pipeline

- https://www.jenkins.io/doc/pipeline/tour/hello-world/#examples

# Run


