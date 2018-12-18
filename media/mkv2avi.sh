#! /bin/bash

show_help() {
	echo "Usage: "`basename ${0}`" [file.mkv...]"
	exit 1
}

MENCODER=`command -v mencoder`

if [[ ! ${1} ]]; then
	show_help
fi

for mkvfile in "${@}"; do
	avifile=${mkvfile%.mkv}".avi"
	echo "Output: "${avifile}
	${MENCODER} "${mkvfile}" -ovc xvid -oac mp3lame -oac mp3lame -lameopts abr:br=192 -xvidencopts pass=2:bitrate=-700000 -o "${avifile}"
done

exit 0




