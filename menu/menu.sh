#!/bin/sh
source killterm.sh
shopt -s expand_aliases

# get the list of all my packages
command_list="$(nix-store -q --references /var/run/current-system/sw | cut -d'-' -f2- |  cut -d '-' -f 1 | 
grep -vw -e "tutanota" -e "qownnotes" -e  "tor" -e "signal")"

# command_list="$(echo "$commandlist" | grep -v "signal")"
# append new options
command_list+="
www
notes
email
library
bluetooth
firefox osint
xscreensaver-settings
www vanilla
execscript
virt-manager
tor-browser
signal-desktop
lc 
hist
sr
mp
poweroff
proxmox
drracket
"

selected="$(echo "$command_list" | fzf -i -m --reverse  )"

source ~/.config/zsh/aliases.sh
[ -z "$selected" ] && exit

# custom menu scripts 
if [ "$selected" == "library" ]; then
    setsid sh ~/.scripts/menu/library.sh
elif [ "$selected" == "execscript" ]; then
    sh ~/.scripts/menu/execscript.sh
elif [ "$selected" == "bluetooth" ]; then
    sh ~/.scripts/menu/bluetooth.sh

# authenticator needs more time to load
elif [ "$selected" == "proxmox" ]; then
    killterm 0.001 &
    setsid chromium &> /dev/null
elif [ "$selected" == "www" ]; then
    killterm 0.001 &
    setsid $BROWSER &> /dev/null
elif [ "$selected" == "mp" ]; then
    killterm 0.001 &
    setsid strawberry &> /dev/null
elif [ "$selected" == "authenticator" ]; then
    killterm 0.01 &
    setsid authenticator &> /dev/null
elif [ "$selected" == "obsidian" ]; then
    killterm 0.01 &
    setsid obsidian &> /dev/null
elif [ "$selected" == "www vanilla" ]; then
    killterm 0.001 &
    setsid $BROWSER -P vanilla 
elif [ "$selected" == "firefox osint" ]; then
    killterm 0.001 &
    setsid firefox -P osint
elif [ "$selected" == "email" ]; then
    killterm 0.001 &
    setsid tutanota-desktop
elif [ "$selected" == "signal" ]; then
    killterm 0.001 &
    setsid signal-desktop 
elif [ "$selected" == "notes" ]; then
    killterm 0.001 &
    setsid qownnotes
# elif [ "$selected" == "tutanota" ]; then
else
    killterm 10 &
    killterm 0.001 &
    setsid "$selected"  &> /dev/null
fi

