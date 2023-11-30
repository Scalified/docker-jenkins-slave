FROM --platform=linux/x86_64 jenkins/inbound-agent:latest-alpine

ENV JENKINS_AGENT_WORKDIR /var/jenkins

USER root

RUN apk update \
	&& apk upgrade \
	&& apk add curl docker