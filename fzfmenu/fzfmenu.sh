#!/bin/sh
shopt -s expand_aliases
# get the list of all my packages
# command_list="$(echo "$commandlist" | grep -v "signal")"
# append new options
command_list=$(find $HOME/.scripts/fzfmenu -name '*.sh' -exec basename {} .sh \; )
selected="$(echo "$command_list" | fzf -i -m --reverse  )"
source $HOME/.config/zsh/aliases.sh

[ -z "$selected" ] && exit

bash "$HOME/.scripts/fzfmenu/$selected.sh"


#  "fzf $* < /proc/$$/fd/0 > /proc/$$/fd/1"
# killterm(){
#     local seconds="$1"
#     sleep $seconds
#     pkill xterm
# }
# [ -z "$selected" ] && exit
# # custom menu scripts
# if [ "$selected" == "library" ]; then
#     setsid sh ~/.scripts/menu/library.sh
# elif [ "$selected" == "execscript" ]; then
#     sh ~/.scripts/menu/execscript.sh
# elif [ "$selected" == "bluetooth" ]; then
#     sh ~/.scripts/menu/bluetooth.sh
# # authenticator needs more time to load
# elif [ "$selected" == "proxmox" ]; then
#     killterm 0.001 &
#     setsid chromium &> /dev/null
# elif [ "$selected" == "www" ]; then
#     killterm 0.001 &
#     setsid $BROWSER &> /dev/null
# elif [ "$selected" == "mp" ]; then
#     killterm 0.001 &
#     setsid strawberry &> /dev/null
# elif [ "$selected" == "authenticator" ]; then
#     killterm 0.01 &
#     setsid authenticator &> /dev/null
# elif [ "$selected" == "obsidian" ]; then
#     killterm 0.01 &
#     setsid obsidian &> /dev/null
# elif [ "$selected" == "firefox vanilla" ]; then
#     killterm 0.001 &
#     setsid firefox -P vanilla
# elif [ "$selected" == "firefox osint" ]; then
#     killterm 0.001 &
#     setsid firefox -P osint
# elif [ "$selected" == "email" ]; then
#     killterm 0.001 &
#     setsid tutanota-desktop
# elif [ "$selected" == "signal" ]; then
#     killterm 0.001 &
#     setsid signal-desktop
# elif [ "$selected" == "notes" ]; then
#     killterm 0.001 &
#     setsid qownnotes
# # elif [ "$selected" == "tutanota" ]; then
# else
#     killterm 10 &
#     killterm 0.001 &
#     setsid "$selected"  &> /dev/null
# fi
