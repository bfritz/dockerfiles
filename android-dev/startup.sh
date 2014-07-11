#!/bin/sh

USER=dev
PASSWORD=`pwgen -c -n -1 12`
echo Password for user $USER is $PASSWORD

# add dev user and set password
useradd --create-home --home-dir /home/$USER --shell /bin/bash $USER
echo "$USER:$PASSWORD" | chpasswd

# make sure $USER owns his $HOME
chown -R $USER:users /home/$USER

# dev user can run any command with sudo without re-entering password
echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/android-dev

# start lightweight sshd daemon
/usr/sbin/dropbear -R

DISPLAY=:100

sudo -u $USER xpra start $DISPLAY
sleep 2  # give xpra a bit of time to start accepting connections

sudo -u $USER /bin/sh -c "test -x /start_dev_env.sh && /start_dev_env.sh $DISPLAY || DISPLAY=$DISPLAY urxvt"
