# Android development environment exposed to host via Xpra over SSH
#
# Inspired by Roberto Hashioka and https://github.com/rogaha/docker-desktop

FROM bfritz/archlinux-xpra:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

# refresh package list so package installs below don't fail
RUN pacman -Sy

RUN sudo aura -A android-sdk --noconfirm

# pwgen for startup.sh script
RUN pacman -S pwgen --noconfirm
ADD startup.sh /

EXPOSE 22

CMD ["/bin/bash", "/startup.sh"]
