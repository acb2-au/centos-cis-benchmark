#!/bin/sh

# 6.2.1 Ensure password fields are not empty (Scored)

if [[ -r /etc/shadow ]]; then

	export result=$(cat /etc/shadow | awk -F: '($2 == "" ) { print $1}')

	if [[ $result -eq '' ]]; then
		exit 0
	else
		exit 1
	fi
else
	exit 1
fi
