#!/usr/bin/env bash
set -euo pipefail

# Hardware dependent settings like DPi
xrdb -merge -I$HOME ~/.Xresources
xrandr --output "DP-2" --below "eDP-1"

# Utils
~/.config/scripts/random-bg.sh &

while true; do
  dwm 2> ~/.dwm.log
done
