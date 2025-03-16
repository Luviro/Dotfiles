#!/bin/bash

# Check if rofi is installed
if ! command -v "rofi" &> /dev/null; then
    hyprctl notify 3 3000 0 "fontsize:24  Rofi isn't installed"
    exit 1
fi

# Check if rofi is already running
if pgrep -x "rofi" &> /dev/null; then
    hyprctl notify 1 2000 0 "fontsize:24  Rofi is already running"
	exit 1
fi

# run rofi
rofi -show drun -theme $HOME/.config/rofi/appLauncher.rasi
