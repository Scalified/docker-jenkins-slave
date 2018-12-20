FROM jenkins/jnlp-slave:alpine

ARG JENKINS_AGENT_WORKDIR

ENV JENKINS_AGENT_WORKDIR $JENKINS_AGENT_WORKDIR

USER root

RUN apk update \
	&& apk upgrade \
	&& apk add docker

RUN mkdir -p $JENKINS_AGENT_WORKDIR


