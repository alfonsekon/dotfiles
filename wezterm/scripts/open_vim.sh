#!/bin/bash

path=$(pwd)

tab_id=$(wezterm cli spawn --cwd "$path")
wezterm cli set-tab-title --pane-id "$tab_id" "$(basename "$path")"

sleep 0.1

nvim "$path"