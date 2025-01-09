#!/usr/bin/env bash
set -euo pipefail

VOLUME_SIG=35

case $1 in
	brightness-up)
	  brightnessctl set 1%+
	;;
	brightness-down)
	  brightnessctl set 1%-
	;;

	volume-mute)
	  pactl set-sink-mute @DEFAULT_SINK@ toggle
	;;
	volume-down)
	  pactl set-sink-volume @DEFAULT_SINK@ -5%
	;;
	volume-up)
	  pactl set-sink-volume @DEFAULT_SINK@ +5%
	;;

	screenshot)
	  maim -s | xclip -selection clipboard -t image/png -i
	;;
esac
