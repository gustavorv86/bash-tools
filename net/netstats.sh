#!/bin/bash

if [[ ${1} == "-h" ]] || [[ ${1} == "--help" ]]; then
	echo "USAGE: "`basename ${0}`" [device...]"
	exit 0
fi

devices=
for dev in ${@}; do
	if [[ -d /sys/class/net/${dev} ]]; then
		devices="${devices} ${dev}"
	else
		echo "ERROR: device ${dev} not found"
		exit 1
	fi
done

if [[ ! ${devices} ]]; then
	devices=`ls /sys/class/net`
fi

for dev in ${devices}; do
	echo "---------- ${dev} ----------"
	for file in `ls /sys/class/net/${dev}/statistics`; do
		content=`cat /sys/class/net/${dev}/statistics/${file}`
		echo "  ${file}: ${content}"
	done
	echo
done

