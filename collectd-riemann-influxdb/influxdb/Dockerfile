# riemann-dash dashboard served on 0.0.0.0:4567

FROM bfritz/debian-wheezy:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    curl \
  && apt-get clean

ENV VERSION 0.7.3

# install InfluxDB Debian package after verifying sha1sum
RUN mkdir -p /opt/influxdb
ADD influxdb_${VERSION}_amd64.deb.sha1 /opt/influxdb/

WORKDIR /opt/influxdb
RUN curl -O http://s3.amazonaws.com/influxdb/influxdb_${VERSION}_amd64.deb
RUN sha1sum --check influxdb_${VERSION}_amd64.deb.sha1 \
  && dpkg -i influxdb_${VERSION}_amd64.deb

# API is on port 8086 and admin UI is on port 8083
EXPOSE 8083 8086

VOLUME "/opt/influxdb/shared/data/db"
CMD ["-config", "/opt/influxdb/shared/config.toml"]
ENTRYPOINT ["/usr/bin/influxdb"]
