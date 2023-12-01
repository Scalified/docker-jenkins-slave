FROM jenkins/inbound-agent:alpine-jdk11

ENV JENKINS_AGENT_WORKDIR /var/jenkins

USER root

RUN apk update \
	&& apk upgrade \
	&& apk add curl docker
