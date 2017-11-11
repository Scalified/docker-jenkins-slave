FROM jenkinsci/slave

ENV JENKINS_SWARM_VERSION=3.6 \
    MD5=d0047f360a1f17a4da3d9af222d4630a

USER root

RUN apt-get update

RUN apt-get -y install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
     
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -

RUN apt-get update

RUN apt-get -y install docker-ce

RUN curl --create-dirs -sSLo /usr/share/jenkins/swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION.jar \
 && chmod 644 /usr/share/jenkins/swarm-client.jar \
 && echo "$MD5  /usr/share/jenkins/swarm-client.jar" | md5sum -c -

COPY entrypoint.sh /

RUN chmod a+x /entrypoint.sh

USER jenkins

ENTRYPOINT ["/entrypoint.sh"]
CMD ["java", "-jar", "/bin/swarm-client.jar"]
