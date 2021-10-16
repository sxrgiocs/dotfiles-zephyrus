#!/usr/bin/bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

theme="locate"
color="themes/NightParrot.rasi"

dir="/home/sergio/.config/rofi/locate/"

xdg-open $(locate home media | rofi -theme $dir/style_"$theme" -dmenu -i -p "")

