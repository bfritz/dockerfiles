# riemann-dash dashboard served on 0.0.0.0:4567

FROM bfritz/debian-wheezy:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    ruby1.9.3 \
    ruby-dev \
    build-essential \
  && apt-get clean

RUN gem install riemann-dash --no-rdoc --no-ri

RUN mkdir -p /srv/riemann-dash
ADD config.rb /srv/riemann-dash/
ADD config.json /srv/riemann-dash/
ADD start.sh /srv/riemann-dash/

EXPOSE 4567

WORKDIR /srv/riemann-dash
CMD ["/srv/riemann-dash/start.sh"]
