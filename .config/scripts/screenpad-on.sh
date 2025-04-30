#!/usr/bin/env bash
flock -w 5 /sys/class/backlight/asus_screenpad/bl_power -c "echo 0 > /sys/class/backlight/asus_screenpad/bl_power & sleep 1"
