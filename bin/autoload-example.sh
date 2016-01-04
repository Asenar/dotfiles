#!/bin/sh

## Determine connected monitors
HDMI_YES=0
DVI_YES=0
VGA_YES=0
DP_YES=0
ANY_YES=0
xrandr | grep -Eq "DP[12345] connected" && DP_YES=1 && ANY_YES=1
xrandr | grep -Eq "DVI-I-[12345] connected" && DVI_YES=1 && ANY_YES=1
xrandr | grep -Eq "HDMI-[12345] connected" && HDMI_YES=1 && ANY_YES=1
xrandr | grep -Eq "VGA-[12345] connected" && VGA_YES=1 && ANY_YES=1
HDMI=$(xrandr | grep -E "HDMI-[12345] connected" | grep -oE "HDMI-[12345]")
DVI=$(xrandr | grep -E "DVI-I-[12345] connected" | grep -oE "DVI-I-[12345]")
VGA=$(xrandr | grep -E "VGA-[12345] connected" | grep -oE "VGA-[12345]")
DP=$(xrandr | grep -E "DP[12345] connected" | grep -oE "DP[12345]")

# xrand 2 screen
if [ $VGA_YES -eq 1 ] && [ $DVI_YES -eq 1 ]; then
	xrandr --output VGA-1 --mode 1366x768 --output DVI-I-1 --mode 1366x768 --right-of VGA-1
fi
# no system sound please :)
xset -b
setterm -blength 0 # add this in .inputrc
