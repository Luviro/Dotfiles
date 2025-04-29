#!/bin/bash

# Check if rofi is already running
if pgrep -x "rofi" &> /dev/null; then
    hyprctl notify 1 2000 0 "fontsize:24  Rofi is already running"
    exit 1
fi

themes="Purple/Lime\nHatsune Miku"
themes_directory="$HOME/.config/rofi/colors"

# run rofi
picked=$(echo -e "$themes" | rofi -dmenu -theme $HOME/.config/rofi/themePicker.rasi)
echo $picked

purple_lime(){
    cp "$themes_directory/purple-lime.rasi" "$themes_directory/colors.rasi"
}

hatsune_miku(){
    cp "$themes_directory/hatsune-miku.rasi" "$themes_directory/colors.rasi"
}

case $picked in
    "Purple/Lime")
        purple_lime
        ;;
    "Hatsune Miku")
        hatsune_miku
        ;;
    "")
        notify-send "didn't pick a theme"
        ;;
    *)
        notify-send "Error in script themePicker.sh"
        ;;
esac