#! /bin/bash

show_help() {
	echo 'Usage: '`basename ${0}`' [file.mkv...]'
	exit 1
}

FFMPEG=`command -v ffmpeg`
if [[ ! ${MPG123} ]]; then
	sudo apt-get install ffmpeg
	FFMPEG=`command -v ffmpeg`
fi

if [[ ! ${1} ]]; then
	show_help
fi

for mkvfile in ${@}; do
    mp4file=${mkvfile%.CR2}'.mp4'
    ${UFRAW} ${cr2file} --out-type=jpeg --output ${jpgfile}
    ${FFMPEG} -i ${mkvfile} -codec copy ${mp4file}
done

exit 0
