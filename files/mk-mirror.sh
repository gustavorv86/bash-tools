#!/bin/bash

if [[ ! ${1} ]] || [[ ! ${2} ]]; then
	echo 'USAGE: '${0}' <source> <dest>'
	exit 1
fi

rsync -uarqv --delete ${1}/ ${2}/
echo 'Done'
