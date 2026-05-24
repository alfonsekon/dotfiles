#!/bin/bash

#PREV=""
#PLAY=""
#PAUSE=""
#STOP=""
#NEXT=""
#REW=""
#FF=""

status=$(playerctl status 2>/dev/null)

if [[ "$status" == "Playing" ]]; then
  PP=""
else
  PP=""
fi

echo "%{A1:playerctl previous:}%{A} \
%{A1:playerctl position 10-:}%{A} \
%{A1:playerctl play-pause:}$PP%{A} \
%{A1:playerctl position 10+:}%{A} \
%{A1:playerctl next:}%{A}"
