#!/bin/zsh

buds='6C:D3:EE:16:E5:C1'
keyboard='EE:08:C2:C9:8A:06'

bluetoothctl power on
case $1 in
  'keyboard')
    bluetoothctl connect $keyboard
    ;;
  'buds')
    bluetoothctl connect $buds
    ;;
  *)
    bluetoothctl connect $buds
    ;;
esac
