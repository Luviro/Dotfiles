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

# The path of the wallpapers directory
wallpapers="$HOME/.wallpapers"

# regex to filter images
regex=".*\.\(jpg\|png\|jpeg\)"

# finds all images in the wallpaper directory and it's subdirectories
filenames=$(find "$wallpapers" -type f -regex $regex -printf "%P\n")

# make rofi display the icons for the wallpapers
entries=""
while IFS= read -r filename; do
    entries+="$filename\x00icon\x1f$wallpapers/$filename\n"
done <<< "$filenames"
entries="${entries%\\n}"

# runs rofi
picked=$(echo -e "$entries" | rofi -dmenu -theme $HOME/.config/rofi/wallpaperPicker.rasi)

# check if you selected a wallpaper and apply it using swww
if [[ -n "$picked" ]]; then
	swww img "$wallpapers/$picked" --transition-fps 200 --transition-type random --transition-duration 1
	hyprctl notify 5 2000 0 "fontsize:24 ✨ Wallpaper changed to $picked"
else 
	hyprctl notify 4 2000 0 "fontsize:24  Didn't pick wallpaper?"
fi
