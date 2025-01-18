#!/usr/bin/env bash
set -euo pipefail

printf " "
free -h | awk '/Mem/{print $3}'
