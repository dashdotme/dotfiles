#!/usr/bin/env bash

current=$(hyprctl getoption general:gaps_out | awk '{print $3}')
if [ "$current" = "10" ]; then
    hyprctl keyword general:gaps_in 15
    hyprctl keyword general:gaps_out 100
else
    hyprctl keyword general:gaps_in 5
    hyprctl keyword general:gaps_out 10
fi
