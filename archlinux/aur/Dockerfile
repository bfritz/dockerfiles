# Extend archlinux:latest with aura so we can use AUR packages.

FROM bfritz/archlinux:latest

MAINTAINER Brad Fritz <brad@fewerhassles.com>

# aur.sh helps us get aura-bin installed
ADD aur.sh /tmp/

# refresh package list so package installs below don't fail
RUN pacman -Sy

# makepkg deps
RUN pacman -S base-devel curl sudo --noconfirm --needed

# aura-bin deps
RUN pacman -S abs gmp --noconfirm --needed

# install aura-bin with aur.sh
RUN cd /tmp && sudo -u nobody ./aur.sh -s aura-bin && ls -l aura-bin/aura-*.pkg.tar.xz && pacman -U --noconfirm aura-bin/aura-*.pkg.tar.xz && rm /tmp/aur.sh
