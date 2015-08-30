#!/bin/sh

set -e

mkdir -p chroot

# build root filesystem
debootstrap --variant buildd jessie ./chroot http://httpredir.debian.org/debian/
chroot ./chroot apt-get clean
tar cf jessie64-buildd-chroot.tar -C chroot .

# create base image from root filesystem
docker build -t bfritz/debian:jessie64-buildd .
