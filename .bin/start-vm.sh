#!/usr/bin/env bash

uri='qemu:///system'
prompt='start vm'

list=$(virsh -c qemu:///system list --all | tail -n +3 | sed -e 's/  */ /g') || return 1
item=$(echo "$list" | rofi -dmenu -P "$prompt")

vm=$(echo "$item" | awk '{print $2}')
state=$(echo "$item" | awk '{print $3}')

if [ -n "$vm" ] && [ "$state" != "running" ]; then
  #if [ "$vm" = "win10-work" ]; then
  #  ~/.screenlayout/single-left.sh
  #  i3-msg restart
  #  setbg.sh
  #  if ! pgrep -x "barrier" > /dev/null; then
  #    barrier &
  #  fi
  #fi
  
  virsh -c $uri start $vm
fi
