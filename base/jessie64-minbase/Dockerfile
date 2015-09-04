FROM scratch

MAINTAINER Brad Fritz <brad@fewerhassles.com>

ADD jessie64-minbase-chroot.tar /

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y autoremove \
    && apt-get clean \
    && find /var/lib/apt/lists -type f -delete

CMD ["/bin/sh"]
