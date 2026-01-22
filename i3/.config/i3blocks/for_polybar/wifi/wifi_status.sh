#!/bin/bash

# Get the connected Wi-Fi network name (SSID)
SSID=$(iwgetid -r)

# If not connected to any Wi-Fi, print "Not connected"
if [ -z "$SSID" ]; then
    echo "No Wi-Fi"
    exit 0
fi
# Get the link quality from iwconfig
LINK_QUALITY=$(iwconfig 2>/dev/null | grep -i "Link Quality" | awk -F'=' '{print $2}' | cut -d'/' -f1)

# Output the SSID, signal strength percentage, and link quality
echo "$SSID: ${LINK_QUALITY}% "
