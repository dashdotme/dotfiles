#!/usr/bin/env bash

current=$(hyprctl getoption general:gaps_out | awk 'NR==1{print $4}')

if [ "$current" = "10" ]; then
    # Default -> Small
    hyprctl eval 'hl.config({ general = { gaps_in = 15, gaps_out = 100 } })'
elif [ "$current" = "100" ]; then
    # Small -> Fullscreen
    hyprctl eval 'hl.config({ general = { gaps_in = 0, gaps_out = 0 } })'
else
    # Fullscreen -> Default
    hyprctl eval 'hl.config({ general = { gaps_in = 5, gaps_out = 10 } })'
fi
