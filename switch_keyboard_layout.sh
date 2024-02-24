#!/bin/sh

# verify current keyboards layout
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# define opposite layout
opposite_layout="us"
if [ "$current_layout" == "us" ]; then
    opposite_layout="es"
fi

# change keyboards layout to the opposite
setxkbmap $opposite_layout

