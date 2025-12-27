#!/bin/bash

# this script is used by wezterm/.config/wezterm/keybinds.lua
# this script opens vscode

path=$(pwd)

code "$path" >/dev/null 2>&1
wezterm cli set-tab-title "$(basename "$path")"
i3 workspace 3 >/dev/null 2>&1
