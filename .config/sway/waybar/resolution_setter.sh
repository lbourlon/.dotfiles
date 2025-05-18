#!/bin/bash
# TODO : automatic resolutions ?
# swaymsg -t get_outputs | jq -r 'sort_by(.rect.x) | .[].name

options="\
3072x1920@120Hz scale 1.5\n\
3072x1920@60Hz scale 1.5\n\
1920x1200@60Hz scale 1
"
monitor="eDP-1"
text=" 󰍹  "

if [[ "$1" == "switcher" ]]; then
    mode=$(echo -e ${options} | rofi -dmenu)
    msg="output ${monitor} mode ${mode}"
    res=$(swaymsg ${msg} -p)
    err=$?
    if [ $err -ne 0 ]; then
        rofi -e "$res"
    fi
elif [[ "$1" == "tooltip" ]]; then
    mode=$(swaymsg -t get_outputs eDP-1 -p | grep "Current mode" | sed 's/.*mode: //')
    tooltip="Current : ${mode}"
    echo '{"text":"'$text'","tooltip":"'$tooltip'","class":"$class"}' | jq --unbuffered --compact-output
else
    rofi -e "argv 1 must be 'tooltip' or 'switcher'"
fi



