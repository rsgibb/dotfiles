#!/usr/bin/bash -i

function list_sinks() 
{
    sinks=$(pactl list sinks short) || return 1
    #sinks=$(echo "$sinks" | sed -r "s/alsa_output\.(usb-|pci-[0-9]{4}_[0-9]{2}_[0-9]{2}\.[0-9].)//g")
    echo "$sinks" | sed -e "s/\t/\ /g"
}

function select_sink()
{
    echo switching default
    pactl set-default-sink "$1" || echo failed
    
    echo switching applications
    pactl list sink-inputs |
      awk -F '#' '/Sink Input:/{print $2}' |
      xargs -r -I{} pactl move-sink-input {} "$1" ||
      echo failed
}

SINK=$(list_sinks | rofi -dmenu -P 'audio sink')
SINK=$(echo "$SINK" | cut -f 1 -d " ")

select_sink "$SINK"
