# Arch image with xpra installed for sharing GUI apps with host

FROM bfritz/archlinux-aur:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

RUN echo >> /etc/pacman.conf
RUN echo "[multilib]" >> /etc/pacman.conf
RUN echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
RUN pacman -Sy

ENV LANG en_US.UTF-8
RUN sudo aura -A xpra-winswitch --noconfirm
RUN sudo aura -A dropbear --noconfirm
