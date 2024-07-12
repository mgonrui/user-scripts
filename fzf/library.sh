#!/bin/sh

term="alacritty"

killterm(){
    local seconds="$1"
    sleep $seconds
    pkill "$term" 
}

file=$(du -a --exclude "$HOME/documents/library/.caltrash" $HOME/documents/library | grep -ie "\.epub$" -ie "\.mobi$" -ie "\.pdf$" | cut -f2- | rev | cut -d. -f2- | rev | awk -F'/' '{print $NF}' | fzf -i -m --reverse)
# search filetypes in order of preference (if .pdf not found search for .epub, if .epub not found search for .mobi)
path=$(find $HOME/documents/library -type f -name "$file".pdf)
if ! [ -e "$path" ]; then
    path=$(find $HOME/documents/library -type f -name "$file".epub)
elif ! [ -e "$path" ]; then
    path=$(find $HOME/documents/library -type f -name "$file".mobi)
fi

if [ -e "$path" ]; then
	killterm 0.00001
	setsid zathura  "$path" 
else
	exit
fi
