#
# DynomiteDB: Base image
#
FROM ubuntu:14.04.4

MAINTAINER Akbar S. Ahmed <akbar@dynomitedb.com>

#
# Update Ubuntu and install dependencies
#
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

#
# Install gosu
#
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

#
# Working directory (similar to `cd $WORKDIR` for all following commands)
#
WORKDIR /

#
# Default command
#
CMD ["/bin/bash"]

