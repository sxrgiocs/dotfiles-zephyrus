########################################################################
#                      O N L Y  O N E  D I S P L A Y                   #
########################################################################

#!/bin/bash

# Terminate already running bar instances
# killall -q polybar
# 
# # Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# 
# # Launch Polybar, using default config location ~/.config/polybar/config
# polybar mainbar & polybar window & polybar utils & polybar system & polybar net & polybar date &
# 
# echo "Polybar launched..."

########################################################################
#                  M U L T I P L E  D I S P L A Y S                    #
########################################################################

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
 
MONITOR="eDP" polybar --reload laptop &
MONITOR="HDMI-A-0" polybar --reload desktop &
