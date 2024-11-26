#!/usr/bin/env bash
set -euo pipefail

# Hardware dependent settings like DPi
xrdb -merge -I$HOME ~/.Xresources

while true; do
  dwm 2> ~/.dwm.log
done
