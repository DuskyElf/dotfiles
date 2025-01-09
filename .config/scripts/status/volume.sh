#!/usr/bin/env bash
set -euo pipefail

volume="$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/{print $5}')"
volume=${volume::-1}

if [ "$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')" = "yes" ]; then
  printf "󰖁"
elif [ $volume -gt 100 ]; then
  printf "󱄠"
elif [ $volume -gt 60 ]; then
  printf "󰕾"
elif [ $volume -gt 10 ]; then
  printf "󰖀"
elif [ $volume -gt 0 ]; then
  printf "󰕿"
else
  printf ""
fi

printf " %d%%" $volume
#kill -n 35 $(pidof dwmblocks)
