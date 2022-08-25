#!/usr/bin/env bash

# test script; proof of concept: running python from bash script
# previously though coammdn substitution was necessary

if [[ "${NUMBER_OF_PARAMS}" -lt 1 ]]; then 
	echo "Usage: ${0} PORT [PORT]... "
	# exit 1 # this pesky line here
fi

for PORT in "${@}"
do
	python -m SimpleHTTPServer "${PORT}"
	echo "${PORT}: port used for simple server"
done
