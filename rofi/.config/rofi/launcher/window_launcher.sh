#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="winicons"

dir="$HOME/.config/rofi/launcher/styles"

rofi -no-lazy-grab -show window -window-thumbnail -show-icons\
-modi run,drun,window,ssh,filebrowser \
-theme $dir/"$style" \
-kb-accept-entry '!Alt-Tab' -kb-row-down Alt-Tab \

