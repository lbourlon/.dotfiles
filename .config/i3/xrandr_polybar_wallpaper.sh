#!/bin/bash

# TODO : Look into autorandr
# https://doc.ubuntu-fr.org/xrandr

# Disable Screen dimming & Screen Saver
xset -dpms
xset s off
xset s noblank

int_mon="eDP"
extra_mon=$(xrandr | grep " connected" | grep -v ${int_mon}  | cut -d ' ' -f -1);

$primary_monitor=default

if [[ -z "$extra_mon" ]]; then
    xrandr --output $int_mon --mode 1920x1200 --primary
    primary_monitor=$int_mon

    # Turn off other disconnected but present monitors
    other_mon=$(xrandr | grep -e 'disconnected [[:digit:]]\{3,4\}x[[:digit:]]\{3,4\}.*normal' | cut -d ' ' -f 1)
    xrandr --output $other_mon --off
    i3-msg workspace 1
    xrandr --output $other_mon --auto #added
else
    xrandr --output $other_mon --auto
    xrandr --output $extra_mon --primary \
           --output $int_mon --mode 1920x1200 --left-of $extra_mon
    primary_monitor=$extra_mon
fi


# feh
feh --no-fehbg --bg-fill ~/Pictures/desktop-4k-ghost-in-the-shell.jpg & disown

# launch polybar
killall --wait --quiet polybar
MONITOR=$primary_monitor \
    polybar -r -c ~/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/polybar.log & disown

sleep 0.5
polybar-msg action "#temp.module_toggle"
polybar-msg action "#mem.module_toggle"
polybar-msg action "#cpu.module_toggle"
polybar-msg action "#wlan.module_toggle"
polybar-msg action "#eth.module_toggle"

