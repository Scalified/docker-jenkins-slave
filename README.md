# Jenkins Slave Docker

[![Docker Pulls](https://img.shields.io/docker/pulls/scalified/jenkins-slave.svg)](https://hub.docker.com/r/scalified/jenkins-slave)
[![](https://images.microbadger.com/badges/image/scalified/jenkins-slave.svg)](https://microbadger.com/images/scalified/jenkins-slave)
[![](https://images.microbadger.com/badges/version/scalified/jenkins-slave.svg)](https://microbadger.com/images/scalified/jenkins-slave)

## Description

This repository is used for building a [**Docker**](https://www.docker.com) image containing [**Jenkins Inbound Agent**](https://hub.docker.com/r/jenkins/inbound-agent) running on [**Alpine Linux**](https://alpinelinux.org/)

## Dockerhub

**`docker pull scalified/jenkins-slave:<version>`**

## Version

| Version                |
|------------------------|
| **alpine**, **latest** |

## Mandatory Environment Variables

* **JENKINS_URL**: url for the Jenkins server
* **JENKINS_TUNNEL**: (HOST:PORT) connect to this agent host and port instead of Jenkins server, assuming this one do route TCP traffic to Jenkins master. Useful when when Jenkins runs behind a load balancer, reverse proxy, etc.
* **JENKINS_SECRET**: agent secret
* **JENKINS_AGENT_NAME**: agent name

## Mandatory Volume Mounts

* **/var/run/docker.sock**:**/var/run/docker.sock** - docker engine
* **/var/jenkins**:**/var/jenkins** - agent working directory (path must be the same on host machine and agent container)

### How-To

#### Building Jenkins Slave Docker Image

`docker build . -t scalified/jenkins-slave:<tag>`

#### Pushing Jenkins Slave Docker Image

`docker push scalified/jenkins-slave:<tag>`

#### Running Jenkins Slave Docker Image

```
docker run -name jenkins-slave \
  -e JENKINS_URL=<...> \
  -e JENKINS_SECRET=<...> \
  -e JENKINS_AGENT_NAME=<...> \
  -e JENKINS_AGENT_WORKDIR=<...> \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/jenkins:/var/jenkins \
  scalified/jenkins-slave:<tag>
```

## Scalified Links

* [Scalified](http://www.scalified.com)
* [Scalified Official Facebook Page](https://www.facebook.com/scalified)
* <a href="mailto:info@scalified.com?subject=[Scalified Jenkins Slave Docker Image]: Proposals And Suggestions">Scalified Support</a>


