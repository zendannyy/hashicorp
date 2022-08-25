#!/usr/bin/env bash
# displays basic stats about system

echo -e "Your UID is ${UID}\n"

if [[ "${UID}" -ne 0 ]]; then
	echo -e "Your uid is ${UID}\n"

fi

echo -e "Running ${1} now..\n"
# show hostname and current date
hostname; date
# show system's kernel and architecture
uname -rm
# disk usage 
df -h 
echo -e "Finishing ${1} now..\n"
