#!/usr/bin/env bash
set -euo pipefail

VOLUME_SIG=35
BRIGHTNESS_SIG=36

case $1 in
	brightness-up)
	  brightnessctl set 1%+

	  screen_pad=$(cat /sys/class/backlight/asus_screenpad/bl_power)
    if [[ "$screen_pad" == "0" ]]; then
			brightnessctl --device=asus_screenpad set "$(($(brightnessctl get) * 100 / $(brightnessctl max) + 1))%"
    fi
	  kill -n "$BRIGHTNESS_SIG" $(pidof dwmblocks)
	;;
	brightness-down)
	  brightnessctl set 1%-

	  screen_pad=$(cat /sys/class/backlight/asus_screenpad/bl_power)
    if [[ "$screen_pad" == "0" ]]; then
			brightnessctl --device=asus_screenpad set "$(($(brightnessctl get) * 100 / $(brightnessctl max) + 1))%"
    fi
	  kill -n "$BRIGHTNESS_SIG" $(pidof dwmblocks)
	;;

	volume-mute)
	  pactl set-sink-mute @DEFAULT_SINK@ toggle
	  kill -n "$VOLUME_SIG" $(pidof dwmblocks)
	;;
	volume-down)
	  pactl set-sink-volume @DEFAULT_SINK@ -5%
	  kill -n "$VOLUME_SIG" $(pidof dwmblocks)
	;;
	volume-up)
	  pactl set-sink-volume @DEFAULT_SINK@ +5%
	  kill -n "$VOLUME_SIG" $(pidof dwmblocks)
	;;

	screenshot)
		flameshot gui
	;;
esac
