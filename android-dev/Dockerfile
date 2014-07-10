# Android development environment exposed to host via Xpra over SSH
#
# Inspired by Roberto Hashioka and https://github.com/rogaha/docker-desktop

FROM bfritz/archlinux-xpra:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

# refresh package list so package installs below don't fail
RUN pacman -Sy

# lib32-fontconfig for android-studio
RUN pacman -S lib32-fontconfig --noconfirm

RUN sudo aura -A --noconfirm \
  android-sdk \
  android-sdk-platform-tools \
  android-sdk-build-tools \
  android-studio

# pwgen for startup.sh script
RUN pacman -S pwgen --noconfirm
ADD startup.sh /

EXPOSE 22

CMD ["/bin/bash", "/startup.sh"]
