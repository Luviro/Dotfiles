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

themes_dir="$HOME/.config/mythemes"

# run rofi
picked=$(echo -e "$themes" | rofi -dmenu -theme $HOME/.config/rofi/themePicker.rasi)

# function for purple-lime theme
purple_lime(){
    local purple_lime="$themes_dir/purple-lime"
    cp -r "$purple_lime/rofi/." "$config/rofi"
    cp -r "$purple_lime/cava/." "$config/cava"
    cp -r "$purple_lime/clipse/." "$config/clipse"
    cp -r "$purple_lime/fastfetch/." "$config/fastfetch"
    cp -r "$purple_lime/hypr/." "$config/hypr"
}

# function for hatsune-miku theme
hatsune_miku(){
    local hatsune_miku="$themes_dir/hatsune-miku"
    cp -r "$hatsune_miku/rofi/." "$config/rofi"
    cp -r "$hatsune_miku/cava/." "$config/cava"
    cp -r "$hatsune_miku/clipse/." "$config/clipse"
    cp -r "$hatsune_miku/fastfetch/." "$config/fastfetch"
    cp -r "$hatsune_miku/hypr/." "$config/hypr"
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