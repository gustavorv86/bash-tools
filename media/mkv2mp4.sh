#! /bin/bash

show_help() {
	echo "Usage: "`basename ${0}`" [file.mkv...]"
	exit 1
}

FFMPEG=`command -v ffmpeg`

if [[ ! ${1} ]]; then
	show_help
fi

for mkvfile in "${@}"; do
	mp4file=${mkvfile%.mkv}".mp4"
	echo "Output: "${mp4file}
	${FFMPEG} -i "${mkvfile}" -codec copy "${mp4file}"
done

exit 0

