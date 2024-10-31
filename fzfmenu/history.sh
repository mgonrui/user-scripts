#!/bin/sh

cat $HOME/.cache/zsh/history | cut -d';' -f2 | fzf --tac | xclip -selection clipboard