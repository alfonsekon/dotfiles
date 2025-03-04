#!/bin/bash

selected=$(find ~/ ~/coding/android-studio/ ~/coding/vscode ~/school/third-year/second-sem ~/dotfiles -mindepth 1 -maxdepth 1 | fzf)

if [[ -z "$selected" ]]; then
    exit 0
fi

selected=$(realpath "$selected")

wezterm cli spawn --cwd "$selected"

sleep 0.1

nvim "$selected"