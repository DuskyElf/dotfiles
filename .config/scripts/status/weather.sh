#!/usr/bin/env bash
set -euo pipefail

printf "^C5^" # color

printf "$(curl wttr.in/ludhiana?format=%C%20%t)"

printf "^d^" # reset colors
