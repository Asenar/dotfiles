#!/bin/sh

# xrand 2 screen
xrandr --output VGA-1 --mode 1366x768 --output DVI-I-1 --mode 1366x768 --right-of VGA-1
# no system sound please :)
xset -b
setterm -blength 0 # a ajouter dans .inputrc
