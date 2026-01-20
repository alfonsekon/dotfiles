# i3 and i3blocks

run `stow -t $HOME i3`

```
. 
├── i3 
    ├── config 
    ├── config2 
    └── config.bak 
```

`config` and `config2`only vary in theme (wallpaper, shell prompt) and can be changed by running [`theme_switch`](../../scripts/scripts/theme_switch.sh)


```
. 
├── i3blocks 
    ├── battery 
    │   └── battery_info.sh 
    ├── clock.conf 
    ├── config 
    ├── cpu 
    │   └── cpu_info.sh 
    ├── i3blocks.conf 
    ├── sound 
    │   ├── sound_burst.sh 
    │   └── sound_info.sh 
    └── wifi 
        └── wifi_status.sh 
```
