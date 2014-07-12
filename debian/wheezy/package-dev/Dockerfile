# Extend debian-wheezy:latest with Debian package development tools.

FROM bfritz/debian-wheezy:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    build-essential \
    devscripts \
    dpatch \
    bison \
    flex \
    autotools-dev \
    pkg-config \
  && apt-get clean
