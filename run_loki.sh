#!/bin/bash
if [ $EUID != 0 ] ; then echo "You must run this script as root"; exit; fi
YOURXCOOKIE=$(xauth list) && echo "[+] - Got xcookie to give to Loki container..." || echo "[!] - Couldn't get xcookie!"
docker run -ti --net=host --privileged -v /opt/loki-data:/root -w /root -e DISPLAY=$DISPLAY -e YOURXCOOKIE="$YOURXCOOKIE" loki:0.6
