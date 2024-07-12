#!/bin/sh

# for discovering new devices and storing them permanently in 'bluetoothctl devices':
# bluetoothctl
# power on
# scan on
# connect XXXXXXX
# after that youll need to make a manual entry for the device in this script if its the first time

not_found(){
	clear
	echo ""
	echo "DEVICE NOT FOUND"
	read
}
while true; do
device="DISCONNECT"
device+="
$(bluetoothctl devices | cut -d ' ' -f3-)"

device=$(echo "$device" | fzf)

#for a do-nothing hit escape
if [ "$device" == "" ]; then
	exit
fi

bluetoothctl disconnect
if [ "$device" == "DISCONNECT" ]; then
	exit
elif [ "$device" == "OpenRun by Shokz" ]; then
	bluetoothctl connect 20:74:CF:95:6D:8D && exit
	not_found
elif [ "$device" == "AUKEY BR-C1" ]; then
	bluetoothctl connect FC:58:FA:A1:00:82 && exit
	not_found
elif [ "$device" == "Bose QC35 II" ]; then
	bluetoothctl connect 2C:41:A1:82:E2:47 && exit
	not_found
else
	clear
	echo "DEVICE NOT REGISTERED"
	read
fi
clear
done
