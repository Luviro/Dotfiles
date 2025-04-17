#!/bin/bash

# Check if rofi is already running
if pgrep -x "rofi" &> /dev/null; then
    hyprctl notify 1 2000 0 "fontsize:24  Rofi is already running"
    exit 1
fi

# run rofi
rofi -show drun -theme $HOME/.config/rofi/appLauncher.rasi
