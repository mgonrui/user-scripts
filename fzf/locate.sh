

path=$(plocate  /  |  fzf -e -i -m --reverse --border )


if [ -e "$path" ]; then
	if [[ "$path" == "/home/mgr/"* ]]; then 
		xdg-open >/dev/null 2>&1 "$path" &
	else
		echo "$path"
		sudo nvim "$path" 
	fi
else
	exit
fi