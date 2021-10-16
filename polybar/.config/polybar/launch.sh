########################################################################
#                      O N L Y  O N E  D I S P L A Y                   #
########################################################################

#!/bin/bash

# Terminate already running bar instances
#killall -q polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
#polybar example &

#echo "Polybar launched..."

########################################################################
#                  M U L T I P L E  D I S P L A Y S                    #
########################################################################

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

BAR_NAME=mainbar

IFS=$'\n'

for item in $(polybar --list-monitors); do
    MONITOR=$(echo $item | cut -d" " -f1 | cut -d":" -f1)
    IS_PRIMARY=$(echo $item | cut -d" " -f3)
    if [[ $IS_PRIMARY == *"primary"* ]]; then
        TRAY_POSITION=right MONITOR=$MONITOR polybar --reload $BAR_NAME &
    else
        MONITOR=$MONITOR polybar --reload $BAR_NAME &
    fi
done

killall xembedsniproxy
