#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="text"

dir="$HOME/.config/rofi/launcher/styles"

rofi -no-lazy-grab -show filebrowser  \
-modi run,drun,window,ssh,filebrowser \
-theme $dir/"$style" -disable-history

