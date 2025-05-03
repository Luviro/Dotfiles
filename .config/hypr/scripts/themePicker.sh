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
clipse="clipse/custom_theme.json"
fastfetch="fastfetch/config.jsonc"
rofi="rofi/colors.rasi"


themes_dir="$HOME/.config/mythemes"

# run rofi
picked=$(echo -e "$themes" | rofi -dmenu -theme $HOME/.config/rofi/themePicker.rasi)

# function for purple-lime theme
purple_lime(){
    local purple_lime="$themes_dir/purple-lime"
    cp "$purple_lime/$rofi" "$config/$rofi"
    cp "$purple_lime/$cava" "$config/$cava"
    cp "$purple_lime/$clipse" "$config/$clipse"
    cp "$purple_lime/$fastfetch" "$config/$fastfetch"
}

# function for hatsune-miku theme
hatsune_miku(){
    local hatsune_miku="$themes_dir/hatsune-miku"
    cp "$hatsune_miku/$rofi" "$config/$rofi"
    cp "$hatsune_miku/$cava" "$config/$cava"
    cp "$hatsune_miku/$clipse" "$config/$clipse"
    cp "$hatsune_miku/$fastfetch" "$config/$fastfetch"
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