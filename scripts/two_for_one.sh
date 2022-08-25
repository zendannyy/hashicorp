#!/usr/bin/env bash 
# two-fer , 2 for one 

# whatever name you pass it at CLI
NAME="${1}"
NUMBER_OF_PARAMS="${#}"	# variable

if [[ "${NUMBER_OF_PARAMS}" -lt 1 ]]; then 
	echo "Usage: ${0} NAME [NAME]... "
	exit 1 
else
	echo -e "One for ${NAME}, one for me. \n"
fi

