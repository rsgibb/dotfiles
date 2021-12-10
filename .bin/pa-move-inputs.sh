#!/usr/bin/env bash


function get_sinks() 
{
    pacmd list-sinks | grep device.description
}

function set_sink()
{
    echo switching default
    pacmd set-default-sink $1 || echo failed
    
    echo switching applications
    pacmd list-sink-inputs |
      awk '/index:/{print $2}' |
      xargs -r -I{} pacmd move-sink-input {} $1 ||
      echo failed
}

SINK=$(get_sinks | rofi -dmenu -P "Select Audio Output:")

set_sink $SINK

