#
# DynomiteDB: C build image
#
FROM dynomitedb/base

MAINTAINER Akbar S. Ahmed <akbar@dynomitedb.com>

#
# Environment variables
#
#ENV DYNOMITE_APP dynomite

#
# Install dependencies
#
RUN apt-get install -y \
    autoconf \
    build-essential \
    ca-certificates \
    curl \
    dh-autoreconf \
    g++ \
    gcc \
    git \
    libc6-dev \
    libgflags-dev \
    libsnappy1 \
    libsnappy-dev \
    libssl-dev \
    libtool \
    libbz2-dev \
    mercurial \
    pkg-config \
    tcl8.5 && \
    #zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

#
# Mountable directories
#
#VOLUME ["/dir-on-host:/dir-in-container"]

#
# Working directory (similar to `cd $WORKDIR` for all following commands)
#
#WORKDIR /

#
# Default command
#
CMD ["/bin/bash"]
