#!/bin/sh

ACPI_RES=$(acpi -b)
ACPI_CODE=$?
if [ $ACPI_CODE -eq 0 ]
then
    BAT_LEVEL_ALL=$(echo "$ACPI_RES" | grep -v "unavailable" | grep -E -o "[0-9][0-9]?[0-9]?%")
    BAT_LEVEL=$(echo "$BAT_LEVEL_ALL" | awk -F"%" 'BEGIN{tot=0;i=0} {i++; tot+=$1} END{printf("%d%%\n", tot/i)}')
    TIME_LEFT=$(echo "$ACPI_RES" | grep -v "unavailable" | grep -E -o "[0-9]{2}:[0-9]{2}:[0-9]{2}")
    IS_CHARGING=$(echo "$ACPI_RES" | grep -v "unavailable" | awk '{ printf("%s\n", substr($3, 0, length($3)-1) ) }')

    if [ -z "$TIME_LEFT" ]; then TIME_LEFT="00:00:00"; fi
    TIME_LEFT=$(echo $TIME_LEFT | awk '{ printf("%s\n", substr($1, 0, 5)) }')

    # Define Gruvbox Hex Colors
    COLOR_YELLOW="#fabd2f" # Charging
    COLOR_RED="#fb4934"    # Low
    COLOR_BLUE="#83a598"   # Discharging (your primary)

    # Logic to determine icon and color
    if [ "$IS_CHARGING" = "Charging" ]; then
        ICON="CHR:" # Nerd Font Charging Bolt
        COLOR=$COLOR_YELLOW
    elif [ "${BAT_LEVEL%?}" -le 20 ]; then
        ICON="BATT:" # Nerd Font Battery Low
        COLOR=$COLOR_RED
    else
        ICON="BATT:" # Nerd Font Battery Full
        COLOR=$COLOR_BLUE
    fi

    # Output using Polybar Formatting Tags: %{F#HEX} text %{F-}
    echo "%{F$COLOR}$ICON $BAT_LEVEL ($TIME_LEFT)%{F-}"
fi
