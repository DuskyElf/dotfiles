#!/usr/bin/env bash
set -euo pipefail

printf "^C6^" # color

printf " "
printf "$(free -h | awk '/Mem/{print $3}')"

printf "^d^" # reset colors
