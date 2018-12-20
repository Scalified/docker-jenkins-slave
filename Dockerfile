FROM jenkins/jnlp-slave:alpine

ENV JENKINS_AGENT_WORKDIR /var/jenkins

USER root

RUN apk update \
	&& apk upgrade \
	&& apk add docker

