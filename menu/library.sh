#!/bin/sh

killterm(){
    local seconds="$1"
    sleep $seconds
    pkill xterm 
}

file=$(du -a --exclude "$HOME/documents/library/.caltrash" ~/documents/library | grep -i "\.pdf$" | cut -f2- | rev | cut -d. -f2- | rev | awk -F'/' '{print $NF}' | fzf -i -m --reverse)
path=$(find ~/documents/library -type f -name "$file".pdf)

if [ -e "$path" ]; then
	killterm 0.001
	setsid zathura  "$path" 
else
	exit
fi