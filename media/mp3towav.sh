#! /bin/bash

show_help() {
	echo 'Usage: '`basename ${0}`' [file.mp3...]'
	exit 1
}

MPG123=`command -v mpg123`
if [[ ! ${MPG123} ]]; then
	sudo 'apt-get update && apt-get -y install mpg123'
	MPG123=`command -v mpg123`
fi

if [[ ! ${1} ]]; then
	show_help
fi

for mp3file in ${@}; do
    wavfile=${mp3file%.mp3}'.wav'
    ${MPG123} -w ${wavfile} ${mp3file}
done

exit 0
