#!/bin/bash
if [[ $(xrandr | grep "HDMI-1 connected") ]]; then
	/usr/bin/autorandr -l docked &
	xrandr --output HDMI-1 --primary
	exit 0
fi
/usr/bin/autorandr -l mobile &

