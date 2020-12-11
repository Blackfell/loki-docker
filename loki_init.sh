#!/bin/bash
echo "$DISPLAY"
echo "[+] - Setting xcookie to $YOURXCOOKIE"
xauth add $YOURXCOOKIE && echo "[+] - Xcookie set!" && loki.py 
