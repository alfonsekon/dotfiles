#!/bin/bash

tab_id=$(wezterm cli list-clients | awk 'NR>1 {print $7}')

mv /home/luis/.config/i3/config /home/luis/.config/i3/tmp
mv /home/luis/.config/i3/config2 /home/luis/.config/i3/config
mv /home/luis/.config/i3/tmp /home/luis/.config/i3/config2
i3 restart > /dev/null 2>&1
echo "source ~/.cache/omp_theme" | /usr/bin/wezterm cli send-text --pane-id $tab_id
