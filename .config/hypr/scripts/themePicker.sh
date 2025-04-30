#!/bin/bash

# Check if rofi is already running
if pgrep -x "rofi" &> /dev/null; then
    hyprctl notify 1 2000 0 "fontsize:24  Rofi is already running"
    exit 1
fi

themes="Purple/Lime\nHatsune Miku"
conifg="$HOME/.config"

# run rofi
picked=$(echo -e "$themes" | rofi -dmenu -theme $HOME/.config/rofi/themePicker.rasi)
echo $picked

purple_lime(){
    cp "$config/rofi/colors/purple-lime.rasi" "$config/rofi/colors/colors.rasi"
    cp "$config/cava/colors/purple-lime" "$config/cava/config"
}

hatsune_miku(){
    cp "$config/rofi/colors/hatsune-miku.rasi" "$config/rofi/colors/colors.rasi"
    cp "$config/cava/colors/hatsune-miku" "$config/cava/config"
}

case $picked in
    "Purple/Lime")
        purple_lime
        ;;
    "Hatsune Miku")
        hatsune_miku
        cp "$themes_directory/purple-lime.rasi" "$themes_directory/colors.rasi"
        ;;
    "")
        notify-send "didn't pick a theme"
        ;;
    *)
        notify-send "Error in script themePicker.sh"
        ;;
esac