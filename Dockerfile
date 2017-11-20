FROM ubuntu:xenial

MAINTAINER sridhar <sridhar@wustl.edu>

LABEL docker image for bxtools package (https://github.com/walaj/bxtools)

#dependencies

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential \
    bzip2 \
    curl \
    g++ \
    git \
    less \
    libcurl4-openssl-dev \
    libpng-dev \
    libssl-dev \
    libxml2-dev \
    make \
    pkg-config \
    rsync \
    unzip \
    wget \
    zip \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev

# needed for MGI data mounts
RUN apt-get update && apt-get install -y libnss-sss && apt-get clean all


#install bxtools
RUN git config --global http.sslVerify false && \
	git clone --recursive https://github.com/walaj/bxtools && \
    cd bxtools && \
    ./configure && \
    make && \
    make install


# Clean up
RUN cd / && \
   rm -rf /tmp/* && \
   apt-get autoremove -y && \
   apt-get autoclean -y && \
   rm -rf /var/lib/apt/lists/* && \
   apt-get clean












