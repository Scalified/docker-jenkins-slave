FROM jenkinsci/slave:alpine

ENV JENKINS_SWARM_VERSION=3.6 \
    MD5=d0047f360a1f17a4da3d9af222d4630a

RUN apk add --no-cache curl

RUN curl -o /bin/swarm-client.jar -SL https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION.jar \
 && echo "$MD5  /bin/swarm-client.jar" | md5sum -c -

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["java", "-jar", "/bin/swarm-client.jar"]
