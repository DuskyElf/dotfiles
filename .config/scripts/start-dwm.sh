#!/usr/bin/env bash
set -euo pipefail

# Utils
~/.config/scripts/random-bg.sh &

while true; do
  # Hardware dependent settings like DPi
  xrdb -merge -I$HOME ~/.Xresources
  xrandr --output "DP-2" --below "eDP-1"

  setxkbmap -option caps:escape

  dwmblocks &
  pipewire &
  picom &
  dunst &
  brightnessctl set 15%
  dwm

  # Cleanup
  pkill dwmblocks
  pkill pipewire
  pkill picom
  pkill dunst
done
