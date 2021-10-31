#!/usr/bin/bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="box"
dir="$HOME/.config/rofi/launcher"
color="themes/NightParrot.rasi"

ALPHA="#00000000"
BG="#0f0b29"
FG="#ffffff"
SELECT="#383d63"

ACCENT="#070417"

# overwrite colors file
cat > $dir/"$color" <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

# comment these lines to disable random style
#themes=($(ls -p --hide="launcher.sh" --hide="colors.rasi" $dir))
#theme="${themes[$(( $RANDOM % 12 ))]}"

rofi -no-lazy-grab -show run -modi run -theme $dir/style_"$style"
