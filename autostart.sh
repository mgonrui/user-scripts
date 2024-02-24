#!/bin/sh

# start ssh-agent
#[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
# set screen layout and resolution for X
sh $HOME/.scripts/switch_screens.sh &

#mouse settings

# disable trackpoint 
# trackpad settings
xinput set-prop "AlpsPS/2 ALPS DualPoint TouchPad" 'libinput Accel Speed' 1 &
xinput set-prop "AlpsPS/2 ALPS DualPoint TouchPad" 'libinput Accel Profile Enabled' 0, 1 &


#launch programs
redshift &
flameshot &

# _______PROGRAMS THAT RUN WITH A NON-ROOT CRONTAB______
# 
#_________PROGRAMS THAT RUN WITH A ROOT CRONTAB________
#
