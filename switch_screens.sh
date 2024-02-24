#!/bin/sh

# detect if  both external monitors are connected
if (xrandr | grep -q "HDMI1 connected") && (xrandr | grep -q "DP2 connected"); then
# turn on monitors 
	xrandr --output "HDMI1" --mode 1440x900
	xrandr --output "DP2" --mode 1280x1024 --left-of "HDMI1"
# turn off laptop screen
	xrandr --output "eDP1" --off
# restart qtile
	qtile cmd-obj -o cmd -f reload_config

# detect if both external monitors are disconnected
elif (xrandr | grep -q "HDMI1 disconnected") && (xrandr | grep -q "DP2 disconnected"); then
# turn on laptop screen 
	xrandr --output "eDP1" --mode 1920x1080
	# xrandr --output "HDMI1" --mode 1920x1080 --right-of "eDP1"
# turn off monitors
	xrandr --output "DP2" --off
	xrandr --output "HDMI1" --off
# restart qtile
	qtile cmd-obj -o cmd -f reload_config
fi