#!/usr/bin/env bash

dir=~/.screenlayout

layouts=$(find "$dir" -type f -printf "%f\n" | cut -d '.' -f 1) || return 1

layout=$(echo "$layouts" | rofi -dmenu -P 'screen layout')

if [ -n "$layout" ]; then
    layout="${dir}/${layout}.sh"
    $layout
    i3-msg restart
    setbg.sh
fi

