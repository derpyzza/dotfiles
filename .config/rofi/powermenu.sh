#!/usr/bin/bash

#reboot="  Reboot"
#shutdown="⏻  Shutdown"
#logout= " Logout"
#suspend="鈴  Suspend"

#case "$@" in 
#  "$reboot")
#    notify-send "reboot";;
#   systemctl reboot;;
#  "$shutdown")
#    notify-send "shutdown";;
#    systemctl poweroff;;
#  "$suspend")
#    notify-send "suspend";;
#    systemctl suspend;;
#  "$logout")  notify-send "logout";;
#	bspc quit;;
#  *) notify-send "Not A Valid Option - power menu"
#esac  

#echo -ne "$logout\n$shutdown\n$reboot\n$suspend"


shutdown="  Shutdown"
reboot="  Restart"
lock="  Screen Lock"
suspend="  Sleepmode"
logout="﫼  Logout"

case "$@" in
"$shutdown") systemctl poweroff ;;
"$reboot")   systemctl reboot ;;
"$suspend")  systemctl suspend ;;
"$lock")     notify-send "lock";;
"$logout")   bspc quit;;
*) ;;
esac

echo -ne "$shutdown\n$reboot\n$lock\n$suspend\n$logout"
