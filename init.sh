#!/bin/sh

# set screen layout and resolution for X
sh $HOME/.scripts/switch_screens.sh &
/usr/bin/emacs --daemon &
# disable trackpoint 
# trackpad settings
xinput set-prop "AlpsPS/2 ALPS DualPoint TouchPad" 'libinput Accel Speed' 1 &
xinput set-prop "AlpsPS/2 ALPS DualPoint TouchPad" 'libinput Accel Profile Enabled' 0, 1 &
#perixx mouse
xinput set-prop 14 322 -0.4
xinput set-prop 14 325 0, 1
#launch programs
redshift &
flameshot &

# _______PROGRAMS THAT RUN WITH A NON-ROOT CRONTAB______
# 
#_________PROGRAMS THAT RUN WITH A ROOT CRONTAB________
#

