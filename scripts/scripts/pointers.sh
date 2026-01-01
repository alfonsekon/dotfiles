#!/bin/bash

# touchpad property changes on ASUS Vivobook
xinput set-prop 'ASUF1300:00 2808:0203 Touchpad' "libinput Tapping Enabled" 1
xinput set-prop 'ASUF1300:00 2808:0203 Touchpad' "libinput Natural Scrolling Enabled" 0
xinput set-prop 'ASUF1300:00 2808:0203 Touchpad' "libinput Scrolling Pixel Distance" 20
xinput set-prop 'ASUF1300:00 2808:0203 Touchpad' "libinput Accel Speed" 0
xinput set-prop 'ASUF1300:00 2808:0203 Touchpad' "Coordinate Transformation Matrix" 1.0 0 0 0 1.0 0 0 0 1

# generic mouse/not-daily-driver mouse
generic_pointer() {
	if [ -z "$1" ]; then
		xinput | grep "slave  pointer" | awk '{print}'
		printf "\n"
		printf "    Usage: generic_pointer <device-id>\n"
		return 1
	fi

	xinput --set-prop "$1" "libinput Accel Speed" 0
	xinput --set-prop "$1" "Coordinate Transformation Matrix" 0.6 0 0 0 0.6 0 0 0 1
	echo "generic_pointer success"
}

# automatically 
ugreen_pointer() {
	if [ -z "$1" ]; then
		device_id=$(xinput | grep "slave  pointer" | grep -m 1 UGREEN | awk '{print $5}' | cut -d= -f2)
		echo "$device_id"
		printf "    Usage: ugreen_pointer <device-id>\n"
		generic_pointer $device_id
		return 0
	fi

	xinput --set-prop "$1" "libinput Accel Speed" 0
	xinput --set-prop "$1" "Coordinate Transformation Matrix" 0.6 0 0 0 0.6 0 0 0 1
}
        
ugreen_pointer
