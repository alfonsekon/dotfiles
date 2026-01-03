focusedwindow=$(xdotool getactivewindow)
flameshot full -c >/dev/null
if [ "$focusedwindow" == "$(xdotool getactivewindow)" ]
then
	xdotool windowactivate $focusedwindow
fi
