#!/bin/bash

project=$(find ~/ ~/coding/android-studio/ ~/coding/vscode ~/school/third-year/second-sem ~/dotfiles -mindepth 1 -maxdepth 1 | fzf)

if [[ -z "$project" ]]; then
    exit 0
fi

if [[ -d "$project" ]]; then
    cd "$project" || exit
    wezterm cli set-tab-title "$(basename "$project")"
    wezterm cli spawn --cwd "$project" nvim "$project"
else
    wezterm cli set-tab-title "$(basename "$project")"
    nvim "$project"
fi

exec $SHELL