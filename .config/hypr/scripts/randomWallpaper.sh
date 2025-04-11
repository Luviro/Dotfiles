#!/usr/bin/env bash

wallpapers_dir="$HOME/.wallpapers"

picked=$(find $wallpapers_dir -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" | shuf -n 1)

swww img "$picked" --transition-fps 200 --transition-type random --transition-duration 1
