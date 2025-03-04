#!/bin/bash

#only call/execute sessionizers within a bash session.
#this will not behave as expected when inside vim or other TUI applications

selected=$(find ~/ ~/coding/android-studio/ ~/coding/vscode ~/school/third-year/second-sem ~/dotfiles -mindepth 1 -maxdepth 1 | fzf)

if [[ -z "$selected" ]]; then
    exit 0
fi

selected=$(realpath "$selected")

wezterm cli spawn --cwd "$selected"

sleep 0.1

nvim "$selected"