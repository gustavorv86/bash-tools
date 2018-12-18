#! /bin/bash

show_help() {
	echo "Usage: "`basename ${0}`" [file.avi...]"
	exit 1
}

FFMPEG=`command -v ffmpeg`

if [[ ! ${1} ]]; then
	show_help
fi

for avifile in "${@}"; do
	mp4file=${avifile%.avi}".mp4"
	echo "Output: "${mp4file}
	${FFMPEG} -i "${avifile}" "${mp4file}"
done

exit 0
