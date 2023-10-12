#!/usr/bin/env bash

# Select "wayland" or "x11"
display_server="wayland"

case $ROFI_RETV in
	0) 
		# Get Version
		version=$(echo -en | enchant-2 -a)
		echo -en "\0prompt\x1fspell\n\0message\x1f$version\n";;
	1) 
        if [ $display_server == "wayland" ]; then wl-copy $@
        elif [ $display_server == "x11" ]; then echo -en $@ | xclip -i -selection clipboard > /dev/null
        else exit 1; fi ;;
	2)
		spell=$(echo -en $@ | enchant-2 -a);
		output=$(echo -en "$spell" | sed -E "/^@/d; /^$/d; s/&/&amp;/g; s/^(.+): /\\\\0message\x1f\1\n/; s/\\*/\\\\0message\x1fCorrect!\n$@\n/; s/, /\n/g; ");
		echo -en "$output";;
esac
exit 0

