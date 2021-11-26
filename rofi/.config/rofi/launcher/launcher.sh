#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="icons"

dir="$HOME/.config/rofi/launcher/styles"

rofi -no-lazy-grab -show drun  \
-modi run,drun,window,filebrowser \
-theme $dir/"$style"

