#!/bin/bash

# Get the connected Wi-Fi network name (SSID)
SSID=$(iwgetid -r)

# If not connected to any Wi-Fi, print "Not connected"
if [ -z "$SSID" ]; then
    echo "No Wi-Fi"
    exit 0
fi

# Get the signal strength (RSSI) from iwconfig
SIGNAL=$(iwconfig 2>/dev/null | grep -i "Signal level" | awk '{print $4}' | sed 's/level=//')

# Get the link quality from iwconfig
LINK_QUALITY=$(iwconfig 2>/dev/null | grep -i "Link Quality" | awk -F'=' '{print $2}' | cut -d'/' -f1)

# If the signal value is found, proceed with calculating the signal strength percentage
if [ -n "$SIGNAL" ]; then
    if [ "$SIGNAL" -ge -50 ]; then
        SIGNAL_PERCENT=100
    elif [ "$SIGNAL" -ge -60 ]; then
        SIGNAL_PERCENT=80
    elif [ "$SIGNAL" -ge -70 ]; then
        SIGNAL_PERCENT=60
    elif [ "$SIGNAL" -ge -80 ]; then
        SIGNAL_PERCENT=40
    elif [ "$SIGNAL" -ge -90 ]; then
        SIGNAL_PERCENT=20
    else
        SIGNAL_PERCENT=10
    fi
else
    SIGNAL_PERCENT=0
fi

# Output the SSID, signal strength percentage, and link quality
echo "$SSID: ${LINK_QUALITY}%"
