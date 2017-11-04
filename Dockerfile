FROM jenkinsci/slave:alpine

ENV JENKINS_SWARM_VERSION=3.6 \
    MD5=d0047f360a1f17a4da3d9af222d4630a

USER root

RUN curl -o /usr/share/jenkins/swarm-client.jar -SL https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION.jar \
 && chmod 644 /usr/share/jenkins/swarm-client.jar \
 && echo "$MD5  /usr/share/jenkins/swarm-client.jar" | md5sum -c -

USER jenkins

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["java", "-jar", "/bin/swarm-client.jar"]
