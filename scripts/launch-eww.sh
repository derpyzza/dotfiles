#!/bin/sh

weww="/home/derpyzza/eww-wayland/target/release/eww"

$weww daemon

# Show bar on external screen if connected
NB_MONITORS=$(hyprctl monitors -j | jq length)
if [ "$NB_MONITORS" -eq "2" ]; then
    	hyprctl dispatch focusmonitor 1
    	$weww open bar --screen 1
else 
# Show bar on laptop screen
	hyprctl dispatch focusmonitor 0
	$weww open bar --screen 0

fi
