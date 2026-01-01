#!/bin/sh

sel=$(greenclip print | rofi -dmenu -i -p "Clipboard" -theme "$HOME/.config/rofi/launchers/type-6/style-8.rasi") || exit 0

# Remove rofi newline
sel=$(printf "%s" "$sel")

if [ -f "$sel" ]; then
    xclip -selection clipboard -t image/png -i "$sel"
else
    printf "%s" "$sel" | xclip -selection clipboard
fi
