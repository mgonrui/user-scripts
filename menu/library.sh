#!/bin/sh

killterm(){
    local seconds="$1"
    sleep $seconds
    pkill xterm 
}

file=$(du -a --exclude "$HOME/documents/library/.caltrash" $HOME/documents/library | grep -ie "\.epub$" -ie "\.pdf$" | cut -f2- | rev | cut -d. -f2- | rev | awk -F'/' '{print $NF}' | fzf -i -m --reverse)
path=$(find $HOME/documents/library -type f -name "$file".pdf)

if ! [ -e "$path" ]; then
    path=$(find $HOME/documents/library -type f -name "$file".epub)
fi

if ! [ -e "$path" ]; then
    path=$(find $HOME/documents/library -type f -name "$file".mobi)
fi

if [ -e "$path" ]; then
	killterm 0.001
	setsid zathura  "$path" 
else
	exit
fi
