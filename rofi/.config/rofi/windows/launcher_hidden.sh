#!/usr/bin/bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

theme="box"

dir="/home/sergio/.config/rofi/windows"

nodes=( $(bspc query -N -n .hidden ) ) && s=$(xtitle ${nodes[@]} |
    rofi -theme $dir/style_"$theme" -dmenu -i -format i -p " ")


c=n

if [[ -n "$s" ]]; then
    bspc query -N -n >/dev/null || c=d
    bspc node "${nodes[$s]}" -${c} focused -g hidden=off -f
fi
