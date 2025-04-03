#!/bin/bash

killall waybar;
waybar -c ~/.config/sway/waybar/config.json --style ~/.config/sway/waybar/style.css
