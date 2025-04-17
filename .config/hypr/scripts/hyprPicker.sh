#!/bin/bash

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
