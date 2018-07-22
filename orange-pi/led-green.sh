#!/bin/bash

if [[ ! ${1} ]]; then
	echo 'Usage: '`basename ${0}` [1|0]
	exit 1
fi

echo ${1} > '/sys/class/leds/orangepi:green:pwr/brightness'

