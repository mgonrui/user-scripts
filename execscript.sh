#!/bin/sh

file=$(du -a ~/.scripts | grep -i "\.sh$" | cut -f2- | awk -F'/' '{print $NF}' | cut -d. -f1 | fzf --border --margin 20%)
path=$(find ~/.scripts -type f -name "$file".sh)

if [ -e "$path" ]; then
	sh "$path" &
else
	exit
fi
