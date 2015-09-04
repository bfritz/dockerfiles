#!/bin/sh

set -e

mkdir -p chroot

# build root filesystem
debootstrap --variant minbase jessie ./chroot http://httpredir.debian.org/debian/
chroot ./chroot apt-get clean
tar cf jessie64-minbase-chroot.tar -C chroot .

# create base image from root filesystem
docker build -t bfritz/debian:jessie64-minbase .
