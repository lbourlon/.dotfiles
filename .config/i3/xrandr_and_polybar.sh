#!/bin/bash

# https://doc.ubuntu-fr.org/xrandr

# Disable Screen dimming & Screen Saver
xset -dpms
xset s off
xset s noblank

int_mon="eDP"
extra_mon=$(xrandr | grep " connected" | grep -v ${int_mon}  | cut -d ' ' -f -1);

$primary_monitor=default

if [[ -z "$extra_mon" ]]; then
    notify-send single monitor
    xrandr --output $int_mon --mode 1920x1200 --primary
    primary_monitor=$int_mon
else
    notify-send dual monitor
    xrandr --output $extra_mon --primary \
           --output $int_mon --mode 1920x1200 --left-of $extra_mon
           primary_monitor=$extra_mon
fi

# launch polybar
killall --wait --quiet polybar
MONITOR=$primary_monitor \
    polybar -r -c ~/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/polybar.log & disown

# Multimonitor
# for m in $(xrandr | grep " connected" | cut -d ' ' -f -1); do
#   MONITOR=$m polybar -r -c ~/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/polybar.log & disown
#   sleep 0.5 # make sure the first one has lauched so it grabs the systray icons
# done



# https://ejmastnak.com/tutorials/arch/monitor-hotplug/
# #!/bin/sh
# # File location: /usr/local/bin/hotplug-monitor.sh
# # Description: Sends X display to an external monitor and turns internal
# # display off when an HDMI cable is physically connected; turns monitor display
# # off and internal display back on when HDMI cable is physically disconnected.
#
# # Specify your username and user ID
# USER_NAME=<your-username>   # find with `id -un` or `whoami`
# USER_ID=<your-user-id>      # find with `id -u`
# # Example: `USER_NAME=ejmastnak`
# # Example: `USER_NAME=1000`
#
# # Export user's X-related environment variables
# export DISPLAY=":0"
# export XAUTHORITY="/home/${USER_NAME}/.Xauthority"
# export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus"
#
# # Video output and device names recogized by xrandr/sysfs
# internal="eDP-1"         # change as needed
# external="HDMI-1"        # change as needed
# device="card0-HDMI-A-1"  # change as needed
#
# # If external display was just physically connected, turn external display on
# # and (optionally) turn internal display off to save battery.
# if [ $(cat /sys/class/drm/${device}/status) == "connected" ];
# then
#   xrandr --output "${external}" --auto  # sends display to monitor
#   xrandr --output "${internal}" --off   # optionally turn internal display off
#
# # If external display was just physically disconnected, turn 
# # external display off and turn internal display on.
# elif [ $(cat /sys/class/drm/${device}/status) == "disconnected" ];
# then
#   xrandr --output "${external}" --off   # turn monitor display off
#   xrandr --output "${internal}" --auto  # turn internal display on (if needed)
# else  # Do nothing if device status is unreadable
#   exit
# fi

