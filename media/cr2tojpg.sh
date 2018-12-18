#! /bin/bash

show_help() {
	echo "Usage: "`basename ${0}`" [file.CR2...]"
	exit 1
}

UFRAW=`command -v ufraw-batch`

if [[ ! ${1} ]]; then
	show_help
fi

for cr2file in "${@}"; do
	jpgfile=${cr2file%.CR2}".jpg"
	echo "Output: "${jpgfile}
	${UFRAW} "${cr2file}" --out-type=jpeg --output "${jpgfile}"
done

exit 0
