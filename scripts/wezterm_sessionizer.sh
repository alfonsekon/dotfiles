#!/bin/bash

selected=$(find . -mindepth 1 -maxdepth 1 -type d | fzf)

[ -z "$selected" ] && exit

selected=$(realpath "$selected")

code -n --reuse-window "$selected"