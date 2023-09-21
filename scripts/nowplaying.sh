#!/bin/bash
md=$(playerctl -p spotifyd metadata)

if [[ $md == "" ]]; then
	exit
fi

echo "$(echo "$(echo "$md" | grep "title")" | cut -d" " -f3- | awk '{ gsub(/^[ \t]+|[ \t]+$/, ""); print }') - $(echo "$(echo "$md" | grep "artist")" | cut -d" " -f3- | awk '{ gsub(/^[ \t]+|[ \t]+$/, ""); print }')" | 
	zscroll -b "♪ " -l 28 
