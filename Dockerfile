FROM jenkins/jnlp-slave:alpine

USER root

RUN apk update \
	&& apk upgrade \
	&& apk add docker

