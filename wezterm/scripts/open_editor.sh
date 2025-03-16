#!/bin/bash

path=$(pwd)
# printf "$path"

if [[ "$path" == *"android-studio/"* ]]; then
    android-studio "$path" > /dev/null 2>&1 &
else
    code "$path" &
fi
