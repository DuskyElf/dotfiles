#!/usr/bin/env bash
set -euo pipefail

printf "^C8^" # color

brightness="$(brightnessctl | grep 'Current brightness' | awk '{print $4}')"
brightness=${brightness:1:-2} # (11%) -> 11

if [ $brightness -gt 90 ]; then
  printf "󰃠"
elif [ $brightness -gt 40 ]; then
  printf "󰃝"
elif [ $brightness -gt 19 ]; then
  printf "󰃟"
else
  printf "󰃞"
fi

printf " %d%%" $brightness
printf "^d^" # reset colors
