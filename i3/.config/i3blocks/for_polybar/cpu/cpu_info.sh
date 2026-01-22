#!/bin/sh
TEMP=$(sensors | grep 'Package id 0:\|Tdie' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
CPU_USAGE=$(mpstat 2 1 | awk 'END{print 100-$NF}')
echo "$CPU_USAGE $TEMP" | awk '{ printf("CPU :%5s% @ %s\n"), $1, $2 }'
