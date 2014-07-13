# test wheezy backport of collectd

FROM bfritz/debian-wheezy-openjdk7

MAINTAINER Brad Fritz <brad@fewerhassles.com>

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    sudo \
  && apt-get clean

ADD http://aphyr.com/riemann/riemann_0.2.5_all.deb /tmp/
ADD riemann_0.2.5_all.deb.sha1 /tmp/
RUN cd /tmp \
  && sha1sum --check riemann_0.2.5_all.deb.sha1 \
  && dpkg -i riemann_0.2.5_all.deb

ADD riemann.config /etc/riemann/

CMD ["sudo", "-u", "riemann", "/usr/bin/riemann", "/etc/riemann/riemann.config"]
