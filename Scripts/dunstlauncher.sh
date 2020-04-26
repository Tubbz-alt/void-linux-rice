#!/usr/bin/bash

# thanks to u/torreemanuele6 on reddit https://www.reddit.com/r/bspwm/comments/d08bzz/dunst_pywal/

source "${HOME}/.cache/wal/colors.sh"

/usr/bin/dunst \
    -lb "${color0:-#F0F0F0}" \
    -nb "${color0:-#F0F0F0}" \
    -cb "${color0:-#F0F0F0}" \
    -lf "${color15:=#000000}" \
    -bf "${color15:=#000000}" \
    -cf "${color15:=#000000}" \
    -nf "${color15:=#000000}"
