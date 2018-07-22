#!/bin/bash

DEFAULT_DEV=/dev/ttyUSB0
DEFAULT_BAUD=115200

if [[ ${1} ]] && [[ ${1} == '-h' ]] || [[ ${1} == '-help' ]] || [[ ${1} == '--h' ]] || [[ ${1} == '--help' ]]; then
	echo 'Usage: '`basename ${0}`' <device> <baudrate>'
	exit 0
fi

if [[ ${1} ]]; then
	DEFAULT_DEV=${1}
fi

if [[ ${2} ]]; then
        DEFAULT_BAUD=${2}
fi

COM=`command -v picocom`
if [[ ! ${COM} ]]; then
	sudo apt-get install picocom
	COM=`command -v picocom`
fi

${COM} -b ${DEFAULT_BAUD} ${DEFAULT_DEV}
