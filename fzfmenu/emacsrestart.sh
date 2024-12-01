#!/usr/bin/env sh

pkill emacs

/usr/bin/emacs --daemon
setsid emacsclient -c >/dev/null 2>&1 & disown ; sleep 0.5
