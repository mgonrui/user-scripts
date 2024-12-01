#!/bin/sh

not_found(){
	clear
	echo ""
	echo "DEVICE NOT FOUND"
	echo "PRESS ENTER TO GO BACK TO BLUETOOTH MENU"
	read
}

while true; do
device_name="DISCONNECT"
device_name+="
$(bluetoothctl devices | cut -d ' ' -f3-)"

device_name=$(echo "$device_name" | fzf)
device_id="$(bluetoothctl devices | grep "$device_name" | cut -d ' ' -f2)"

#for a do-nothing hit escape
if [ "$device_name" == "" ]; then
	bluetoothctl disconnect
	exit
fi

if [ "$device_name" == "DISCONNECT" ]; then
	bluetoothctl disconnect
	exit
else
	bluetoothctl disconnect
	bluetoothctl connect "$device_id" && exit
	not_found
 	clear
fi
done
