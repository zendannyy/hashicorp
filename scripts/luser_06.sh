#!/bin/bash
# Script random password generator, with argument options 

NUMBER_OF_PARAMS="${#}"	# variable

if [[ "${NUMBER_OF_PARAMS}" -lt 1 ]]; then 
	echo "Usage: ${0} -l [LENGTH]... "
	exit 1 
fi

 
 # argparser -h equivalent for bash
 usage() {
  echo "Usage: ${0} [-vsa] [-l LENGTH]" >&2
  echo 'Generate a random password.' >&2
  echo '  -l LENGTH  	Specify the password length.' >&2
  echo '  -s 		Append a special character to the password.' >&2
  echo '  -a 		Hash the password with sha256sum' >&2
  echo '  -f 		Use shuf to scramble characters' >&2
  echo '  -v         	Increase verbosity.' >&2
  exit 1
}


log() {
  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = 'true' ]];then
    echo -e "${MESSAGE}\n"
  fi
}

# Set a default password length.
LENGTH=48

# separation by colon means you specify flag after arg 
# ex: ./luser_06.sh -l 31 -sha
while getopts fvl:sa OPTION
do
  case ${OPTION} in
    v)
      VERBOSE='true'
      log 'Verbose mode on.'
      ;;
    # when an option requires an arg
    l)
      LENGTH="${OPTARG}"
      ;;
    s)
      USE_SPECIAL_CHARACTER='true'
      ;;
    a)
		SHA='true'
		;;
	  f)
      SHUF='true'
		;;
    ?)
      usage
      ;;
  esac
done

# OPTIND stores position of next arg after last option 
shift "$(( OPTIND - 1 ))"

if [[ "${#}" -gt 0 ]];then
  usage
fi

log 'Generating a password.'

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | shuf | head -c"${LENGTH}") # using crypto hashes (checksums) and piping output 


# if [[ "$2" -eq "sha" ]]; then
if [[ "${SHA}" = 'true' ]];then
	log 'Generating a cryptographic hash'
	SHA=$(echo "${RANDOM}" | shuf | sha256sum)
	PASSWORD=$(date +%s%N | sha256sum | head -c40) # using crypto hashes (checksums) and piping output 
	echo -e "${PASSWORD}${SHA}\n"
	log 'Password generator is done'
fi 

# Use shuf to scramble characters
if [[ "${SHUF}" = 'true' ]]; then
 	log 'Using shuf to scramble'
 	PASSWORD=$(date +%s%N | sha256sum | head -c40)
	SALT=$(echo ${PASSWORD} | fold -w1 | shuf | head -c10)	#Append shuffed characters with spaces
	# SALT=$(echo ${RANDOM}'$$' | fold -w1 | shuf | head -c10)
	echo -e "${PASSWORD}${SALT}\n"
	echo "Got to get rid of this"
else 
	echo 'Continue'
fi 


# Append a special character if requested to do so.
if [[ "${USE_SPECIAL_CHARACTER}" = 'true' ]];then
  log 'Selecting a random special character.'
  SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf -ze -n10 {A..z} {a..z} {0..9} | head -c10)
  PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
  echo -e "${PASSWORD}\n"
  log 'Password generator is done'
fi


echo "${PASSWORD}"
echo 'Password generator is done'

exit 0
