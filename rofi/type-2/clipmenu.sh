#!/usr/bin/env bash

# Point to your exact theme directory
dir="$HOME/.config/rofi/type-2"
theme='style-2'

# Pull history from cliphist and send it straight to your themed rofi instance
cliphist list | rofi \
    -dmenu \
    -p "Clipboard" \
    -theme ${dir}/${theme}.rasi | cliphist decode | wl-copy
