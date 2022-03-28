#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="winicons"

dir="$HOME/.config/rofi/launcher/styles"

#-window-thumbnail

rofi -no-lazy-grab -show window -show-icons\
-modi window \
-theme $dir/"$style" \
-kb-accept-entry '!Alt-Tab' -kb-row-down Alt-Tab \

