# test wheezy backport of collectd

FROM bfritz/debian-wheezy:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

ADD collectd_debs.tar.gz /tmp

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    libltdl7 \
    librrd4 \
    libprotobuf-c0 \
  && apt-get clean

RUN dpkg -i /tmp/collectd/collectd-core_*.deb
RUN dpkg -i /tmp/collectd/collectd_*.deb

ADD collectd.conf /etc/collectd/

CMD ["/usr/sbin/collectd", "-f"]
