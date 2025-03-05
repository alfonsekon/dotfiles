#!/bin/bash

#only call/execute sessionizers within a bash session.
#this will not behave as expected when inside vim or other TUI applications

CURRENT_PATH="$PWD"

selected=$(find ~/ ~/coding/android-studio/ ~/coding/vscode ~/school/third-year/second-sem ~/dotfiles -mindepth 1 -maxdepth 1 | fzf)

if [[ -z "$selected" ]]; then
    wezterm cli spawn --cwd "$PWD"
    exit 0
fi

full_path_selected=$(realpath "$selected")

#old (will still keep incase)
# #replace current tab with selection
# wezterm cli spawn --cwd "$selected"
# sleep 1
# wezterm cli set-tab-title "$(basename "$selected")"

#new (testing)
cd "$full_path_selected"
wezterm cli set-tab-title "$(basename "$full_path_selected")"

if [[ "$full_path_selected" == *"android-studio/"* ]]; then
    wezterm cli spawn --cwd "$selected"
    echo "Opening in android-studio..."
    android-studio "$full_path_selected" > /dev/null 2>&1 
    # android-studio "$selected" 
    i3 workspace 3
else
    echo "Opening in vscode..."
    code -n --reuse-window "$full_path_selected" 
    i3 workspace 3
fi

clear

#old
# wezterm cli kill-pane