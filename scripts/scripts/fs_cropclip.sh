focusedwindow=$(xdotool getactivewindow)
flameshot gui -c >/dev/null
if [ "$focusedwindow" == "$(xdotool getactivewindow)" ]
then
	xdotool windowactivate $focusedwindow
fi
