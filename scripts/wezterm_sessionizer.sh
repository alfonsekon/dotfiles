#!/bin/bash

stty echo

CURRENT_PATH="$PWD"

selected=$(find "$CURRENT_PATH" -mindepth 1 -maxdepth 1 | fzf)

[ -z "$selected" ] && exit

selected=$(realpath "$selected")

if [[ "$selected" == *"android-studio/"* ]]; then
    echo "Opening in android-studio..."
    android-studio "$selected" &
else
    echo "Opening in vscode..."
    # code -n --reuse-window "$selected" &
    code -n --reuse-window "$selected" &
fi

stty echo