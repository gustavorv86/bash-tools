#! /bin/bash

show_help() {
	echo "Usage: "`basename ${0}`" [file.mp3...]"
	exit 1
}

MPG123=`command -v mpg123`

if [[ ! ${1} ]]; then
	show_help
fi

for mp3file in "${@}"; do
	wavfile=${mp3file%.mp3}".wav"
	echo "Output: "${wavfile}
	${MPG123} -w "${wavfile}" "${mp3file}"
done

exit 0
