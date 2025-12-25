#!/bin/sh

# Load X resources (cursor size/theme, DPI, etc.)
xrdb -merge ~/.Xresources

# Force cursor settings early
export XCURSOR_SIZE=26
export XCURSOR_THEME=macOS

# Prevent cursor reset
xsetroot -cursor_name left_ptr

# Start i3
exec i3
