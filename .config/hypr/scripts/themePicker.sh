#!/bin/bash

# Check if rofi is already running
if pgrep -x "rofi" &> /dev/null; then
    hyprctl notify 1 2000 0 "fontsize:24  Rofi is already running"
    exit 1
fi

themes="Purple/Lime\nHatsune Miku"

cava="$HOME/.config/cava/config"
rofi="$HOME/.config/rofi/colors.rasi"
themes_dir="$HOME/.config/mythemes"

# run rofi
picked=$(echo -e "$themes" | rofi -dmenu -theme $HOME/.config/rofi/themePicker.rasi)

purple_lime(){
    cp "$themes_dir/rofi/purple-lime.rasi" "$rofi"
    cp "$themes_dir/cava/purple-lime" "$cava"
}

hatsune_miku(){
    cp "$themes_dir/rofi/hatsune-miku.rasi" "$rofi"
    cp "$themes_dir/cava/hatsune-miku" "$cava"
}

case $picked in
    "Purple/Lime")
        purple_lime
        ;;
    "Hatsune Miku")
        hatsune_miku
        ;;
    "")
        ;;
    *)
        notify-send "Error in script themePicker.sh"
        ;;
esac