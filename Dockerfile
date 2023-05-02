FROM jenkins/jnlp-slave:alpine

ENV JENKINS_AGENT_WORKDIR /var/jenkins

USER root

RUN apk update \
	&& apk upgrade \
	&& apk add curl docker

# START: Attention! Drop next lines when default JDK version is set to 11

RUN apk add openjdk11

ENV JAVA_HOME="/usr/lib/jvm/default-jvm"

ENV PATH="$JAVA_HOME:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

ENV JAVA_VERSION="11.0.14"

# END

