# Extend base archlinux image by updating all packages.

FROM base/archlinux

MAINTAINER Brad Fritz <brad@fewerhassles.com>

RUN pacman -Syy

# work around problems with filesystem package upgrade as
# described at https://registry.hub.docker.com/u/base/arch/
RUN cp -p /etc/pacman.conf /etc/pacman.conf.bak \
  && sed -i 's/^CheckSpace/#CheckSpace/' /etc/pacman.conf \
  && pacman -S filesystem --noconfirm \
  && mv /etc/pacman.conf.bak /etc/pacman.conf

RUN pacman -q --noprogressbar -Su --noconfirm
