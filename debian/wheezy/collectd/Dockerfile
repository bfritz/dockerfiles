# Backport collectd from Jessie to Wheezy.

FROM bfritz/debian-wheezy-pkg-dev

MAINTAINER Brad Fritz <brad@fewerhassles.com>

# build dependencies for collectd
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    dpatch \
    bison \
    flex \
    autotools-dev \
    libltdl-dev \
    pkg-config \
    iptables-dev \
    javahelper \
    libcurl4-gnutls-dev \
    libdbi-dev \
    libesmtp-dev \
    libganglia1-dev \
    libgcrypt11-dev \
    libglib2.0-dev \
    liblvm2-dev \
    libmemcached-dev \
    libmodbus-dev \
    libmnl-dev \
    libmysqlclient-dev \
    libnotify-dev \
    libopenipmi-dev \
    liboping-dev \
    libow-dev \
    libpcap-dev \
    libperl-dev \
    libpq-dev \
    libprotobuf-c0-dev \
    librabbitmq-dev \
    librrd-dev \
    libsensors4-dev \
    libsnmp-dev \
    libtokyocabinet-dev \
    libtokyotyrant-dev \
    libupsclient1-dev \
    libvirt-dev \
    libxml2-dev \
    libyajl-dev \
    default-jdk \
    protobuf-c-compiler \
    python-dev \
  && apt-get clean

ENV PACKAGE    collectd
ENV COMPONENT  main
ENV VERSION    5.4.1-3

ENV BUILD_DIR  /tmp/$PACKAGE
RUN mkdir $BUILD_DIR

# initialize gpg for dget
RUN gpg -k

RUN cd $BUILD_DIR \
  && LETTER=`echo $PACKAGE | cut -c1` \
  && dget -x http://http.debian.net/debian/pool/${COMPONENT}/${LETTER}/${PACKAGE}/${PACKAGE}_${VERSION}.dsc

#RUN cd $BUILD_DIR/${PACKAGE}-* && dpkg-checkbuilddeps > /tmp/dependencies.txt

RUN cd $BUILD_DIR/${PACKAGE}-* \
  && dch --local ~bpo70+ --distribution wheezy-backports "Rebuild for wheezy-backports." \
  && dpkg-buildpackage -us -uc

RUN cd `dirname $BUILD_DIR` \
  && tar cfz /tmp/packages.tar.gz `basename $BUILD_DIR`/*.deb

CMD ["cat", "/tmp/packages.tar.gz"]
