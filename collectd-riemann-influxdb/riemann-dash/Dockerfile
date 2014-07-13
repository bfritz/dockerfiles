# riemann-dash dashboard served on port 4567

FROM bfritz/debian-wheezy:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    ruby1.9.3 \
    ruby-dev \
    build-essential \
  && apt-get clean

RUN gem install riemann-dash --no-rdoc --no-ri

EXPOSE 4567

CMD ["riemann-dash"]
