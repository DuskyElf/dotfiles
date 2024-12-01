#!/usr/bin/env bash
set -euo pipefail

# Utils
~/.config/scripts/random-bg.sh &

while true; do
  # Hardware dependent settings like DPi
  xrdb -merge -I$HOME ~/.Xresources
  xrandr --output "DP-2" --below "eDP-1"

  dwmblocks &
  dwm 2> ~/.dwm.log

  # Cleanup
  pkill dwmblocks
done
