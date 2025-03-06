#!/bin/bash

#only call/execute sessionizers within a bash session.
#this will not behave as expected when inside vim or other TUI applications

selected=$(find $(pwd) ~/ ~/coding/android-studio/ ~/coding/vscode ~/school/third-year/second-sem ~/dotfiles -mindepth 1 -maxdepth 1 | fzf)

if [[ -z "$selected" ]]; then
    wezterm cli spawn --cwd "$PWD"
    exit 0
fi

selected=$(realpath "$selected")

if [[ "$selected" == *"android-studio/"* ]]; then
    new_pane_id=$(wezterm cli spawn --cwd "$selected")

    wezterm cli set-tab-title --pane-id "$new_pane_id" "$(basename "$selected")"

    echo "Opening in Android Studio..."
    android-studio "$selected" > /dev/null 2>&1 &
else
    if [[ -d "$selected" ]]; then
        cd "$selected"
        wezterm cli set-tab-title "$(basename "$selected")"

        echo "Opening in vscode..."
        code -n --reuse-window "$selected" &
        i3 workspace 3
    else
        dir_name=$(dirname "$selected")
        cd "$dir_name"

        wezterm cli set-tab-title "$(basename "$dir_name")"
        echo "Opening in vscode..."
        code -n --reuse-window "$selected" &
        i3 workspace 3
    fi
fi

clear
