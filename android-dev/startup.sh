#!/bin/sh

USER=dev
PASSWORD=`pwgen -c -n -1 12`
echo Password for user $USER is $PASSWORD

useradd --create-home --home-dir /home/$USER --shell /bin/bash $USER
echo "$USER:$PASSWORD" | chpasswd

/usr/sbin/dropbear -R

DISPLAY=:100

sudo -u $USER xpra start $DISPLAY
sleep 2  # give xpra a bit of time to start accepting connections

sudo -u $USER /bin/sh -c "test -x /start_dev_env.sh && /start_dev_env.sh $DISPLAY || DISPLAY=$DISPLAY urxvt"
