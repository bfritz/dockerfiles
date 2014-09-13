# Android development environment for MAXS project
#
# For building MAXS (Modular Android XMPP Suite)
# http://projectmaxs.org/

FROM android-dev

MAINTAINER Brad Fritz <brad@fewerhassles.com>

# refresh package list so package installs below don't fail
RUN pacman -Sy

# build dependencies (AUR)
# Install (big) android-platform-19 package first. MOAR caching!
RUN sudo aura -A --noconfirm \
  android-platform-19 \
  python-gnupg

# build dependencies (non-AUR)
RUN pacman -S --noconfirm \
  apache-ant \
  python-httplib2 \
  imagemagick \
  librsvg \
  wget

# start_dev_env.sh dependencies
RUN pacman -S --noconfirm tmux
ADD start_dev_env.sh /

# extra stuff
RUN pacman -S --noconfirm \
  ack \
  git \
  openssh

RUN git clone --recursive \
  https://bitbucket.org/projectmaxs/maxs.git \
  /home/dev/projects/maxs
