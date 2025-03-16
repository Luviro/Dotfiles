#!/bin/bash

# Check if hyprpicker is installed
if ! command -v "hyprpicker" &> /dev/null; then
    hyprctl notify 3 3000 0 "fontsize:24  Hyprpicker isn't installed"
    exit 1
fi

# Check if hyprpicker is already running
if pgrep -x "hyprpicker" &> /dev/null; then
    hyprctl notify 1 2000 0 "fontsize:24  Hyprpicker is already running"
	exit 1
fi

# Run hyprpicker
color=$(hyprpicker --autocopy)

# Check if a color was selected
if [ -n "$color" ]; then
	noHashtagColor=${color#\#}
	hyprctl notify -1 2000 "rgb($noHashtagColor)" "fontsize:24  $color"
else
	hyprctl notify 4 2000 "rgb(ffffff)" "fontsize:24  No color selected"
fi
