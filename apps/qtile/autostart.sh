#!/bin/sh
ollama serve &
wlr-randr --output eDP-1 --scale 2
wlr-randr --output DP-2  --scale 2 --pos 0,1080
