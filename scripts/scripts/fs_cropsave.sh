focusedwindow=$(xdotool getactivewindow)
flameshot gui -p "/home/$USER/Pictures/screenshots-i3/$(date +%Y-%m-%d_%H-%M-%S).png" >/dev/null
if [ "$focusedwindow" == "$(xdotool getactivewindow)" ]
then
	xdotool windowactivate $focusedwindow
fi
