#!/bin/sh
file=$(du -a --exclude "$HOME/.scripts/menu" ~/.scripts/*.* | cut -f2- | rev | cut -d. -f2- | rev | awk -F'/' '{print $NF}' | fzf -i -m --reverse)
path=$(find ~/.scripts -type f -name "$file".sh)

if [ -e "$path" ]; then
	sh "$path" 
else
	exit
fi
