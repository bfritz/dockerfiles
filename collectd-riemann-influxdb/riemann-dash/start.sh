#!/bin/sh

RIEMANN_IP=`sed -n 's/\(.*\)\s\+riemann$/\1/p' /etc/hosts`
if [ -z "$RIEMANN_IP" ]; then
    echo "Could not find riemann server IP.  Did you link the riemann container?"
    echo
    echo "Example:"
    echo "  docker run --link riemann:riemann -d -p 4567:4567 cri-riemann-dash"
    exit -1
fi

DASH_IF=eth0
DASH_IP=`ip -o -4 addr list $DASH_IF | awk '{print $4}' | awk -F/ '{print $1}'`

echo "  Riemann IP: $RIEMANN_IP"
echo "Dashboard IP: $DASH_IP"

sed -i "s/RIEMANN_IP/$RIEMANN_IP/g" config.json

riemann-dash config.rb
