#!/bin/bash
md=$(playerctl metadata)

if [[ $md == "" ]]; then
	exit
fi

title=$(echo "$(echo "$md" | grep "title")" | cut -d" " -f3- | awk '{ gsub(/^[ \t]+|[ \t]+$/, ""); print }')
artist=$(echo "$(echo "$md" | grep "artist")" | cut -d" " -f3- | awk '{ gsub(/^[ \t]+|[ \t]+$/, ""); print }')
echo "$title - $artist"
