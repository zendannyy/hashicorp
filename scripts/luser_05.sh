#!/bin/bash
# Script random password generator, for best results comment out first 2 or 3 options 


# least secure method - 3 random numbers 
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo -e "${PASSWORD}\n"

PASSWORD=$(date +%s%N)	# using current epoch time for password 
echo -e "${PASSWORD}\n"
 
PASSWORD=$(date +%s%N | sha256sum | head -c40) # using crypto hashes (checksums) and piping output 
echo -e "${PASSWORD}\n"

SPECIAL=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)	#Append special character
echo -e "${PASSWORD}${SPECIAL}\n"
