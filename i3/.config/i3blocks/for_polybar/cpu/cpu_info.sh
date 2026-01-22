#!/bin/sh

# Get Temperature
TEMP=$(sensors | grep 'Package id 0:\|Tdie' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)

# Get CPU Usage
CPU_USAGE=$(mpstat 2 1 | awk 'END{print 100-$NF}')

# Define Gruvbox Colors
GREEN="#b8bb26"
BLUE="#83a598"

# Print with Polybar color tags
# %% is used to escape the % symbol so awk doesn't get confused
echo "$CPU_USAGE $TEMP" | awk -v g="$GREEN" -v b="$BLUE" '{ 
    printf("%%{F%s}CPU:%%{F-} %%{F%s}%6s%% @ %s%%{F-}\n", g, b, $1, $2) 
}'
