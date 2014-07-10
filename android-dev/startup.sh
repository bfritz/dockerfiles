#!/bin/sh

USER=dev
PASSWORD=`pwgen -c -n -1 12`
echo Password for user $USER is $PASSWORD

useradd --create-home --home-dir /home/$USER --shell /bin/bash $USER
echo "$USER:$PASSWORD" | chpasswd

/usr/sbin/dropbear -R

sudo -u $USER xpra start :100

sudo -u $USER DISPLAY=:100 android-studio
