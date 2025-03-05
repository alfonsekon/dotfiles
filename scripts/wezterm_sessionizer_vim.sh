#!/bin/bash

#only call/execute sessionizers within a bash session.
#this will not behave as expected when inside vim or other TUI applications

selected=$(find ~/ ~/coding/android-studio/ ~/coding/vscode ~/school/third-year/second-sem ~/dotfiles -mindepth 1 -maxdepth 1 | fzf)

if [[ -z "$selected" ]]; then
    exit 0
fi

selected=$(realpath "$selected")

number=$(wezterm cli spawn --cwd "$selected")
wezterm cli set-tab-title --tab-id "$number" "$(basename "$selected")"

sleep 0.1

nvim "$selected"