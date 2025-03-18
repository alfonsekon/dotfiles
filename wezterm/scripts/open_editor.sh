#!/bin/bash

# this script is used by wezterm/.config/wezterm/keybinds.lua
# this script opens android-studio or vscode depending on the path

path=$(pwd)
# printf "$path"

if [[ "$path" == *"android-studio/"* ]]; then
    android-studio "$path" > /dev/null 2>&1 &
else
    code "$path" &
fi
