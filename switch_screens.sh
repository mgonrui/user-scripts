#!/bin/sh
laptop_screen="eDP-1"
left_monitor="HDMI-1"
right_monitor="DP-2"
# detect if  both external monitors are connected
if (xrandr | grep -q "$left_monitor connected") && (xrandr | grep -q "$right_monitor connected"); then
# turn on monitors 
	xrandr --output "$left_monitor" --mode 1280x1024
	xrandr --output "$right_monitor" --mode 1440x900 --right-of "$left_monitor"
# turn off laptop screen
	xrandr --output "$laptop_screen" --off
# restart qtile
	qtile cmd-obj -o cmd -f reload_config

# detect if both external monitors are disconnected
elif (xrandr | grep -q "$left_monitor disconnected") && (xrandr | grep -q "$right_monitor disconnected"); then
# turn on laptop screen 
	xrandr --output "$laptop_screen" --mode 1920x1080
# turn off monitors
	xrandr --output "$right_monitor" --off
	xrandr --output "$left_monitor" --off
# restart qtile
	qtile cmd-obj -o cmd -f reload_config
fi