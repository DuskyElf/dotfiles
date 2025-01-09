#!/usr/bin/env bash
#set -euo pipefail
set -u

while true; do
  wal -i ~/Pictures/wallpapers/ -s -t
  xsetroot -name "fsignal:xrdb"
  sleep 120
done
