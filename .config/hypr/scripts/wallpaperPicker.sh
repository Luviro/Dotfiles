#!/bin/bash

# Check if rofi is already running
if pgrep -x "rofi" &> /dev/null; then
    hyprctl notify 1 2000 0 "fontsize:24  Rofi is already running"
    exit 1
fi

# The path of the wallpapers directory
wallpapers_dir="$HOME/.wallpapers"

# lists all images in the wallpaper directory
filenames=$(ls $wallpapers_dir | grep -E "\w+\.(jpg|png)")
echo $filenames

# make rofi display the icons for the wallpapers
entries=""
while IFS= read -r filename; do
    entries+="$filename\x00icon\x1f$wallpapers_dir/$filename\n"
done <<< "$filenames"
entries="${entries%\\n}"

# runs rofi
picked=$(echo -e "$entries" | rofi -dmenu -theme $HOME/.config/rofi/wallpaperPicker.rasi)

# check if you selected a wallpaper and apply it using swww
if [[ -n "$picked" ]]; then
    swww img "$wallpapers_dir/$picked" --transition-fps 200 --transition-type random --transition-duration 1
    hyprctl notify 5 2000 0 "fontsize:24 ✨ Wallpaper changed to $picked"
else
    hyprctl notify 4 2000 0 "fontsize:24  Didn't pick wallpaper?"
fi