# Extend base Debian Wheezy image by updating all packages.

FROM debian:wheezy

MAINTAINER Brad Fritz <brad@fewerhassles.com>

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq \
    && apt-get clean
