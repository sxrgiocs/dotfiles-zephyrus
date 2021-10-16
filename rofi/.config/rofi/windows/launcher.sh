#!/usr/bin/bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

theme="box"

dir="/home/sergio/.config/rofi/windows"

rofi -modi window -show window rofi -kb-accept-entry '!Alt-Tab' -kb-row-down Alt-Tab -theme $dir/style_"$theme"

