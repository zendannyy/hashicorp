#!/bin/bash
# script will generate a random password for each user , & display what user typed (pos. parameter)

echo "You executed this command: ${0}"
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script"  # command substitution 

# Tell user how many arg they passed in ( Inside script they are parameters, Outside script they are arguments)
NUMBER_OF_PARAMS="${#}"	# variable
echo "You supplied ${NUMBER_OF_PARAMS} argument(s) on the command line"

if [[ "${NUMBER_OF_PARAMS}" -lt 1 ]]; then 
	echo "Usage: ${0} USER_NAME [USER_NAME]... "
	exit 1 
fi

for USER_NAME in "${@}"		# special param to pass all user supplied arguments no matter how many they supply
do 
	PASSWORD=$(date +%s%N | sha256sum | shuf | head -c40)   #Append special character
	echo "${USER_NAME}: ${PASSWORD}" 
done 