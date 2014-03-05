#!/bin/sh

# shell scipt to prepend i3status with more stuff

i3status --config ~/.i3/i3status-light | while :
do
        read line
        LG=$(setxkbmap -print | grep xkb_symbols | awk -F"+" '{print $2}') 
        echo "LG: $LG | $line" || exit 1
done
