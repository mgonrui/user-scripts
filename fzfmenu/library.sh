#!/bin/sh
export FZF_DEFAULT_OPTS="-e -i --info=hidden --layout=reverse --scroll-off=5 --tiebreak=index --bind 'home:first,end:last'"

file=$(du -a --exclude "$HOME/documents/library/.caltrash" $HOME/documents/library | grep -ie "\.epub$" -ie "\.mobi$" -ie "\.pdf$" | cut -f2- | rev | cut -d. -f2- | rev | awk -F'/' '{print $NF}' | fzf -i -m --reverse)
# search filetypes in order of preference (if .pdf not found search for .epub, if .epub not found search for .mobi)
path=$(find $HOME/documents/library -type f -name "$file".pdf)
if ! [ -e "$path" ]; then
    path=$(find $HOME/documents/library -type f -name "$file".epub)
elif ! [ -e "$path" ]; then
    path=$(find $HOME/documents/library -type f -name "$file".mobi)
fi

if [ -e "$path" ]; then
	setsid zathura "$path" >/dev/null 2>&1 & disown ; sleep 0.00001
else
	exit
fi
