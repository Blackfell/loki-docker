#!/bin/bash
YOURXCOOKIE=$(xauth list) && echo "[+] - Got xcookie to give to Loki container..." || echo "[!] - Couldn't get xcookie!"
#docker cp /tmp/YOURXCOOKIE loki:/opt/XCOOKIE && echo "[+] - Success." || echo  "[!] - Oh no, fail!"
#rm /tmp/YOURXCOOKIE
#echo "[+] - Cookie cleaned up on system."
docker run -ti --net=host --privileged -v /opt/loki-data:/root -v /usr/share/wordlists:/root/wordlists -w /root -e DISPLAY=$DISPLAY -e YOURXCOOKIE="$YOURXCOOKIE" loki:0.6
#docker start -ai loki
#docker stop loki
#docker rm loki

