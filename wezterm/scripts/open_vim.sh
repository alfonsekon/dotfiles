#!/bin/bash

# this script is used by wezterm/.config/wezterm/keybinds.lua
# this script opens neovim in the specified path

path=$(pwd)

tab_id=$(wezterm cli spawn --cwd "$path")
wezterm cli set-tab-title --pane-id "$tab_id" "$(basename "$path")"

sleep 0.1

nvim "$path"
