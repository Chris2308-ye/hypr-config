!/usr/bin/bash
#start swww
WALLPAPER_DIR=/home/chris/Pictures/Wallpapers/
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
swww img "$WALLPAPER"
