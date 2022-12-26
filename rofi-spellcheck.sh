#!/usr/bin/env bash

case $ROFI_RETV in
	0) 
		# Get Version
		version=$(echo -en | enchant-2 -a)
		echo -en "\0prompt\x1fspell\n\0message\x1f$version\n";;
	1) wl-copy $@;;
	2)
		spell=$(echo -en $@ | enchant-2 -a);
		output=$(echo -en "$spell" | sed -E "/^@/d; /^$/d; s/&/&amp;/g; s/^(.+): /\\\\0message\x1f\1\n/; s/\\*/\\\\0message\x1fCorrect!\n$@\n/; s/, /\n/g; ");
		echo -en "$output";;
esac
exit 0

