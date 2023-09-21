#!/bin/bash
network=$(wpa_cli status)
intf=$(wpa_cli status | grep "interface" | awk '{print $3}')

# get connection speed
#echo ${network:51:11}

if [[ $network == *"wifi"* ]]; then
# show wifi icon according to signal
    signal=$(wpa_cli signal_poll | grep "AVG_RSSI")
	value=$(echo $signal | cut -d- -f2 | cut -d, -f2)
	# echo $value
	if [[ $value -lt 50 ]]; then 
		echo "󰤨 $intf"
	elif [[ $value -lt 67 ]]; then
		echo "󰤥 $intf"
	elif [[ $value -lt 81 ]]; then 
		echo "󰤢 $intf"
	else
		echo "󰤟 $intf"
	fi
elif [[ $network == *"ethernet  connected"* ]]; then
    echo "󰈀 $intf"
else
    echo "󰤭 No Network"
fi
