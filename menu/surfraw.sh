#!/usr/bin/env bash
# AUTHOR: gotbletu (@gmail|twitter|youtube|github|lbry)
#         https://www.youtube.com/user/gotbletu
# DESC:   search internet from a list of search engines
# DEPEND: fzf surfraw grep gawk coreutils util-linux
# REQD:   make sure to set your browser variable in your shellrc
#           vim ~/.bashrc
#           export BROWSER=chromium

# select your elvi
PREFIX=$(surfraw -elvi | grep -v 'LOCAL\|GLOBAL'| fzf -e -m --reverse | awk '{print $1}')
[ -z "$PREFIX" ] && exit
clear
echo "Search Engine(s): $PREFIX" | tr '\n' ' '
echo
read -r -e -p "Enter Keywords: " INPUT
# # Note: dont qoute $INPUT it will mess up results
# echo "$PREFIX" | while read -r line; do setsid -f surfraw -browser="$BROWSER" "$line" $INPUT ; done
surfraw >/dev/null 2>&1 -browser="firefox" "$PREFIX" $INPUT &
