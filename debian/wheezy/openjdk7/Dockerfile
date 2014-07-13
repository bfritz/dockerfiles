# Extend debian-wheezy:latest with OpenJDK 7.

FROM bfritz/debian-wheezy:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    openjdk-7-jdk \
  && apt-get clean
