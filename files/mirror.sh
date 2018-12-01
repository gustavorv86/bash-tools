#!/bin/bash

if [[ ${#} -gt 2 ]]; then
	echo "USAGE: "${0}"  SOURCE_DIRECTORY  DESTINATION_DIRECTORY"
	exit 1
fi

rsync -uarqv --delete ${1}/ ${2}/
echo "Done"

