#!/bin/bash

# Check if rofi is already running
if pgrep -x "rofi" &> /dev/null; then
    hyprctl notify 1 2000 0 "fontsize:24  Rofi is already running"
    exit 1
fi

# themes
themes="Purple/Lime\nHatsune Miku"

# paths for relevant configs
config="$HOME/.config"

cava="cava/config"
rofi="rofi/colors.rasi"
clipse="clipse/custom_theme.json"

themes_dir="$HOME/.config/mythemes"

# run rofi
picked=$(echo -e "$themes" | rofi -dmenu -theme $HOME/.config/rofi/themePicker.rasi)

# function for purple-lime theme
purple_lime(){
    local purple_lime="$themes_dir/purple-lime"
    cp "$purple_lime/$rofi" "$config/$rofi"
    cp "$purple_lime/$cava" "$config/$cava"
    cp "$purple_lime/$clipse" "$config/$clipse"
}

# function for hatsune-miku theme
hatsune_miku(){
    local hatsune_miku="$themes_dir/hatsune-miku"
    cp "$hatsune_miku/$rofi" "$config/$rofi"
    cp "$hatsune_miku/$cava" "$config/$cava"
    cp "$hatsune_miku/$clipse" "$config/$clipse"
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