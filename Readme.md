# Jenkins slave Alpine Docker image (Jenkins Swarm Plugin)

Docker images for Jenkins slave based on Jenkins Swarm Plugin.

This image is generic, thus you can re-use it within your own projects.


## Supported tags and respective Dockerfile links

- [`:latest`  (*Dockerfile*)](https://github.com/Scalified/docker-jenkins-slave/blob/master/Dockerfile)

See [older versions](https://github.com/Scalified/docker-jenkins-slave/releases)

## Base docker image

- [hub.docker.com](https://hub.docker.com/r/jenkinsci/slave)

## Source code

- [github.com](https://github.com/Scalified/docker-jenkins-slave)

## Installation

1. Install [Docker](https://www.docker.com/).
2. Install [Docker Compose](https://docs.docker.com/compose/).

## Usage

    $ docker run scalified/docker-jenkins-slave


## Advanced usage

Add user and password to connect jenkins slaves to jenkins master

    $ docker run scalified/docker-jenkins-slave -username foo -password secret

or via environment variables:

    $ docker run -e JENKINS_USER=foo -e JENKINS_PASS=secret scalified/docker-jenkins-slave

See `--help` for more options:

    $ docker run --rm scalified/docker-jenkins-slave --help

## Supported environment variables

* `JENKINS_USER` jenkins user to be used to connect slaves to Jenkins master. Make sure that this user has the proper rights to connect slaves and run jenkins jobs.
* `JENKINS_PASS` jenkins user password
* `JENKINS_PASS_ENV` jenkins user password; use this option if your password contains illegal characters
* `JAVA_OPTS` You might need to customize the JVM running Jenkins slave, typically to pass system properties or tweak heap memory settings. Use JAVA_OPTS environment variable for this purpose.
* `JENKINS_NAME` Name of the slave
* `JENKINS_DESCRIPTION` Description to be put on the slave
* `JENKINS_EXECUTORS` Number of executors. Default is equal with the number of available CPUs
* `JENKINS_LABELS` Whitespace-separated list of labels to be assigned for this slave. Multiple options are allowed.
* `JENKINS_RETRY` Number of retries before giving up. Unlimited if not specified.
* `JENKINS_MODE` The mode controlling how Jenkins allocates jobs to slaves. Can be either 'normal' (utilize this slave as much as possible) or 'exclusive' (leave this machine for tied jobs only). Default is normal.
* `JENKINS_MASTER` The complete target Jenkins URL like 'http://jenkins-server'. If this option is specified, auto-discovery will be skipped
* `JENKINS_TUNNEL` Connect to the specified host and port, instead of connecting directly to Jenkins. Useful when connection to Hudson needs to be tunneled. Can be also HOST: or :PORT, in which case the missing portion will be auto-configured like the default behavior
* `JENKINS_TOOL_LOCATIONS` Whitespace-separated list of tool locations to be defined on this slave. A tool location is specified as 'toolName:location'
* `JENKINS_NO_RETRY_AFTER_CONNECTED` Do not retry if a successful connection gets closed.
* `JENKINS_AUTO_DISCOVERY_ADDRESS` Use this address for udp-based auto-discovery (default 255.255.255.255)
* `JENKINS_DISABLE_SSL_VERIFICATION` Disables SSL verification in the HttpClient.
* `JENKINS_OPTS` You can provide multiple parameters via this environment like: `-e JENKINS_OPTS="-labels code-analysis -mode exclusive"`

## Extend

Even if this image has some common system libraries pre-installed at some point
your projects may have system dependencies that are not installed on this image.
Thus, you'll have to build your own custom Jenkins slave Docker image
based on this one by adding a `Dockerfile` and then run:

    $ docker build -t jenkins-slave-custom .

## Troubleshooting

If the jenkins slaves fail to connect you can either directly provide
`JENKINS_MASTER` env URL or within your favorite
browser head to `http://<your.jenkins.master.ip>/configure` and update
`Jenkins URL` property to match your jenkins server IP/DOMAIN (`http://<your.jenkins.master.ip>/`)
then restart jenkins slave.
