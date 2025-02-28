#!/bin/bash

stty echo

CURRENT_PATH="$PWD"

selected=$(find "$CURRENT_PATH" ~/ ~/coding ~/coding/android-studio ~/coding/vscode ~/school -mindepth 1 -maxdepth 1 | fzf)

[ -z "$selected" ] && exit

selected=$(realpath "$selected")

if [[ "$selected" == *"android-studio/"* ]]; then
    echo "Opening in android-studio..."
    android-studio "$selected" > /dev/null 2>&1 &
else
    echo "Opening in vscode..."
    # code -n --reuse-window "$selected" &
    code -n --reuse-window "$selected" &
fi

stty echo
