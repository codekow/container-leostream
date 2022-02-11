#FROM registry.access.redhat.com/ubi7/ubi
FROM docker.io/centos:7

### https://github.com/opencontainers/image-spec/blob/main/annotations.md

USER root

# leeeeeeyroy jeeeeeeeeeenkins
RUN yum -y upgrade && \
    yum -y install sudo && \
    curl -sL http://downloads.leostream.com/broker.prod.sh | bash

# setup: entrypoint and other scripts over 
COPY bin /usr/local/bin

USER 1001

WORKDIR /app
VOLUME /app

EXPOSE 8080 8443

ENTRYPOINT ["entrypoint.sh"]
