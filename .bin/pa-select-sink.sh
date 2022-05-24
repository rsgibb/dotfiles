#!/usr/bin/bash -i

function list_sinks() 
{
    sinks=$(pactl list sinks | grep -e 'Sink #' -e device.description | sed ':a;N;$!ba;s/\n\s*device.description = /\t/g' | sed 's/Sink #//g' | tr -d '"')
    echo "$sinks" | sed -e "s/\t/\ /g"
}

function select_sink()
{
    echo switching default
    pactl set-default-sink "$1" || echo failed
    
    echo switching applications
    pactl list sink-inputs |
      awk -F '#' '/Sink Input./{print $2}' |
      xargs -r -I{} pactl move-sink-input {} "$1" ||
      echo failed
}

SINK=$(list_sinks | rofi -dmenu -P 'audio sink')
SINK=$(echo "$SINK" | awk '{ print $1 }')

select_sink "$SINK"
