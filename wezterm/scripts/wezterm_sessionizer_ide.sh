#!/bin/bash

# this script is used by wezterm/.config/wezterm/keybinds.lua 
# this script opens a fuzzy finder in my common working directories and recent zoxide queries
# and opens either android-studio or vscode depending on the chosen directory.
# it also opens another wezterm tab within that directory

# NOTE:
# only call/execute sessionizers within a bash session.
# this will not behave as expected when inside vim or other TUI applications

dirs=(
  "$(pwd)"
  $(zoxide query -l)
  "$HOME"
  "$HOME/coding/android-studio"
  "$HOME/coding/vscode"
  "$HOME/school/third-year/second-sem"
  "$HOME/dotfiles"
)

selected=$(
  for d in "${dirs[@]}"; do
    [[ -d "$d" ]] && find "$d" -mindepth 1 -maxdepth 1
  done | fzf
)

if [[ -z "$selected" ]]; then
	sleep 0.1
	return
fi

selected=$(realpath "$selected")

if [[ -d "$selected" ]]; then
	cd "$selected"
	wezterm cli set-tab-title "$(basename "$selected")"

	# echo "Opening in vscode..."
	code -n --reuse-window "$selected" > /dev/null 2>&1
	i3 workspace 3 > /dev/null 2>&1
else
	dir_name=$(dirname "$selected")
	cd "$dir_name"

	wezterm cli set-tab-title "$(basename "$dir_name")"
	# echo "Opening in vscode..."
	code -n --reuse-window "$selected" > /dev/null 2>&1
	i3 workspace 3 > /dev/null 2>&1
fi
